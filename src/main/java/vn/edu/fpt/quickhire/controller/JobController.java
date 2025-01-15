package vn.edu.fpt.quickhire.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
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
import vn.edu.fpt.quickhire.model.repository.JobRepository;
import vn.edu.fpt.quickhire.model.repository.ProvinceRepository;

import java.text.SimpleDateFormat;
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
    @Autowired
    private JobRepository jobRepository;

    @GetMapping("/create")
    public String showCreateJobForm(Model model, HttpSession session) {
        UserDTO user = (UserDTO) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        if (user.getRole() != 3) {
            return "redirect:/";
        }
        model.addAttribute("job", new Job());
        List<Industry> industries = industryService.getAllIndustries();
        model.addAttribute("industries", industries);
        return "job/createJob";
    }

    @PostMapping("/create")
    public String createJob(
            @ModelAttribute Job jobDTO, HttpSession session
    ) {
        UserDTO user = (UserDTO) session.getAttribute("user");
        Long accountId = user.getId();
        System.out.println("Session user: " + accountId);
        if (accountId == null) {
            return "redirect:/error";
        }

        Job createdJob = jobService.createJob(jobDTO, accountId);
        return "redirect:/job/viewJobCreated";
    }

    @GetMapping("/list")
    public String listAllJobs(
            @RequestParam(required = false) String name,
            @RequestParam(required = false) String address,
            @RequestParam(required = false) Long industryId,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "5") int size,
            Model model) {

        List<Job> jobs;
        if (name != null || address != null || industryId != null) {
            jobs = jobService.searchJobs(name, address, industryId, null, null, null, null);
        } else {
            jobs = jobService.getAllJobs();
        }

        if (jobs.isEmpty()) {
            model.addAttribute("noJobsFound", true);
        }

        int totalJobs = jobs.size();
        int totalPages = (int) Math.ceil((double) totalJobs / size);
        int start = page * size;
        int end = Math.min(start + size, totalJobs);

        List<Job> paginatedJobs = jobs.subList(start, end);

        List<Industry> industries = industryService.getAllIndustries();
        List<Province> provinces = provinceRepository.findAll();

        model.addAttribute("jobs", paginatedJobs);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("industries", industries);
        model.addAttribute("provinces", provinces);

        return "job/listJob";
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
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "5") int size,
            Model model) {

        List<Job> jobs = jobService.searchJobs(name, address, industryId, salaryMin, salaryMax, level, type);

        if (jobs.isEmpty()) {
            model.addAttribute("noJobsFound", true);
        }

        int start = page * size;
        int end = Math.min(start + size, jobs.size());
        List<Job> paginatedJobs = jobs.subList(start, end);

        model.addAttribute("jobs", paginatedJobs);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", (int) Math.ceil((double) jobs.size() / size));
        model.addAttribute("pageSize", size);

        return "job/jobListingsFragment";
    }


    @GetMapping("/editJob")
    public String showEditJobForm(@RequestParam(required = false) Long id, Model model, HttpSession session) {
        Job job = jobService.getJobById(id);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String formattedEndDate = job.getEnd() != null ? sdf.format(job.getEnd()) : "";
        model.addAttribute("job", job);
        model.addAttribute("formattedEndDate", formattedEndDate);
        return "v2/editjob";
    }

    @GetMapping("/jobDetail")
    public String showJobDetail(@RequestParam(required = false) long id, Model model, @SessionAttribute(name = "user", required = false) UserDTO userDTO) {
        Job job = jobService.getJobById(id);
        model.addAttribute("job", job);
        if (userDTO != null) {
            JobApplied jobApplied = jobAppliedRepository.findByJobIDAndUserID(id, userDTO.getId());
            model.addAttribute("jobApplied", jobApplied);
        }
        return "job/jobDetail";
    }

    @GetMapping("/viewJobDetailRecruiter")
    public String showViewJobDetailRecruiterForm(@RequestParam(required = false) long id,
                                                 Model model, HttpSession session) {
        Job job = jobService.getJobById(id);
        List<JobApplied> jobApplieds = jobAppliedRepository.findAllByJobID(id);
        model.addAttribute("job", job);
        model.addAttribute("jobApplieds", jobApplieds);
        System.out.println(id);
        System.out.println(jobApplieds);
        return "v2/viewJobDetailRecruiter";
    }

    @GetMapping("/viewJobCreated")
    public String showViewJobCreatedListForm(@SessionAttribute(name = "user", required = false) UserDTO userDTO,
                                             Model model, HttpSession session) {
        if (userDTO == null) {
            return "redirect:/login";
        }
        ;
        List<Job> jobs = jobService.getJobsByRecruiterId(userDTO.getId());
        model.addAttribute("jobs", jobs);
        model.addAttribute("currentUserId", userDTO.getId());
        return "job/viewJobCreated";
    }

    @PostMapping("/saveUpdateJob")
    public String saveUpdateJob(@RequestParam(required = false) Long id, @ModelAttribute Job jobDTO, Model model) {
        System.out.println("id cua job " + id);
        Job job = jobService.getJobById(id);
        job.setName(jobDTO.getName());
        job.setDescription(jobDTO.getDescription());
        job.setEnd(jobDTO.getEnd());
        job.setStatus(jobDTO.getStatus());
        job.setBenefits(jobDTO.getBenefits());
        job.setSalary_min(jobDTO.getSalary_min());
        job.setSalary_max(jobDTO.getSalary_max());
        job.setLevel(jobDTO.getLevel());
        job.setType(jobDTO.getType());
        jobRepository.save(job);
        model.addAttribute("job", job);
        return "redirect:/job/viewJobCreated";
    }

}
