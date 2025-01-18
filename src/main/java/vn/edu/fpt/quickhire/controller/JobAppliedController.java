package vn.edu.fpt.quickhire.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import vn.edu.fpt.quickhire.entity.CV;
import vn.edu.fpt.quickhire.entity.DTO.UserDTO;
import vn.edu.fpt.quickhire.entity.JobApplied;
import vn.edu.fpt.quickhire.model.impl.CVServiceImpl;
import vn.edu.fpt.quickhire.model.impl.FileUploadServiceImpl;
import vn.edu.fpt.quickhire.model.impl.JobAppliedServiceImpl;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/jobApplied")
public class JobAppliedController {
    @Autowired
    private JobAppliedServiceImpl jobAppliedService;

    @Autowired
    private CVServiceImpl cvService;

    @Autowired
    private FileUploadServiceImpl fileUploadService;

    @GetMapping("/viewJobApplied")
    public String showViewJobAppliedForm(@SessionAttribute(name = "user", required = false) UserDTO userDTO,
                                         Model model, HttpSession session) {
        List<JobApplied> jobApplieds = jobAppliedService.getJobAppliedByUserId(userDTO.getId());
        model.addAttribute("jobApplieds", jobApplieds);
        return "v2/viewAppliedJob";
    }

    @PostMapping("/apply")
    public String applyForJob(
            @RequestParam("jobID") Long jobID,
            @RequestParam("message") String message,
            @RequestParam("cv") MultipartFile file,
            @SessionAttribute(name = "user", required = false) UserDTO userDTO,
            RedirectAttributes redirectAttributes) {

        try {
            //Handle validate user is logged as candidate
            if (userDTO == null) {
                return "redirect:/login";
            } else if (userDTO.getRole() != 4) {
                redirectAttributes.addFlashAttribute("errorMessage", "Bạn không có quyền ứng tuyển cho công việc này.");
                return "redirect:/job/jobDetail?id=" + jobID;
            }

            // Upload CV file to Cloudinary
            String uploadedFileUrl = fileUploadService.uploadFile(file);
            if (uploadedFileUrl != null && !uploadedFileUrl.isEmpty()) {
                // CV file uploaded successfully
                System.out.println("CV uploaded cloud successfully. File URL: " + uploadedFileUrl);
            }else {
                System.out.println("CV uploaded cloud failed");
            }
//            In case you want to keep file content in database
//            byte[] fileBytes = file.getBytes();
//            cv.setFileContent(fileBytes);
            CV cv = new CV();
            cv.setFileName(uploadedFileUrl);
            cv.setAccountId(userDTO.getId());
            cvService.save(cv, file);

            JobApplied jobApplied = new JobApplied();
            jobApplied.setUserID(userDTO.getId());
            jobApplied.setJobID(jobID);
            jobApplied.setCvID(cv.getId());
            jobApplied.setMessage(message);
            jobApplied.setStatus(1);

            jobAppliedService.save(jobApplied);

            return "redirect:/job/jobDetail?id=" + jobID;
        } catch (IOException e) {
            return "redirect:/error";
        } catch (Exception e) {
            return "redirect:/error";
        }
    }

    @PostMapping("/unapply")
    public String unapplyJob(@RequestParam("jobID") long jobID, @SessionAttribute(name = "user", required = false) UserDTO userDTO, RedirectAttributes redirectAttributes) {
        boolean success = jobAppliedService.unapplyForJob(jobID, userDTO.getId());
        if (userDTO != null) {
            if (success) {
                redirectAttributes.addFlashAttribute("message", "Bạn đã rút hồ sơ thành công.");
            } else {
                redirectAttributes.addFlashAttribute("errorMessage", "Có lỗi xảy ra khi rút hồ sơ. Vui lòng thử lại.");
            }
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "Bạn cần đăng nhập để thực hiện hành động này.");
            return "redirect:/login";
        }

        return "redirect:/job/jobDetail?id=" + jobID;
    }

    @PostMapping("/updateStatus")
    public String updateStatus(
            @RequestParam("applicationId") Long applicationId,
            @RequestParam("newStatus") Integer newStatus,
            RedirectAttributes redirectAttributes) {

        Optional<JobApplied> optionalJobApplied = jobAppliedService.findById(applicationId);

        if (optionalJobApplied.isPresent()) {
            JobApplied jobApplied = optionalJobApplied.get();
            jobApplied.setStatus(newStatus);
            jobAppliedService.save(jobApplied);
            redirectAttributes.addFlashAttribute("message", "Trạng thái hồ sơ đã được cập nhật thành công.");
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "Không tìm thấy hồ sơ ứng tuyển.");
        }

        return "redirect:/job/viewJobDetailRecruiter?id?=" + optionalJobApplied.orElse(null).getJobID();
    }

}
