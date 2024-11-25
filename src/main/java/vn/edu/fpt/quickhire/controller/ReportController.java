package vn.edu.fpt.quickhire.controller;

import jakarta.servlet.http.HttpSession;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import vn.edu.fpt.quickhire.entity.*;
import vn.edu.fpt.quickhire.entity.DTO.StaffDTO;
import vn.edu.fpt.quickhire.entity.DTO.UserDTO;
import vn.edu.fpt.quickhire.model.FileUploadService;
import vn.edu.fpt.quickhire.model.impl.*;
import vn.edu.fpt.quickhire.model.repository.IndustryRepository;
import vn.edu.fpt.quickhire.model.repository.ProvinceRepository;
import vn.edu.fpt.quickhire.model.repository.RoleRepository;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.function.Function;
import java.util.stream.Collectors;

@Controller
public class ReportController {

    @Autowired
    private JobServiceImpl jobService;

    @Autowired
    private ReportServiceImpl reportService;

    @Autowired
    private CandidateServiceImpl candidateService;

    @GetMapping("/report/addReport/{jobId}")
    public String addReport(HttpSession session, @PathVariable long jobId, Model model) {
        UserDTO userDTO = (UserDTO) session.getAttribute("user");
        if (userDTO == null) {
            // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
            return "redirect:/login";
        }
        if (userDTO.getRole() == 3) {
            Job job = jobService.GetJobById(jobId);
            model.addAttribute("jobName", job.getName());
            model.addAttribute("jobId", job.getId());
            return "report/addReport";
        }
        return "homepage";
    }
    
    @PostMapping("/report/addReport")
    public String addReport(
            Report report,
            Model model,
            HttpSession session,
            @RequestParam long jobID) {

        UserDTO userDTO = (UserDTO) session.getAttribute("user");
        // Kiểm tra nếu user chưa đăng nhập
        if (userDTO == null) {
            return "redirect:/login";
        }
        if (userDTO.getRole() == 3) {
            Optional<Candidate> candidate = candidateService.findByAccountId(userDTO.getId());
            if (candidate.isPresent()) {
                report.setCandidate(candidate.get());
            }
            Job job = jobService.GetJobById(jobID);
            report.setJob(job);
            report.setReportStatus(1);
            try {
                reportService.save(report);
                model.addAttribute("report", "Tạo report thành công");
                return "job/list";
            } catch (Exception e) {
                model.addAttribute("error", "Đã xảy ra lỗi khi tạo report");
                return "report/addReport";
            }
        }
        return "homepage";
    }

}