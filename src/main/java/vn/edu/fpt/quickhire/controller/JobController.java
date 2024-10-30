package vn.edu.fpt.quickhire.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import vn.edu.fpt.quickhire.entity.Job;
import vn.edu.fpt.quickhire.model.JobService;

import java.util.List;
import java.util.Locale;


@Controller
public class JobController {
    @Autowired
    private JobService jobService;
    //JobController
    @GetMapping("/job/list")
    public String listJobs(HttpSession session, Model model){
        List<Job> jobs = jobService.GetAllJobs();
        model.addAttribute("jobs", jobs);
        return "job/listJob"; // Trả về view editJob
    }
    @GetMapping("/candidate/job/list")
    public String listJobsCandidates(HttpSession session, Model model,@RequestParam(value = "search",defaultValue = "") String keyword){
        List<Job> jobs = jobService.GetAllJobs();
        if(keyword!=null && keyword.length()>0){
            jobs = jobs.stream().filter(x->x.getName().toLowerCase().contains(keyword.toLowerCase())).toList();
            model.addAttribute("searchRes", +jobs.size()+" Jobs found");
        }
        model.addAttribute("jobs", jobs);
        return "candidate/listJob"; // Trả về view editJob
    }
    @GetMapping("/candidate/job/details/{id}")
    public String detailJobsCandidates(HttpSession session, Model model,@PathVariable Long id){
        Job currentJob = jobService.GetJobById(id);
        if(currentJob != null){
            model.addAttribute("job", currentJob);
            return "candidate/jobDetails"; // Trả về view editJob
        }
        else
            return "redirect:/404-error";
    }


    @GetMapping("/job/create")
    public String home(HttpSession session, Model model) {
        model.addAttribute("job", new Job());

        return "job/createJob";
    }
    @PostMapping("/job/create")
    public String createJob(@ModelAttribute("job") Job job, Model model) {
        // Save the job using the JobService
        try {
            jobService.CreateJob(job);
            model.addAttribute("messsage","Create job successfully");
        }
        catch (Exception e) {
            model.addAttribute("messsage", "Create job fail, please try again");
        }
        return "job/createJob";
    }

    @GetMapping("/job/edit/{id}")
    public String editJob(HttpSession session, Model model,@PathVariable Long id){
        // Tìm kiếm công việc bằng ID (giả sử có phương thức getJobById trong service)
        Job currentJob = jobService.GetJobById(id);
        if(currentJob != null){
            model.addAttribute("job", currentJob);
            return "job/editJob"; // Trả về view editJob
        }
        else
            return "redirect:/404-error";
    }
    @PostMapping("/job/edit/{id}")
    public String editJob(@ModelAttribute("job") Job job, Model model, @PathVariable Long id) {
        // Save the job using the JobService
        try {
            jobService.UpdateJob(id,job);
            model.addAttribute("messsage","Update job successfully");
        }
        catch (Exception e) {
            model.addAttribute("messsage", "Update job fail. Some error occurs");
        }
        return "job/editJob";
    }
    @PostMapping("/job/edit/{id}/delete")
    public String deleteJob( Model model,  @PathVariable Long id) {
        // Save the job using the JobService
        try {
            jobService.DeleteById(id);
            model.addAttribute("messsage","Delete job successfully");
        }
        catch (Exception e) {
            model.addAttribute("messsage", "Delete job fail. Some error occurs");
        }
        return "redirect:/job/list";
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
