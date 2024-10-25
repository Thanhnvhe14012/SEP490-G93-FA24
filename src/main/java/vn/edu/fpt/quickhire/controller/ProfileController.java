package vn.edu.fpt.quickhire.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import vn.edu.fpt.quickhire.entity.Candidate;
import vn.edu.fpt.quickhire.entity.ProfileSection;
import vn.edu.fpt.quickhire.model.impl.CandidateServiceImpl;
import vn.edu.fpt.quickhire.model.impl.ProfileServiceImpl;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ProfileController {
    @Autowired
    ProfileServiceImpl profileService;
    @Autowired
    CandidateServiceImpl candidateService;
    //ProfileController
    @GetMapping("/profile/{id}")
    public String profile(@PathVariable("id") Long id, Model model) {
        Candidate c = candidateService.findByID(id);
        model.addAttribute("candidate", c);
        this.profileService.getAllProfileSection();
        return "profile";
    }
    @PostMapping("/update-profile/{id}")
    public String updateCandidate(@PathVariable("id") Long id, @ModelAttribute ("candidate") Candidate candidate, @RequestParam("imageInput")MultipartFile image) {
        candidateService.save(candidate, true,false, image);
        return "redirect:/profile/"+id;
    }

    @GetMapping("/delete-ex")
    public String deleteEx(@PathVariable("id") Long id, Model model) {
        candidateService.deleteProfileSection(id);
        return "profile";
    }

    @GetMapping("/candidate-profile/{id}")
    public String candidateProfile(@PathVariable("id") Long id, Model model) {
        Candidate c = candidateService.findByID(id);
        model.addAttribute("candidate", c);
        this.profileService.getAllProfileSection();
        return "candidate/profile";
    }


}
