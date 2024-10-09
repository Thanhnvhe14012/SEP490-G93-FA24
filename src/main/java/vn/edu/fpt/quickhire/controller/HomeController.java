package vn.edu.fpt.quickhire.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @GetMapping("/home")
    public String home(HttpSession session, Model model) {
        // Lấy username từ session
        String username = (String) session.getAttribute("username");

        // Kiểm tra nếu có username trong session
        if (username != null) {
            model.addAttribute("username", username);
        }

        // Trả về trang home.jsp
        return "homepage";
    }
}
