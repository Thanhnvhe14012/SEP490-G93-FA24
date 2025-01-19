package vn.edu.fpt.quickhire.controller.test;
import jakarta.servlet.http.HttpServletResponse;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import vn.edu.fpt.quickhire.controller.CvController;
import vn.edu.fpt.quickhire.entity.*;
import vn.edu.fpt.quickhire.model.ExperienceService;
import vn.edu.fpt.quickhire.model.impl.CVServiceImpl;
import vn.edu.fpt.quickhire.model.impl.CandidateServiceImpl;
import vn.edu.fpt.quickhire.model.impl.JobAppliedServiceImpl;
import vn.edu.fpt.quickhire.model.repository.AccountRepository;
import vn.edu.fpt.quickhire.model.repository.EducationRepository;
import vn.edu.fpt.quickhire.model.repository.ExperienceRepository;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

public class CVControllerTest {
    @InjectMocks
    private CvController cvController;

    @Mock
    private CandidateServiceImpl candidateService;

    @Mock
    private CVServiceImpl cvService;

    @Mock
    private AccountRepository accountRepository;

    @Mock
    private ExperienceRepository experienceRepository;

    @Mock
    private EducationRepository educationRepository;

    @Mock
    private ExperienceService experienceService;

    @Mock
    private JobAppliedServiceImpl jobAppliedServiceImpl;

    @Mock
    private HttpServletResponse response;

    @Mock
    private Model model;

    @Mock
    private RedirectAttributes redirectAttributes;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testCv() {
        String result = cvController.cv(model);
        assertEquals("cv/listCV", result);
    }

    @Test
    void testDownloadCVSuccess() {
        CV cv = new CV();
        cv.setFileName("https://example.com/cv.pdf");
        when(cvService.findById(anyLong())).thenReturn(cv);

        String result = cvController.downloadCV(1L, redirectAttributes);

        assertEquals("redirect:https://example.com/cv.pdf", result);
        verify(redirectAttributes, never()).addFlashAttribute(anyString(), anyString());
    }

    @Test
    void testDownloadCVNotFound() {
        when(cvService.findById(anyLong())).thenReturn(null);

        String result = cvController.downloadCV(1L, redirectAttributes);

        assertEquals("redirect:/jobApplied/viewJobApplied", result);
        verify(redirectAttributes).addFlashAttribute(eq("errorMessage"), eq("Không tìm thấy CV"));
    }

    @Test
    void testViewCVFound() {
        CV cv = new CV();
        when(cvService.findById(anyLong())).thenReturn(cv);

        String result = cvController.viewCV(1L, model);

        assertEquals("cv/viewCV", result);
        verify(model).addAttribute("cv", cv);
    }

    @Test
    void testViewCVNotFound() {
        when(cvService.findById(anyLong())).thenReturn(null);

        String result = cvController.viewCV(1L, model);

        assertEquals("redirect:/error", result);
    }

    @Test
    void testViewCVContentSuccess() throws IOException {
        CV cv = new CV();
        cv.setFileName("https://example.com/cv.pdf");
        when(cvService.findById(anyLong())).thenReturn(cv);
        URL url = new URL("https://example.com/cv.pdf");
        InputStream inputStream = mock(InputStream.class);
        when(url.openStream()).thenReturn(inputStream);

        ResponseEntity<byte[]> response = cvController.viewCVContent(1L);

        assertEquals(200, response.getStatusCodeValue());
    }

    @Test
    void testGenerateDownloadPdf() throws IOException {
        cvController.generateDownloadPdf(response);

        verify(response).setContentType("application/pdf");
        verify(response).setHeader(eq("Content-Disposition"), contains("CV.pdf"));
    }

    @Test
    void testGeneratePdf() throws IOException {
        Account account = new Account();
        account.setEmail("test@example.com");
        account.setFirstName("First");
        account.setLastName("Last");
        account.setAddress("123 Test St");
        Candidate candidate = new Candidate();
        candidate.setBiography("A brief bio");
        account.setCandidate(candidate);

        when(accountRepository.findById(anyLong())).thenReturn(account);

        cvController.generatePdf(response, 1L);

        verify(response).setContentType("application/pdf");
        verify(response).setHeader(eq("Content-Disposition"), contains("CV.pdf"));
    }
}
