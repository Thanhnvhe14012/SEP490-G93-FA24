package vn.edu.fpt.quickhire.controller;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.pdfbox.io.IOUtils;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDType0Font;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import vn.edu.fpt.quickhire.entity.*;
import vn.edu.fpt.quickhire.entity.DTO.UserDTO;
import vn.edu.fpt.quickhire.model.ExperienceService;
import vn.edu.fpt.quickhire.model.impl.CVServiceImpl;
import vn.edu.fpt.quickhire.model.impl.CandidateServiceImpl;
import vn.edu.fpt.quickhire.model.impl.FileUploadServiceImpl;
import vn.edu.fpt.quickhire.model.repository.AccountRepository;
import vn.edu.fpt.quickhire.model.repository.EducationRepository;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.List;

@Controller
@RequestMapping("/cv")
public class CvController {
    @Autowired
    CandidateServiceImpl candidateService;
    @Autowired
    CVServiceImpl cvService;
    @Autowired
    AccountRepository accountRepository;

    @Autowired
    private EducationRepository educationRepository;

    @Autowired
    private ExperienceService experienceService;

    @Autowired
    private FileUploadServiceImpl fileUploadService;

    //CVController
    @GetMapping("/template")
    public String cv(Model model) {
        return "cv/templateList";
    }

    @GetMapping("/list")
    public String cv(Model model, @SessionAttribute(name = "user", required = false) UserDTO userDTO) {
        if (userDTO == null) {
            return "redirect:/login";
        }
        List<CV> cvs = cvService.findAllByAccountId(userDTO.getId());
        model.addAttribute("cvs", cvs);
        return "cv/cvList";
    }

    @PostMapping("/upload")
    public String uploadCV(@RequestParam("cv") MultipartFile file,
                           @SessionAttribute(name = "user", required = false) UserDTO userDTO,
                           RedirectAttributes redirectAttributes) throws IOException {
        if (userDTO == null) {
            return "redirect:/login";
        }
        String uploadedFileUrl = fileUploadService.uploadFile(file);
        if (uploadedFileUrl != null && !uploadedFileUrl.isEmpty()) {
            // CV file uploaded successfully
            System.out.println("CV uploaded cloud successfully. File URL: " + uploadedFileUrl);
        } else {
            System.out.println("CV uploaded cloud failed");
        }

        String originalFileName = file.getOriginalFilename();
        if (originalFileName == null || originalFileName.isEmpty()) {
            redirectAttributes.addFlashAttribute("errorMessage", "Tên file không hợp lệ.");
            return "redirect:/cv/list";
        }
        CV cv = new CV();
        cv.setFileName(uploadedFileUrl);
        cv.setName(originalFileName);
        cv.setAccountId(userDTO.getId());
        cvService.save(cv, file);
        return "redirect:/cv/list";
    }

    @PostMapping("/delete")
    public String deleteCV(HttpSession session,
                           @RequestParam("id") long cvId) {
        UserDTO user = (UserDTO) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        System.out.println(cvId);
        CV cv = cvService.findById(cvId);
        if (cv != null && (cv.getAccountId().equals(user.getId()))) {
            // Ensure only the owner of the cv can delete it
            cvService.delete(cv);
        } else {
            System.out.println("staffID: " + cv.getAccountId());
            System.out.println("userID: " + user.getId());
            return "redirect:/error";
        }
        return "redirect:/cv/list";
    }

    @GetMapping("/downloadCV")
    public String downloadCV(@RequestParam("cvID") Long cvID, RedirectAttributes redirectAttributes) {
        try {
            CV cv = cvService.findById(cvID);
            if (cv != null) {
                // Redirect to the file URL for download
                return "redirect:" + cv.getFileName();
            } else {
                redirectAttributes.addFlashAttribute("errorMessage", "Không tìm thấy CV");
                return "redirect:/jobApplied/viewJobApplied";
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Tải xuống CV bị lỗi");
            return "redirect:/jobApplied/viewJobApplied";
        }
    }

    @GetMapping("/viewCV")
    public String viewCV(Model model) {
        return "cvList";
    }

    @GetMapping("/viewCVContent")
    public ResponseEntity<byte[]> viewCVContent(@RequestParam Long cvId) {
        CV cv = cvService.findById(cvId);

        if (cv != null) {
            try {
                URL url = new URL(cv.getFileName());
                InputStream inputStream = url.openStream();
                byte[] fileContent = IOUtils.toByteArray(inputStream);

                HttpHeaders headers = new HttpHeaders();
                headers.setContentType(MediaType.APPLICATION_PDF);
                String originalFileName = StringUtils.getFilename(cv.getFileName());
                headers.setContentDispositionFormData("attachment", originalFileName);

                return new ResponseEntity<>(fileContent, headers, HttpStatus.OK);
            } catch (IOException e) {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error fetching file content from Cloudinary.".getBytes());
            }
        } else {
            return ResponseEntity.notFound().build();
        }
    }

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
            if (account.getRole() == 4) {
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

    @GetMapping("/template1")
    public String cvTemplate1() {
        return "cv/cvTemplate/cvTemplate1";
    }
}
