package vn.edu.fpt.quickhire.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import vn.edu.fpt.quickhire.entity.DTO.UserDTO;
import vn.edu.fpt.quickhire.entity.Industry;
import vn.edu.fpt.quickhire.entity.Job;
import vn.edu.fpt.quickhire.entity.JobApplied;
import vn.edu.fpt.quickhire.entity.Province;
import vn.edu.fpt.quickhire.model.impl.IndustryServiceImpl;
import vn.edu.fpt.quickhire.model.impl.JobServiceImpl;
import vn.edu.fpt.quickhire.model.repository.JobAppliedRepository;
import vn.edu.fpt.quickhire.model.repository.ProvinceRepository;

import java.util.List;


@Controller
@RequestMapping("/job")
public class JobController {
    @Autowired
    private JobServiceImpl jobService;
    @Autowired
    private IndustryServiceImpl industryService;
    @Autowired
    private ProvinceRepository provinceRepository;

    @Autowired
    private JobAppliedRepository jobAppliedRepository;

    @GetMapping("/create")
    public String showCreateJobForm(Model model, HttpSession session) {
        UserDTO user = (UserDTO) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        if (user.getRole() != 3) {
            return "redirect:/home";
        }
        model.addAttribute("job", new Job());
        List<Industry> industries = industryService.getAllIndustries();
        model.addAttribute("industries", industries);
        return "job/createJob";
    }

    @PostMapping("/create")
    public ResponseEntity<Job> createJob(
            @ModelAttribute Job jobDTO, HttpSession session
    ) {
        UserDTO user = (UserDTO) session.getAttribute("user");
        Long accountId = user.getId();
        System.out.println("Session user: " + accountId);
        if (accountId == null) {
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
        }

        Job createdJob = jobService.createJob(jobDTO, accountId);
        return new ResponseEntity<>(createdJob, HttpStatus.CREATED);
    }

    @GetMapping("/list")
    public String listAllJobs(Model model) {
        List<Job> jobs = jobService.getAllJobs();
        List<Industry> industries = industryService.getAllIndustries();
        List<Province> provinces = provinceRepository.findAll();
        model.addAttribute("jobs", jobs);
        model.addAttribute("industries", industries);
        model.addAttribute("provinces", provinces);
        return "job/listJob"; // Return the main job listing JSP
    }

    @GetMapping("/searchJobs")
    public String searchJobs(
            @RequestParam(required = false) String name,
            @RequestParam(required = false) String address,
            @RequestParam(required = false) Long industryId,
            @RequestParam(required = false) Integer salaryMin,
            @RequestParam(required = false) Integer salaryMax,
            @RequestParam(required = false) Integer level,
            @RequestParam(required = false) Integer type,
            @RequestParam(defaultValue = "createdDate") String sortBy,
            Model model) {

        Sort sort = Sort.by(sortBy.equals("name") ? Sort.Direction.ASC : Sort.Direction.DESC, "start");
        List<Job> jobs = jobService.searchJobs(name, address, industryId, salaryMin, salaryMax, level, type, sort);
        System.out.println("name: " + name + " Address: " + address + " industry: " + industryId + " salarymin: " + salaryMin + " salarymax: " + salaryMax + " level: " + level + " type: "+ type);
        model.addAttribute("jobs", jobs);

        return "job/jobListingsFragment";
    }


    @GetMapping("/editJob")
    public String showEditJobForm(@RequestParam(required = false) long id, Model model, HttpSession session) {
        Job job = jobService.getJobById(id);
        model.addAttribute("job", job );
        return "v2/editjob";
    }

    @GetMapping("/viewJobDetailRecruiter")
    public String showViewJobDetailRecruiterForm(@RequestParam(required = false) long id,
                                                 Model model, HttpSession session) {
        Job job = jobService.getJobById(id);
        List<JobApplied> jobApplieds = jobAppliedRepository.findAllByJobID(id);
        model.addAttribute("job", job );
        model.addAttribute("listCV", jobApplieds);
        return "v2/viewJobDetailRecruiter";
    }

    @GetMapping("/viewJobCreated")
    public String showViewJobCreatedListForm(@RequestParam(required = false) long recruiterId,
                                             Model model, HttpSession session) {
        List<Job> jobs = jobService.getJobsByRecruiterId(recruiterId);
        model.addAttribute("jobs", jobs);
        return "v2/viewJobCreated";
    }

    @GetMapping("/viewJobApplied")
    public String showViewJobAppliedForm(@SessionAttribute(name = "user", required = false) UserDTO userDTO,
                                         Model model, HttpSession session) {
        List<JobApplied> jobApplieds = jobAppliedRepository.findAllByUserID(userDTO.getId());
        model.addAttribute("jobApplieds", jobApplieds);
        return "v2/viewAppliedJob";
    }

}
