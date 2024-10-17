package vn.edu.fpt.quickhire.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class JobController {
    //JobController
    @GetMapping("/job/create")
    public String home(HttpSession session, Model model) {

        return "job/createJob";
    }

    @GetMapping("/job/edit")
    public String editJob(HttpSession session, Model model){
        // Tìm kiếm công việc bằng ID (giả sử có phương thức getJobById trong service)
        return "job/editJob"; // Trả về view editJob
    }

    @GetMapping("/job/save")
    public String saveJob(HttpSession session, Model model){
        // Tìm kiếm công việc bằng ID (giả sử có phương thức getJobById trong service)
        return "job/saveJob"; // Trả về view editJob
    }

    @GetMapping("/job/apply")
    public String applyJob(HttpSession session, Model model){
        // Tìm kiếm công việc bằng ID (giả sử có phương thức getJobById trong service)
        return "job/applyJob"; // Trả về view editJob
    }
}
