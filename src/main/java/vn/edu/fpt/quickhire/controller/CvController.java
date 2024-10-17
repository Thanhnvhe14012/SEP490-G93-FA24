package vn.edu.fpt.quickhire.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import vn.edu.fpt.quickhire.entity.Candidate;
import vn.edu.fpt.quickhire.model.impl.CandidateServiceImpl;
import vn.edu.fpt.quickhire.model.impl.CvServiceImpl;

import java.util.stream.Collectors;

@Controller
public class CvController {
    @Autowired
    CandidateServiceImpl candidateService;
    @Autowired
    CvServiceImpl cvService;
    //CVController
    @GetMapping("/cv/list")
    public String cv(Model model) {
        model.addAttribute("cvs", cvService.countCVofCandidate(1L));
        return "list-cv";
    }
    @GetMapping("/cv/{id}")
    public String cvDetail(Model model, @PathVariable int id){
        Candidate c = this.candidateService.findByID(1L);
        c.setCvSections(c.getCvSections().stream().filter(x->x.getCandidateCvNo()==id).collect(Collectors.toList()));
        model.addAttribute("candidate", c);
        return "cv";
    }

    @PostMapping("/update-cv/{id}")
    public String updateCandidate(@PathVariable("id") Long id, @ModelAttribute("candidate") Candidate candidate, @RequestParam("imageInput")MultipartFile image) {
        candidateService.save(candidate,false,true, image);
        return "redirect:/cv/"+id;
    }
}
