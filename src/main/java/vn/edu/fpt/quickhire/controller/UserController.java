package vn.edu.fpt.quickhire.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import vn.edu.fpt.quickhire.entity.Account;
import vn.edu.fpt.quickhire.entity.DTO.AccountDTO;
import vn.edu.fpt.quickhire.entity.DTO.PasswordRequestDTO;
import vn.edu.fpt.quickhire.entity.DTO.UserDTO;
import vn.edu.fpt.quickhire.model.AccountService;
import vn.edu.fpt.quickhire.model.repository.AccountRepository;
import vn.edu.fpt.quickhire.model.repository.StaffRepository;

import java.text.ParseException;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    AccountService accountService;

    @Autowired
    AccountRepository accountRepository;

    @Autowired
    StaffRepository staffRepository;

    @GetMapping("/listUser")
    public String showListUserForm(HttpSession session,
                                   Model model) {
        List<AccountDTO> lstAccount = accountService.fillAllAccount();
        model.addAttribute("accounts", lstAccount);
        return "admin/listaccounts";
    }

    @GetMapping("/listStaff")
    public String showListStaffForm(@SessionAttribute(name = "user", required = false) UserDTO userDTO,
                                    Model model) {
        List<AccountDTO> lstAccount = accountService.fillAllStaffByRecruiterId(userDTO.getId());
        model.addAttribute("accounts", lstAccount);
        return "admin/liststaff";
    }

    @GetMapping("/my-profile-recruiter")
    public String showMyProfileForm(@SessionAttribute(name = "user", required = false) UserDTO user, Model model) {

        if (user.getRole() == 2) {
            model.addAttribute("user", user);
            return "recruiter/myprofile";
        } else return "redirect:/login";
    }

    @PostMapping("/saveAccountInfor")
    public String saveAccountInfo(@RequestBody UserDTO userProfileDTO) throws ParseException {

        // Validate and save user profile (e.g., via service)
        accountService.updateAccount(userProfileDTO);
        return "redirect:/my-profile-recruiter";

    }

    @PostMapping("/update-password")
    public String updatePassword(@RequestBody PasswordRequestDTO passwordRequest, @SessionAttribute(name = "user", required = false) UserDTO user, Model model) {

        Account account = accountService.findUserById(user.getId());
        if (passwordRequest.getCurrentPassword().equals(account.getPassword())) {
            account.setPassword(passwordRequest.getNewPassword());
            accountService.save(account);
            model.addAttribute("user", user);
            return "recruiter/myprofile";
        }
        else return "redirect:/error";


    }
}
