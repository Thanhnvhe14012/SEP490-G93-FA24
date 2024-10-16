package vn.edu.fpt.quickhire.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import vn.edu.fpt.quickhire.entity.*;
import vn.edu.fpt.quickhire.entity.DTO.UserDTO;
import vn.edu.fpt.quickhire.entity.Recruiter;
import vn.edu.fpt.quickhire.model.impl.AccountServiceImpl;
import vn.edu.fpt.quickhire.model.impl.CandidateServiceImpl;
import vn.edu.fpt.quickhire.model.impl.RecruiterServiceImpl;
import vn.edu.fpt.quickhire.model.repository.ProvinceRepository;
import vn.edu.fpt.quickhire.model.repository.RoleRepository;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class LoginController {
    @Autowired
    private AccountServiceImpl userService;

    @Autowired
    private RoleRepository roleRepository;
    private RecruiterServiceImpl recruiterService;

    @Autowired
    private ProvinceRepository provinceRepository;

    private CandidateServiceImpl candidateService;

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
    public String registerUser(@ModelAttribute("user") UserDTO user, Model model) throws ParseException {
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

            Recruiter recruiter = new Recruiter();
            recruiter.setCompanyDescription(user.getCompanyDescription());
            recruiter.setCompanyScale(user.getCompanyScale());
            recruiter.setCompanyName(user.getCompanyName());


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


            Role existingRole = roleRepository.findById(Long.valueOf(3))
                    .orElseThrow(() -> new RuntimeException("Role not found"));
            Candidate candidateSaved = candidateService.save(candidate);

            UserRole userRole = new UserRole();
            userRole.setRole(existingRole);

            account.setUserRole(userRole);
            account.setCandidate(candidate);
            userService.save(account);
        }

        model.addAttribute("error", "Đăng ký thành công!");
        return "login/login";
    }


}
