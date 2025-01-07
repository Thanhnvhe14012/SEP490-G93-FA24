package vn.edu.fpt.quickhire.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import vn.edu.fpt.quickhire.entity.DTO.AccountDTO;
import vn.edu.fpt.quickhire.entity.DTO.UserDTO;
import vn.edu.fpt.quickhire.model.AccountService;
import vn.edu.fpt.quickhire.model.repository.AccountRepository;
import vn.edu.fpt.quickhire.model.repository.StaffRepository;

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
}
