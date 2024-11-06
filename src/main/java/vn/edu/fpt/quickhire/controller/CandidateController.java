package vn.edu.fpt.quickhire.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import vn.edu.fpt.quickhire.entity.DTO.EducationDTO;
import vn.edu.fpt.quickhire.entity.DTO.ExperienceDTO;
import vn.edu.fpt.quickhire.entity.DTO.UserDTO;
import vn.edu.fpt.quickhire.entity.Education;
import vn.edu.fpt.quickhire.entity.Experience;
import vn.edu.fpt.quickhire.model.ExperienceService;
import vn.edu.fpt.quickhire.model.repository.EducationRepository;
import vn.edu.fpt.quickhire.model.repository.ExperienceRepository;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
public class CandidateController {
    @Autowired
    private ExperienceRepository experienceRepository;

    @Autowired
    private EducationRepository educationRepository;

    @Autowired
    private ExperienceService experienceService;

    @GetMapping("/experience/new")
    public String showForm(Model model) {
        model.addAttribute("experience", new ExperienceDTO());
        return "candidate/add_experience";
    }

    @PostMapping("/experience/save")
    public String saveExperience(@ModelAttribute ExperienceDTO experience) throws ParseException {
        System.out.println(experience.toString());
        Experience ex = new Experience();
        ex.setAccountId(experience.getAccountId());
        ex.setDescription(experience.getDescription());
        ex.setCompany(experience.getCompany());
        ex.setJobTitle(experience.getJobTitle());
        Date start = new SimpleDateFormat("yyyy-MM-dd").parse(experience.getStart());
        Date end = new SimpleDateFormat("yyyy-MM-dd").parse(experience.getEnd());
        ex.setStart(start);
        ex.setEnd(end);
        experienceRepository.save(ex);
        return "redirect:/experience/new?success";
    }

    @GetMapping("/education/new")
    public String showFormEducation(Model model) {
        model.addAttribute("education", new EducationDTO());
        return "candidate/add_education";
    }

    @PostMapping("/education/save")
    public String saveEducation(@ModelAttribute EducationDTO education) throws ParseException {
        System.out.println(education.toString());
        Education ex = new Education();
        ex.setAccountId(education.getAccountId());
        Date start = new SimpleDateFormat("yyyy-MM-dd").parse(education.getStart());
        Date end = new SimpleDateFormat("yyyy-MM-dd").parse(education.getEnd());
        ex.setStart(start);
        ex.setEnd(end);
        ex.setGpa(Double.parseDouble(education.getGpa()));
        ex.setSchoolName(education.getSchoolName());
        ex.setMajor(education.getMajor());
        educationRepository.save(ex);
        return "redirect:/education/new?success";
    }

    @GetMapping("/candidate/profile")
    public String showFormProfileCandidate(@SessionAttribute(name = "user", required = false) UserDTO userDTO, Model model) {
        if (userDTO == null) {
            return "homepage";
        }
        System.out.println(userDTO.toString());

        if (userDTO.getRole() == 4) {
            List<Experience> experiencesList = experienceService.getAllExperiencesById(userDTO.getId());
            model.addAttribute("listExperience", experiencesList);
            List<Education> educationList = educationRepository.findAllByAccountId(userDTO.getId());
            model.addAttribute("listEducation", educationList);
            return "candidate/profile";
        } else return "homepage";
    }
}
