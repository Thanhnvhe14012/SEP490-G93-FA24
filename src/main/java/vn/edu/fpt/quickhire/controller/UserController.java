package vn.edu.fpt.quickhire.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import vn.edu.fpt.quickhire.entity.DTO.AccountDTO;
import vn.edu.fpt.quickhire.model.AccountService;

import java.util.List;

@Controller
public class UserController {
    @Autowired
    AccountService accountService;

    @GetMapping("/listUser")
    public String showListUserForm(HttpSession session,
                                   Model model) {
        List<AccountDTO> lstAccount = accountService.fillAllAccount();
        model.addAttribute("accounts", lstAccount);
        return "admin/listaccounts";
    }
}
