package vn.edu.fpt.quickhire.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import vn.edu.fpt.quickhire.entity.*;
import vn.edu.fpt.quickhire.entity.DTO.UserDTO;
import vn.edu.fpt.quickhire.model.FileUploadService;
import vn.edu.fpt.quickhire.model.impl.AccountServiceImpl;
import org.springframework.mail.javamail.JavaMailSender;
import vn.edu.fpt.quickhire.model.impl.RecruiterServiceImpl;
import vn.edu.fpt.quickhire.model.repository.PasswordResetRepository;
import vn.edu.fpt.quickhire.model.repository.ProvinceRepository;
import vn.edu.fpt.quickhire.model.repository.RoleRepository;

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
    private RoleRepository roleRepository;

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
            return "redirect:/home";
        } else {
            // Đăng nhập thất bại
            model.addAttribute("error", "Invalid username or password");
            return "login/login";
        }
    }

    @GetMapping("/sign-out")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "redirect:/home";
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
    ) throws ParseException {
        if (!userService.checkRegister(user.getUsername())) {
            model.addAttribute("error", "Tài khoản đã tồn tại");
            return "login/register";
        }
        if (user.getRole() == 2) {
            Account account = new Account();
            account.setUsername(user.getUsername());
            account.setPassword(user.getPassword());
            account.setEmail(user.getEmail());

            account.setAddressId1(user.getAddressId1());
            account.setAddressId2(user.getAddressId2());
            account.setAddressId3(user.getAddressId3());
            account.setAddress(user.getAddress());

//            Account accountSaved = userService.save(account);

            Recruiter existRecruiter= recruiterService.findByCode(user.getCompanyCode());
            if(existRecruiter != null) {
                model.addAttribute("message", "Failed to add recruiter . Company Code duplicate.");
                model.addAttribute("messageType", "error");
                return "login/register";
            }

            Recruiter recruiter = new Recruiter();
            recruiter.setCompanyCode(user.getCompanyCode());
            recruiter.setCompanyDescription(user.getCompanyDescription());
            recruiter.setCompanyScale(user.getCompanyScale());
            recruiter.setCompanyName(user.getCompanyName());
            if (image!= null && !image .isEmpty()) {
                try {
                    String imageUrl = fileUploadService.UploadFile(image);
                    recruiter.setCompany_logo(imageUrl);
                } catch (IOException e) {
                    // Handle the exception properly, log it, etc.
                    e.printStackTrace();
                }
            }
            recruiter.setCompany_status(1);

            Role existingRole = roleRepository.findById(Long.valueOf(2))
                    .orElseThrow(() -> new RuntimeException("Role not found"));

            UserRole userRole = new UserRole();
            userRole.setRole(existingRole);


            account.setUserRole(userRole);
            account.setRecruiter(recruiter);
            userService.save(account);



        } else if (user.getRole() == 3) {
            Account account = new Account();
            account.setUsername(user.getUsername());
            account.setPassword(user.getPassword());
            account.setEmail(user.getEmail());
            Date dob=new SimpleDateFormat("yyyy-MM-dd").parse(user.getDateOfBirth());
            account.setDateOfBirth(dob);
            account.setFirstName(user.getFirstName());
            account.setMiddleName(user.getMiddleName());
            account.setLastName(user.getLastName());
            account.setAddressId1(user.getAddressId1());
            account.setAddressId2(user.getAddressId2());
            account.setAddressId3(user.getAddressId3());
            account.setAddress(user.getAddress());

//            Account accountSaved = userService.save(account);

            Candidate candidate = new Candidate();
            candidate.setBiography(user.getBiography());


            Role existingRole = roleRepository.findById(Long.valueOf(4))
                    .orElseThrow(() -> new RuntimeException("Role not found"));

            UserRole userRole = new UserRole();
            userRole.setRole(existingRole);

            account.setUserRole(userRole);
            account.setCandidate(candidate);
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


}