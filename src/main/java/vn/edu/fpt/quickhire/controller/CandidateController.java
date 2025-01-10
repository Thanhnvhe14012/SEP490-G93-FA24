package vn.edu.fpt.quickhire.controller;

import jakarta.servlet.http.HttpServletResponse;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDType0Font;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import vn.edu.fpt.quickhire.entity.Account;
import vn.edu.fpt.quickhire.entity.Cetificate;
import vn.edu.fpt.quickhire.entity.DTO.CetificateDTO;
import vn.edu.fpt.quickhire.entity.DTO.EducationDTO;
import vn.edu.fpt.quickhire.entity.DTO.ExperienceDTO;
import vn.edu.fpt.quickhire.entity.DTO.UserDTO;
import vn.edu.fpt.quickhire.entity.Education;
import vn.edu.fpt.quickhire.entity.Experience;
import vn.edu.fpt.quickhire.model.ExperienceService;
import vn.edu.fpt.quickhire.model.repository.CetificateRepository;
import vn.edu.fpt.quickhire.model.repository.EducationRepository;
import vn.edu.fpt.quickhire.model.repository.ExperienceRepository;

import java.io.File;
import java.io.IOException;
import java.text.Format;
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
    private CetificateRepository cetificateRepository;

    @Autowired
    private ExperienceService experienceService;

    @GetMapping("/experience/new")
    public String showForm(Model model, @SessionAttribute(name = "user", required = false) UserDTO userDTO) {
        if (userDTO == null) {
            return "redirect:/login";
        } else if (userDTO.getRole() == 4) {
            model.addAttribute("experience", new ExperienceDTO());
            return "candidate/add_experience";
        } else return "redirect:/homepage";

    }

    @PostMapping("/experience/save")
    public String saveExperience(@ModelAttribute ExperienceDTO experience, @SessionAttribute(name = "user", required = false) UserDTO userDTO, Model model) throws ParseException {
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
        ex.setProject(experience.getProject());
        experienceRepository.save(ex);
        return showFormProfileCandidate(userDTO, model);
    }

    @GetMapping("/education/new")
    public String showFormEducation(Model model, @SessionAttribute(name = "user", required = false) UserDTO userDTO) {
        if (userDTO == null) {
            return "redirect:/login";
        } else if (userDTO.getRole() == 4) {
            model.addAttribute("education", new EducationDTO());
            return "candidate/add_education";
        } else return "redirect:/homepage";
    }

    @PostMapping("/education/save")
    public String saveEducation(@ModelAttribute EducationDTO education, @SessionAttribute(name = "user", required = false) UserDTO userDTO, Model model) throws ParseException {
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
        return showFormProfileCandidate(userDTO, model);
    }

    @GetMapping("/candidate/profile")
    public String showFormProfileCandidate(@SessionAttribute(name = "user", required = false) UserDTO userDTO, Model model) {
        if (userDTO == null) {
            return "redirect:/login";
        }
        System.out.println(userDTO.toString());

        if (userDTO.getRole() == 4) {
            List<Experience> experiencesList = experienceService.getAllExperiencesById(userDTO.getId());
            model.addAttribute("listExperience", experiencesList);
            List<Education> educationList = educationRepository.findAllByAccountId(userDTO.getId());
            model.addAttribute("listEducation", educationList);
            List<Cetificate> cetificateList = cetificateRepository.findAllByAccountId(userDTO.getId());
            model.addAttribute("listCetificate", cetificateList);
            return "candidate/profile";
        } else return "redirect:/homepage";
    }

    @GetMapping("/experience/update")
    public String showFormUpdateExperience(Model model, @RequestParam(value = "experienceId", required = false) Long experienceId) {
        Experience experience = experienceService.getExperienceById(experienceId);
        if (experience != null) {
            ExperienceDTO experienceDTO = new ExperienceDTO();
            experienceDTO.setAccountId(experience.getAccountId());
            experienceDTO.setDescription(experience.getDescription());
            experienceDTO.setCompany(experience.getCompany());
            experienceDTO.setJobTitle(experience.getJobTitle());
            experienceDTO.setProject(experience.getProject());
            Format formatter = new SimpleDateFormat("yyyy-MM-dd");
            experienceDTO.setStart(formatter.format(experience.getStart()));
            experienceDTO.setEnd(formatter.format(experience.getEnd()));
            experienceDTO.setExId((long) experience.getId());
            model.addAttribute("experience", experienceDTO);
            return "candidate/update-experience";
        }
        return "homepage";


    }

    @PostMapping("/experience/save-update")
    public String updateExperience(@ModelAttribute ExperienceDTO experience, @SessionAttribute(name = "user", required = false) UserDTO userDTO, Model model) throws ParseException {
        System.out.println(experience.toString());
        Experience ex = experienceService.getExperienceById(experience.getExId());
        ex.setAccountId(experience.getAccountId());
        ex.setDescription(experience.getDescription());
        ex.setCompany(experience.getCompany());
        ex.setJobTitle(experience.getJobTitle());
        Date start = new SimpleDateFormat("yyyy-MM-dd").parse(experience.getStart());
        Date end = new SimpleDateFormat("yyyy-MM-dd").parse(experience.getEnd());
        ex.setStart(start);
        ex.setEnd(end);
        ex.setProject(experience.getProject());
        experienceRepository.save(ex);
        return showFormProfileCandidate(userDTO, model);
    }

    @GetMapping("/education/update")
    public String showFormEducationUpdate(Model model, @RequestParam(value = "educationId", required = false) Long educationId) {
        System.out.println(educationId);
        Education edu = educationRepository.findEducationById(educationId);
        if (edu != null) {
            EducationDTO educationDTO = new EducationDTO();
            educationDTO.setAccountId(edu.getAccountId());
            Format formatter = new SimpleDateFormat("yyyy-MM-dd");
            educationDTO.setStart(formatter.format(edu.getStart()));
            educationDTO.setEnd(formatter.format(edu.getEnd()));
            educationDTO.setMajor(edu.getMajor());
            educationDTO.setSchoolName(edu.getSchoolName());
            educationDTO.setGpa(String.valueOf(edu.getGpa()));
            educationDTO.setEduId(edu.getId());
            model.addAttribute("education", educationDTO);
            return "candidate/update-education";
        }
        return "homepage";


    }

    @PostMapping("/education/save-update")
    public String saveEducationUpdate(@ModelAttribute EducationDTO education, @SessionAttribute(name = "user", required = false) UserDTO userDTO, Model model) throws ParseException {
        System.out.println(education.toString());
        Education ex = educationRepository.findEducationById(education.getEduId());
        Date start = new SimpleDateFormat("yyyy-MM-dd").parse(education.getStart());
        Date end = new SimpleDateFormat("yyyy-MM-dd").parse(education.getEnd());
        ex.setStart(start);
        ex.setEnd(end);
        ex.setGpa(Double.parseDouble(education.getGpa()));
        ex.setSchoolName(education.getSchoolName());
        ex.setMajor(education.getMajor());
        educationRepository.save(ex);
        return showFormProfileCandidate(userDTO, model);
    }

    @GetMapping("/cetificate/new")
    public String showFormCetificate(Model model, @SessionAttribute(name = "user", required = false) UserDTO userDTO) {
        if (userDTO == null) {
            return "redirect:/login";
        } else if (userDTO.getRole() == 4) {
            model.addAttribute("cetificate", new CetificateDTO());
            return "candidate/add-cetificate";
        } else return "redirect:/homepage";

    }

    @PostMapping("/cetificate/save")
    public String saveCetificate(@ModelAttribute CetificateDTO cetificateDTO, @SessionAttribute(name = "user", required = false) UserDTO userDTO, Model model) throws ParseException {
        System.out.println(cetificateDTO.toString());
        Cetificate ex = new Cetificate();
        ex.setAccountId(cetificateDTO.getAccountId());
        Date start = new SimpleDateFormat("yyyy-MM-dd").parse(cetificateDTO.getStart());
        Date end = new SimpleDateFormat("yyyy-MM-dd").parse(cetificateDTO.getEnd());
        ex.setStart(start);
        ex.setEnd(end);
        ex.setCetificateName(cetificateDTO.getCetificateName());
        ex.setOrganization(cetificateDTO.getOrganization());
        ex.setLink(cetificateDTO.getLink());
        cetificateRepository.save(ex);
        return showFormProfileCandidate(userDTO, model);
    }

    @GetMapping("/cetificate/update")
    public String showFormCetificateUpdate(Model model, @RequestParam(value = "cetificateId", required = false) Long cetificateId) {
        System.out.println(cetificateId);
        Cetificate cetificate = cetificateRepository.findCetificateById(cetificateId);
        if (cetificate != null) {
            CetificateDTO cetificateDTO = new CetificateDTO();
            cetificateDTO.setAccountId(cetificate.getAccountId());
            Format formatter = new SimpleDateFormat("yyyy-MM-dd");
            cetificateDTO.setStart(formatter.format(cetificate.getStart()));
            cetificateDTO.setEnd(formatter.format(cetificate.getEnd()));
            cetificateDTO.setCetificateName(cetificate.getCetificateName());
            cetificateDTO.setOrganization(cetificate.getOrganization());
            cetificateDTO.setCetificateId(cetificate.getId());
            cetificateDTO.setLink(cetificate.getLink());
            model.addAttribute("cetificate", cetificateDTO);
            return "candidate/update-cetificate";
        }
        return "homepage";


    }

    @PostMapping("/cetificate/save-update")
    public String saveCetificateUpdate(@ModelAttribute CetificateDTO cetificateDTO, @SessionAttribute(name = "user", required = false) UserDTO userDTO, Model model) throws ParseException {
        System.out.println(cetificateDTO.toString());
        Cetificate cetificate = cetificateRepository.findCetificateById(cetificateDTO.getCetificateId());
        Date start = new SimpleDateFormat("yyyy-MM-dd").parse(cetificateDTO.getStart());
        Date end = new SimpleDateFormat("yyyy-MM-dd").parse(cetificateDTO.getEnd());
        cetificate.setStart(start);
        cetificate.setEnd(end);
        cetificate.setOrganization(cetificateDTO.getOrganization());
        cetificate.setCetificateName(cetificateDTO.getCetificateName());
        cetificate.setLink(cetificateDTO.getLink());
        cetificateRepository.save(cetificate);
        return showFormProfileCandidate(userDTO, model);
    }

    @GetMapping("/deleteExperience/{id}")
    public String deleteExperience(@PathVariable("id") long id, @SessionAttribute(name = "user", required = false) UserDTO userDTO, Model model) throws IOException {
        experienceRepository.deleteById(id);
        return showFormProfileCandidate(userDTO, model);
    }

    @GetMapping("/deleteEducation/{id}")
    public String deleteEducation(@PathVariable("id") long id, @SessionAttribute(name = "user", required = false) UserDTO userDTO, Model model) throws IOException {
        educationRepository.deleteById(id);
        return showFormProfileCandidate(userDTO, model);
    }

    @GetMapping("/deleteCetificate/{id}")
    public String deleteCetificate(@PathVariable("id") long id, @SessionAttribute(name = "user", required = false) UserDTO userDTO, Model model) throws IOException {
        cetificateRepository.deleteById(id);
        return showFormProfileCandidate(userDTO, model);
    }

}
