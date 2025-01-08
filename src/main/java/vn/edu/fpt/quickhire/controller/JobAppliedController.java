package vn.edu.fpt.quickhire.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import vn.edu.fpt.quickhire.entity.CV;
import vn.edu.fpt.quickhire.entity.DTO.UserDTO;
import vn.edu.fpt.quickhire.entity.JobApplied;
import vn.edu.fpt.quickhire.model.impl.CVServiceImpl;
import vn.edu.fpt.quickhire.model.impl.JobAppliedServiceImpl;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/jobApplied")
public class JobAppliedController {
    @Autowired
    private JobAppliedServiceImpl jobAppliedService;

    @Autowired
    private CVServiceImpl cvService;

    @GetMapping("/viewJobApplied")
    public String showViewJobAppliedForm(@SessionAttribute(name = "user", required = false) UserDTO userDTO,
                                         Model model, HttpSession session) {
        List<JobApplied> jobApplieds = jobAppliedService.getJobAppliedByUserId(userDTO.getId());
        model.addAttribute("jobApplieds", jobApplieds);
        return "v2/viewAppliedJob";
    }

    @PostMapping("/apply")
    public ResponseEntity<String> applyForJob(
            @RequestParam("jobID") Long jobID,
            @RequestParam("message") String message,
            @RequestParam("cv") MultipartFile file,
            @SessionAttribute(name = "user", required = false) UserDTO userDTO) {

        try {

            //Handle validate user is logged as candidate
            CV cv = new CV();
            cv.setFileName(file.getOriginalFilename());
            cv.setAccountId(userDTO.getId());
            cvService.save(cv, file);

            JobApplied jobApplied = new JobApplied();
            jobApplied.setUserID(userDTO.getId());
            jobApplied.setJobID(jobID);
            jobApplied.setCvID(cv.getId());
            jobApplied.setMessage(message);

            jobAppliedService.save(jobApplied);

            return ResponseEntity.status(HttpStatus.CREATED).body("Application submitted successfully!");
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error saving the CV file.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An error occurred while processing your application.");
        }
    }

}
