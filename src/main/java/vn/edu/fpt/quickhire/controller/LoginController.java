package vn.edu.fpt.quickhire.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import vn.edu.fpt.quickhire.entity.*;
import vn.edu.fpt.quickhire.entity.DTO.UserDTO;
import vn.edu.fpt.quickhire.model.FileUploadService;
import vn.edu.fpt.quickhire.model.impl.AccountServiceImpl;
import org.springframework.mail.javamail.JavaMailSender;
import vn.edu.fpt.quickhire.model.impl.RecruiterServiceImpl;
import vn.edu.fpt.quickhire.model.repository.DistrictRepository;
import vn.edu.fpt.quickhire.model.repository.PasswordResetRepository;
import vn.edu.fpt.quickhire.model.repository.ProvinceRepository;
import vn.edu.fpt.quickhire.model.repository.WardRepository;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.Random;

@Controller
public class LoginController {
    @Autowired
    private AccountServiceImpl userService;

    @Autowired
    private ProvinceRepository provinceRepository;

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private PasswordResetRepository passwordResetRepository;

    @Autowired
    private FileUploadService fileUploadService;

    @Autowired
    RecruiterServiceImpl recruiterService;
    @Autowired
    private DistrictRepository districtRepository;
    @Autowired
    private WardRepository wardRepository;

    // Hiển thị form đăng nhập
    @GetMapping("/login")
    public String showLoginForm() {
        return "login/login";
    }

    // Xử lý quá trình đăng nhập
    @PostMapping("/login")
    public String login(@RequestParam("username") String username,
                        @RequestParam("password") String password,
                        HttpSession session,
                        Model model) {

        UserDTO account = userService.login(username, password);
        if (account != null) {
            session.setAttribute("user", account);
            session.setAttribute("userDisplayName", account.getDisplayName());
            if (account.getRole() == 4){
                return "redirect:/";
            }
            else if (account.getRole() == 3){
                return "redirect:/job/viewJobCreated";
            }
            else return "redirect:/";
        } else {
            // Đăng nhập thất bại
            model.addAttribute("error", "Invalid username or password");
            return "login/login";
        }
    }

    @GetMapping("/sign-out")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "redirect:/";
    }

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new UserDTO());
        List<Province> provinces = provinceRepository.findAll();

        // Đưa danh sách tỉnh vào model để sử dụng trong JSP
        model.addAttribute("provinces", provinces);
        return "login/register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute("user") UserDTO user, Model model,@RequestParam("image") MultipartFile image
    ) throws ParseException, IOException {
        if (!userService.checkRegister(user.getUsername())) {
            model.addAttribute("error", "Tài khoản đã tồn tại");
            return "login/register";
        }
        Account account = new Account();
        if(!image.isEmpty()){
            String uploadedFileUrl = fileUploadService.uploadFile(image);
            if (uploadedFileUrl != null && !uploadedFileUrl.isEmpty()) {
                account.setAvatar(uploadedFileUrl);
                // CV file uploaded successfully
                System.out.println("CV uploaded cloud successfully. File URL: " + uploadedFileUrl);
            }else {
                System.out.println("CV uploaded cloud failed");
            }
        }
        account.setUsername(user.getUsername());
        account.setPassword(user.getPassword());
        account.setEmail(user.getEmail());
        account.setPhoneNumber(user.getPhoneNumber());

        account.setAddressId1(user.getAddressId1());
        account.setAddressId2(user.getAddressId2());
        account.setAddressId3(user.getAddressId3());
        account.setAddress(user.getAddress());
        if (user.getRole() == 2) {
            Recruiter existRecruiter= recruiterService.findByCode(user.getCompanyCode());
            if(existRecruiter != null) {
                model.addAttribute("message", "Tạo tài khoản nhà tuyển dụng không thành công. Mã công ty đã trùng lặp");
                model.addAttribute("messageType", "error");
                return "login/register";
            }

            Recruiter recruiter = new Recruiter();
            recruiter.setCompanyCode(user.getCompanyCode());
            recruiter.setCompanyDescription(user.getCompanyDescription());
            recruiter.setCompanyScale(user.getCompanyScale());
            recruiter.setCompanyName(user.getCompanyName());

            recruiter.setCompany_status(1);
            account.setRecruiter(recruiter);
            account.setRole(2L);
            userService.save(account);

            Province province = provinceRepository.findByCode(account.getAddressId1());
            District district = districtRepository.findByCode(account.getAddressId2());
            Ward ward = wardRepository.findByCode(account.getAddressId3());

            String companyLocation = account.getAddress() + ", " + String.format("%s, %s, %s",
                    ward != null ? ward.getName() : "",
                    district != null ? district.getName() : "",
                    province != null ? province.getName() : ""
            );


            recruiter.setCompany_location(companyLocation);
            recruiterService.save(recruiter);

        } else if (user.getRole() == 3) {
            Date dob=new SimpleDateFormat("yyyy-MM-dd").parse(user.getDateOfBirth());
            account.setDateOfBirth(dob);
            account.setFirstName(user.getFirstName());
            account.setMiddleName(user.getMiddleName());
            account.setLastName(user.getLastName());
            Candidate candidate = new Candidate();
            candidate.setBiography(user.getBiography());
            account.setCandidate(candidate);
            account.setRole(4L);
            userService.save(account);
        }

        model.addAttribute("error", "Đăng ký thành công!");
        return "login/login";
    }


    @GetMapping("/forgot-password")
    public String showForgotPasswordPage() {
        return "login/forgot-password";
    }

    @PostMapping("/forgot-password")
    public String sendVerificationCode(@RequestParam("email") String email, Model model) {
        String verificationCode = String.format("%06d", new Random().nextInt(999999));
        LocalDateTime expiryTime = LocalDateTime.now().plusMinutes(5);
        // Lưu mã xác nhận vào bảng password_reset
        PasswordReset reset = new PasswordReset(email, verificationCode, expiryTime);
        passwordResetRepository.save(reset);

        // Gửi email
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email);
        message.setSubject("Xác nhận quên mật khẩu");
        message.setText("Mã xác nhận của bạn là: " + verificationCode + ". Mã này có hiệu lực trong 5 phút.");
        mailSender.send(message);
        model.addAttribute("email", email);

        return "login/verify-code";
    }

    @PostMapping("/verify-code")
    public String verifyCode(@RequestParam("email") String email, @RequestParam("code") String code, Model model) {
        Optional<PasswordReset> resetOpt = passwordResetRepository.findByEmail(email);
        if (resetOpt.isPresent()) {
            PasswordReset reset = resetOpt.get();

            // Kiểm tra mã xác nhận và thời gian hết hạn
            if (reset.getVerificationCode().equals(code) && reset.getExpiryTime().isAfter(LocalDateTime.now())) {
                model.addAttribute("email", email);
                return "login/reset-password";
            } else {
                model.addAttribute("error", "Mã xác nhận không hợp lệ hoặc đã hết hạn.");
                return "login/verify-code";
            }
        } else {
            model.addAttribute("error", "Không tìm thấy yêu cầu đặt lại mật khẩu cho email này.");
            return "login/verify-code";
        }
    }

    @PostMapping("/reset-password")
    public String resetPassword(@RequestParam("email") String email, @RequestParam("password") String newPassword, Model model) {
        Optional<Account> userOpt = userService.findByEmail(email);

        if (userOpt.isPresent()) {
            Account user = userOpt.get();
            user.setPassword(newPassword); // Cập nhật mật khẩu mới
            userService.save(user);
            model.addAttribute("error", "Thay đổi mật khẩu thành công");
            return "login/login";
        } else {
            model.addAttribute("error", "Không tìm thấy tài khoản để đặt lại mật khẩu.");
            return "login/login";
        }
    }

    @GetMapping("/account/update")
    public String showFormUpdateAccount(Model model, @RequestParam(value = "accountId", required = false) Long accountId,
                                        @SessionAttribute(name = "user", required = false) UserDTO userDTO) {

        if(userDTO.getRole()==2 && userDTO.getId().equals(accountId)){
            model.addAttribute("user",userDTO);
            return "recruiter/updateprofile";
        }


        return "homepage";



    }


}