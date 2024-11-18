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
import vn.edu.fpt.quickhire.entity.Education;
import vn.edu.fpt.quickhire.entity.Experience;
import vn.edu.fpt.quickhire.model.ExperienceService;
import vn.edu.fpt.quickhire.model.impl.CandidateServiceImpl;
import vn.edu.fpt.quickhire.model.repository.AccountRepository;
import vn.edu.fpt.quickhire.model.repository.EducationRepository;
import vn.edu.fpt.quickhire.model.repository.ExperienceRepository;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
public class CvController {
    @Autowired
    CandidateServiceImpl candidateService;
//    @Autowired
//    CvServiceImpl cvService;
    @Autowired
    AccountRepository accountRepository;
    @Autowired
    private ExperienceRepository experienceRepository;

    @Autowired
    private EducationRepository educationRepository;

    @Autowired
    private ExperienceService experienceService;

    //CVController
    @GetMapping("/cv/list")
    public String cv(Model model) {
        return "cv/listCV";
    }

//    @GetMapping("/cv/{id}")
//    public String cvDetail(Model model, @PathVariable int id) {
//        Candidate c = this.candidateService.findByID(1L);
////        c.setCvSections(c.getCvSections().stream().filter(x -> x.getCandidateCvNo() == id).collect(Collectors.toList()));
//        model.addAttribute("candidate", c);
//        return "cv";
//    }

//    @PostMapping("/update-cv/{id}")
//    public String updateCandidate(@PathVariable("id") Long id, @ModelAttribute("candidate") Candidate candidate, @RequestParam("imageInput") MultipartFile image) {
//        candidateService.save(candidate, false, true, image);
//        return "redirect:/cv/" + id;
//    }

    @GetMapping("/download/generate-pdf")
    @ResponseBody
    public void generateDownloadPdf(HttpServletResponse response) throws IOException {
        try (PDDocument document = new PDDocument()) {
            PDPage page = new PDPage();
            document.addPage(page);

            // Load font Unicode từ file TTF
            File fontFile = new File("src/main/resources/fonts/Freeman-Regular.ttf");
            PDType0Font font = PDType0Font.load(document, fontFile);

            try (PDPageContentStream contentStream = new PDPageContentStream(document, page)) {
                contentStream.setFont(font, 12);
                contentStream.beginText();
                contentStream.newLineAtOffset(100, 700);
                contentStream.showText("Đây là nội dung CV của bạn với ký tự Đ!");
                contentStream.endText();
            }

            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=\"CV.pdf\"");
            document.save(response.getOutputStream());
        }
    }

    @GetMapping("/cv/index")
    public String cvIndex(Model model) {
        return "cv/index";
    }

    @GetMapping("/generate-pdf/{id}")
    @ResponseBody
    public void generatePdf(HttpServletResponse response, @PathVariable("id") long id) throws IOException {
        Account account = accountRepository.findById(id);
        List<Experience> experiencesList = null;
        List<Education> educationList = null;

        if (account != null) {
            if (account.getUserRole().getRole().getId() == 4) {
                experiencesList = experienceService.getAllExperiencesById(id);
                educationList = educationRepository.findAllByAccountId(id);
            }
        }

        try (PDDocument document = new PDDocument()) {
            PDPage page = new PDPage();
            document.addPage(page);

            // Load the Unicode font
            File fontFile = new File("src/main/resources/fonts/Freeman-Regular.ttf");
            PDType0Font font = PDType0Font.load(document, fontFile);

            try (PDPageContentStream contentStream = new PDPageContentStream(document, page)) {
                contentStream.setFont(font, 12);

                // Draw a line
                contentStream.setLineWidth(1);
                contentStream.moveTo(50, 750);
                contentStream.lineTo(550, 750);
                contentStream.stroke();

                contentStream.beginText();
                contentStream.newLineAtOffset(100, 720);
                contentStream.showText(account.getEmail());
                contentStream.newLineAtOffset(0, -20);
                contentStream.showText(account.getFirstName() + " " + account.getMiddleName() + " " + account.getLastName());
                contentStream.newLineAtOffset(0, -20);
                contentStream.showText(account.getAddress());
                contentStream.newLineAtOffset(0, -20);
                contentStream.showText("Biography:");
                contentStream.newLineAtOffset(0, -20);
                contentStream.showText(account.getCandidate().getBiography());

                // Experiences Section
                contentStream.newLineAtOffset(0, -40);
                contentStream.showText("Experiences:");
                contentStream.newLineAtOffset(0, -20);
                if (experiencesList != null) {
                    for (Experience experience : experiencesList) {
                        contentStream.showText("Company: " + experience.getCompany());
                        contentStream.newLineAtOffset(0, -20);
                        contentStream.showText("Job Title: " + experience.getJobTitle());
                        contentStream.newLineAtOffset(0, -20);
                        contentStream.showText("Period: " + experience.getStart().toString() + " - " + experience.getEnd().toString());
                        contentStream.newLineAtOffset(0, -20);
                        contentStream.showText("Description: " + experience.getDescription());
                        contentStream.newLineAtOffset(0, -20);
                        contentStream.showText("Project: " + experience.getProject());
                        contentStream.newLineAtOffset(0, -20);
                    }
                }

                // Education Section
                contentStream.newLineAtOffset(0, -40);
                contentStream.showText("Education:");
                contentStream.newLineAtOffset(0, -20);
                if (educationList != null) {
                    for (Education education : educationList) {
                        contentStream.showText("Major: " + education.getMajor());
                        contentStream.newLineAtOffset(0, -20);
                        contentStream.showText("School: " + education.getSchoolName());
                        contentStream.newLineAtOffset(0, -20);
                        contentStream.showText("GPA: " + String.valueOf(education.getGpa()));
                        contentStream.newLineAtOffset(0, -20);
                        contentStream.showText("Period: " + education.getStart().toString() + " - " + education.getEnd().toString());
                        contentStream.newLineAtOffset(0, -20);
                    }
                }

                contentStream.endText();
            }

            // Set the response headers to display PDF in browser
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "inline; filename=\"CV.pdf\"");
            document.save(response.getOutputStream());
        }
    }

    @GetMapping("/cv/template1")
    public String cvTemplate1() {
        return "cv/cvTemplate/cvTemplate1";
    }
}
