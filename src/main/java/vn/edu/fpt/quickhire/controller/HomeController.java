package vn.edu.fpt.quickhire.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import vn.edu.fpt.quickhire.entity.Industry;
import vn.edu.fpt.quickhire.entity.Job;
import vn.edu.fpt.quickhire.entity.Province;
import vn.edu.fpt.quickhire.model.impl.IndustryServiceImpl;
import vn.edu.fpt.quickhire.model.impl.JobServiceImpl;
import vn.edu.fpt.quickhire.model.repository.JobRepository;
import vn.edu.fpt.quickhire.model.repository.ProvinceRepository;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
public class HomeController {

    @Autowired
    private IndustryServiceImpl industryService;
    @Autowired
    private ProvinceRepository provinceRepository;
    @Autowired
    private JobServiceImpl jobService;

    @GetMapping({"/", "/home"})
    public String home(HttpSession session, Model model) {
        // Lấy username từ session
        String username = (String) session.getAttribute("username");

        // Kiểm tra nếu có username trong session
        if (username != null) {
            model.addAttribute("username", username);
        }
        List<Job> jobs = jobService.getLatestJobs(5);

        List<Industry> industries = industryService.getAllIndustries();
        List<Map.Entry<Industry, Integer>> sortedIndustryJobCounts = industries.stream()
                .collect(Collectors.toMap(
                        industry -> industry,
                        industry -> jobService.getJobCountByIndustry(industry.getId())))
                .entrySet().stream()
                .sorted((entry1, entry2) -> entry2.getValue().compareTo(entry1.getValue())) // Sort descending by job count
                .limit(8) // Get top 8 industries
                .toList();

        List<Province> provinces = provinceRepository.findAll();
        model.addAttribute("jobs", jobs);
        model.addAttribute("industries", industries);
        model.addAttribute("industryJobCounts", sortedIndustryJobCounts);
        model.addAttribute("provinces", provinces);
        return "homepage";
    }

}
