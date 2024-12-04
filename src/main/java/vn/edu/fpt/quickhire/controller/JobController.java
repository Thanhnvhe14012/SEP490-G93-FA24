package vn.edu.fpt.quickhire.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import vn.edu.fpt.quickhire.entity.Handbook;
import vn.edu.fpt.quickhire.entity.Job;
import vn.edu.fpt.quickhire.model.impl.JobServiceImpl;

import java.util.List;
import java.util.Locale;


@Controller
@RequestMapping("/job")
public class JobController {
    @Autowired
    private JobServiceImpl jobService;

    @GetMapping("/create")
    public String showCreateJobForm() {
        return "job/createJob";
    }

    @PostMapping("/create")
    public ResponseEntity<Job>  createJob(
            @RequestBody Job jobDTO, HttpSession session
    )
    {
        Long accountId = (Long) session.getAttribute("accountId");
        if (accountId == null) {
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
        }

        Job createdJob = jobService.createJob(jobDTO, accountId);
        return new ResponseEntity<>(createdJob, HttpStatus.CREATED);
    }

}
