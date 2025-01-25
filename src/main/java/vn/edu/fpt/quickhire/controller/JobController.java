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
        return "staff/createJob";
    }

    @PostMapping("/create")
    public String createJob(
            @ModelAttribute Job jobDTO, HttpSession session
    ) {
        UserDTO user = (UserDTO) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        Long accountId = user.getId();

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
        return "staff/editJob";
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
    public String showViewJobDetailRecruiterForm(@SessionAttribute(name = "user", required = false) UserDTO userDTO,
                                                 @RequestParam(required = false) long id,
                                                 @RequestParam(required = false) Integer status,
                                                 Model model, HttpSession session) {
        if (userDTO == null) {
            return "redirect:/login";
        }

        Job job = jobService.getJobById(id);
        long staffId = job.getRecruiterId();
        long recruiterId = job.getCompanyId();
        if (userDTO.getId() != staffId & userDTO.getId() != recruiterId) {
            return "redirect:/";
        }

        // If a status is passed, filter by that status, otherwise return all
        List<JobApplied> jobApplieds;
        if (status == null || status == 0) {
            jobApplieds = jobAppliedRepository.findAllByJobID(id);
        }
        else {
            jobApplieds = jobAppliedRepository.findAllByJobIDAndStatus(id, status);
        }

        model.addAttribute("job", job);
        model.addAttribute("jobApplieds", jobApplieds);
        return "staff/viewJobDetailRecruiter";
    }


    @GetMapping("/viewJobCreated")
    public String showViewJobCreatedListForm(@SessionAttribute(name = "user", required = false) UserDTO userDTO,
                                             Model model, HttpSession session) {
        if (userDTO == null) {
            return "redirect:/login";
        } else if (userDTO.getRole() != 3) {
            return "redirect:/";
        }
        List<Job> jobs = jobService.getJobsByRecruiterId(userDTO.getId());
        model.addAttribute("jobs", jobs);
        model.addAttribute("currentUserId", userDTO.getId());
        return "staff/viewJobCreated";
    }

    @GetMapping("/viewCompanyJob")
    public String listCompanyJob(@SessionAttribute(name = "user", required = false) UserDTO userDTO,
                                 Model model) {
        if (userDTO == null) {
            return "redirect:/login";
        } else if (userDTO.getRole() != 2) {
            return "redirect:/";
        }
        List<Job> jobs = jobService.getJobsByCompanyId(userDTO.getId());
        model.addAttribute("jobs", jobs);
        model.addAttribute("currentUserId", userDTO.getId());
        return "staff/viewJobCreated";
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

    @PostMapping("/deleteJob")
    public String deleteJob(@RequestParam("jobId") Long jobId, HttpSession session) {
        UserDTO user = (UserDTO) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        Job job = jobService.getJobById(jobId);
        if (job != null && (job.getStaff().getAccount().getId().equals(user.getId()) || job.getRecruiter().getAccount().getId().equals(user.getId()))) {
            // Ensure only the owner of the job or the owner of the company can delete it
            jobRepository.delete(job);
        } else {
            System.out.println("staffID: " + job.getStaff().getAccount().getId());
            System.out.println("recruiterID: " + job.getRecruiter().getAccount().getId());
            System.out.println("userID: " + user.getId());
            return "redirect:/error";
        }
        if (user.getRole() == 2) {
            return "redirect:/job/viewCompanyJob";
        }
        return "redirect:/job/viewJobCreated";
    }
}
