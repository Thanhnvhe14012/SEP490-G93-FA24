package vn.edu.fpt.quickhire.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import vn.edu.fpt.quickhire.entity.Account;
import vn.edu.fpt.quickhire.entity.Candidate;
import vn.edu.fpt.quickhire.entity.DTO.UserDTO;
import vn.edu.fpt.quickhire.entity.Recruiter;
import vn.edu.fpt.quickhire.model.impl.AccountServiceImpl;
import vn.edu.fpt.quickhire.model.impl.CandidateServiceImpl;
import vn.edu.fpt.quickhire.model.impl.RecruiterServiceImpl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping(path="Products")
public class LoginController {
    @Autowired
    private AccountServiceImpl userService;

    @Autowired
    private RecruiterServiceImpl recruiterService;

    @Autowired
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

        Account account = userService.login(username, password);
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
        return "login/register";
    }
    
    @PostMapping("/register")
    public String registerUser(@ModelAttribute("user") UserDTO user, Model model) throws ParseException {
        if (!userService.checkRegister(user.getUsername())) {
            model.addAttribute("error", "Tài khoản đã tồn tại");
            return "login/register";
        }
        if (user.getAccountType() == 2) {
            Account account = new Account();
            account.setUsername(user.getUsername());
            account.setPassword(user.getPassword());
            account.setAccount_type(user.getAccountType());
            account.setEmail(user.getEmail());
            account.setName(user.getName());
            Date dob=new SimpleDateFormat("yyyy-MM-dd").parse(user.getDateOfBirth());

            account.setDateOfBirth(dob);

            Account accountSaved = userService.save(account);
            Recruiter recruiter = new Recruiter();
            recruiter.setId(accountSaved.getId());
            recruiter.setCompanyDescription(user.getCompanyDescription());
            recruiter.setCompanyScale(user.getCompanyScale());

            Recruiter recruiterSaved = recruiterService.saveRecruiter(recruiter);

        } else if (user.getAccountType() == 3) {
            Account account = new Account();
            account.setUsername(user.getUsername());
            account.setPassword(user.getPassword());
            account.setAccount_type(user.getAccountType());
            account.setEmail(user.getEmail());
            account.setName(user.getName());
            Date dob=new SimpleDateFormat("yyyy-MM-dd").parse(user.getDateOfBirth());

            account.setDateOfBirth(dob);

            Account accountSaved = userService.save(account);
            Candidate candidate = new Candidate();
            candidate.setId(accountSaved.getId());
            candidate.setBiography(user.getBiography());

            Candidate candidateSaved = candidateService.save(candidate);
        }

        model.addAttribute("error", "Đăng ký thành công!");
        return "login/login";
    }


}
