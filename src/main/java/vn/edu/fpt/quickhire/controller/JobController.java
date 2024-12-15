package vn.edu.fpt.quickhire.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import vn.edu.fpt.quickhire.entity.DTO.UserDTO;
import vn.edu.fpt.quickhire.entity.Industry;
import vn.edu.fpt.quickhire.entity.Job;
import vn.edu.fpt.quickhire.model.impl.IndustryServiceImpl;
import vn.edu.fpt.quickhire.model.impl.JobServiceImpl;

import java.util.List;


@Controller
@RequestMapping("/job")
public class JobController {
    @Autowired
    private JobServiceImpl jobService;
    @Autowired
    private IndustryServiceImpl industryService;

    @GetMapping("/create")
    public String showCreateJobForm() {
        return "job/createJob";
    }

    @PostMapping("/create")
    public ResponseEntity<Job>  createJob(
            @RequestBody Job jobDTO, HttpSession session
    )
    {
        UserDTO user = (UserDTO) session.getAttribute("user");
        Long accountId = user.getId();
        if (accountId == null) {
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
        }

        Job createdJob = jobService.createJob(jobDTO, accountId);
        return new ResponseEntity<>(createdJob, HttpStatus.CREATED);
    }

    @GetMapping()
    public String getAllJobs(Model model) {
        List<Job> jobs = jobService.getAllJobs();
        List<Industry> industries = industryService.getAllIndustries();
        System.out.println(jobs.get(0).getRecruiter());
        model.addAttribute("jobs", jobs);
        model.addAttribute("industries", industries);
        return "job/listJob";
    }

    @GetMapping("/search")
    public String searchJobs(@RequestParam(value = "name", required = false) String name,
                             @RequestParam(value = "industryId", required = false) Long industryId,
                             @RequestParam(value = "location", required = false) String location,
                             Model model) {
        List<Job> jobs = jobService.searchJobs(name, industryId, location);
        model.addAttribute("jobs", jobs);
        model.addAttribute("searchName", name);
        model.addAttribute("searchIndustryId", industryId);
        model.addAttribute("searchLocation", location);
        return "job/listJob";
    }
}
