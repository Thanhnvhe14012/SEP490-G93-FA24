package vn.edu.fpt.quickhire.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import vn.edu.fpt.quickhire.entity.Experience;
import vn.edu.fpt.quickhire.model.repository.ExperienceRepository;

@Controller
public class CandidateController {
    @Autowired
    private ExperienceRepository experienceRepository;

    @GetMapping("/experience/new")
    public String showForm(Model model) {
        model.addAttribute("experience", new Experience());
        return "candidate/add_experience";
    }

    @PostMapping("/experience/save")
    public String saveExperience(@ModelAttribute Experience experience) {
        experienceRepository.save(experience);
        return "redirect:/experience/new?success";
    }
}
