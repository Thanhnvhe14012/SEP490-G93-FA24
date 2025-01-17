package vn.edu.fpt.quickhire.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import vn.edu.fpt.quickhire.entity.*;
import vn.edu.fpt.quickhire.entity.DTO.UserDTO;
import vn.edu.fpt.quickhire.model.impl.*;

import java.util.List;

@Controller
public class ReportController {

    @Autowired
    private JobServiceImpl jobService;

    @Autowired
    private ReportServiceImpl reportService;

    @Autowired
    private CandidateServiceImpl candidateService;

//    @GetMapping("/report/addReport/{jobId}")
//    public String addReport(HttpSession session, @PathVariable long jobId, Model model) {
//        UserDTO userDTO = (UserDTO) session.getAttribute("user");
//        if (userDTO == null) {
//            return "redirect:/login";
//        }
//        if (userDTO.getRole() == 3) {
//            Job job = jobService.GetJobById(jobId);
//            model.addAttribute("jobName", job.getName());
//            model.addAttribute("jobId", job.getId());
//            return "report/addReport";
//        }
//        return "homepage";
//    }

//    @PostMapping("/report/addReport")
//    public String addReport(
//            Report report,
//            Model model,
//            HttpSession session,
//            @RequestParam long jobID) {
//
//        UserDTO userDTO = (UserDTO) session.getAttribute("user");
//        // Kiểm tra nếu user chưa đăng nhập
//        if (userDTO == null) {
//            return "redirect:/login";
//        }
//        if (userDTO.getRole() == 3) {
//            Optional<Candidate> candidate = candidateService.findByAccountId(userDTO.getId());
//            if (candidate.isPresent()) {
//                report.setCandidate(candidate.get());
//            }
//            Job job = jobService.GetJobById(jobID);
//            report.setJob(job);
//            report.setReportStatus(1);
//            try {
//                reportService.save(report);
//                model.addAttribute("report", "Tạo report thành công");
//                return "job/list";
//            } catch (Exception e) {
//                model.addAttribute("error", "Đã xảy ra lỗi khi tạo report");
//                return "report/addReport";
//            }
//        }
//        return "homepage";
//    }


    @GetMapping("/report/listReport")
    public String listReport(HttpSession session, Model model) {
        UserDTO userDTO = (UserDTO) session.getAttribute("user");
         if (userDTO == null) {
            return "redirect:/login";
        }
        if (userDTO.getRole() == 1) {
            List<Report> listReport = reportService.findAll();
            model.addAttribute("listReport", listReport);
            return "report/listReport";
        }
        return "homepage";
    }

    @GetMapping("/detailReport/{id}")
    public String findById(HttpSession session, @PathVariable long id, Model model) {
        UserDTO userDTO = (UserDTO) session.getAttribute("user");
        if (userDTO == null) {
            return "redirect:/login";
        }
        if (userDTO.getRole() == 1) {
            Report r = reportService.findById(id);
            if (r == null) {
                model.addAttribute("msg", "Report not found");
                return "report/listReport";
            }
            model.addAttribute("report", r);
            return "report/detailReport";
        }
        return "homepage";
    }

    @DeleteMapping("/deleteOrRestoreReport/{id}")
    public ResponseEntity<String> deleteOrRestoreReport(@PathVariable long id) {
        try {
            Report existingReport = reportService.findById(id);
            if (existingReport !=null) {
                // Change the company status
                if (existingReport.getReportStatus() == 1) {
                    existingReport.setReportStatus(0);
                    reportService.save(existingReport);
                    return ResponseEntity.ok("Report deleted successfully.");
                } else if (existingReport.getReportStatus() == 0) {
                    existingReport.setReportStatus(1);
                    reportService.save(existingReport);
                    return ResponseEntity.ok("Report restored successfully.");
                }
            }
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Report not found.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to update the Report status.");
        }

    }


}