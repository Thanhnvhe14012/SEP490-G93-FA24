package vn.edu.fpt.quickhire.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RecruiterHomeController {
    @GetMapping("/recruiter/home")
    public String recruiterHome(HttpSession session,Model model) {
        // Truyền dữ liệu vào trang home, ví dụ thống kê, danh sách công việc
        model.addAttribute("totalJobs", 10); // Số lượng công việc đăng tuyển
        model.addAttribute("newApplicants", 5); // Số lượng ứng viên mới

        return "recruiter/recruiterHome"; // Trả về trang home của nhà tuyển dụng
    }
}
