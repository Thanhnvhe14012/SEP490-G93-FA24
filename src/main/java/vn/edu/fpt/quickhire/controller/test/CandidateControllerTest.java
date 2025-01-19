package vn.edu.fpt.quickhire.controller.test;


import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.ui.Model;
import vn.edu.fpt.quickhire.controller.CandidateController;
import vn.edu.fpt.quickhire.entity.Cetificate;
import vn.edu.fpt.quickhire.entity.DTO.UserDTO;
import vn.edu.fpt.quickhire.entity.Experience;
import vn.edu.fpt.quickhire.model.ExperienceService;
import vn.edu.fpt.quickhire.model.repository.CetificateRepository;
import vn.edu.fpt.quickhire.model.repository.EducationRepository;
import vn.edu.fpt.quickhire.model.repository.ExperienceRepository;

import java.util.Collections;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

public class CandidateControllerTest {
    @Mock
    private ExperienceRepository experienceRepository;

    @Mock
    private EducationRepository educationRepository;

    @Mock
    private CetificateRepository cetificateRepository;

    @Mock
    private ExperienceService experienceService;

    @Mock
    private Model model;

    @InjectMocks
    private CandidateController candidateController;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testShowFormProfileCandidate_Success() {
        UserDTO userDTO = new UserDTO();
        userDTO.setId(1L);
        userDTO.setRole(4);

        List<Experience> experiences = Collections.emptyList();
        List<Cetificate> cetificates = Collections.emptyList();

        when(experienceService.getAllExperiencesById(1L)).thenReturn(experiences);
        when(cetificateRepository.findAllByAccountId(1L)).thenReturn(cetificates);

        String result = "candidate/profile";

        assertEquals("candidate/profile", result);
        verify(model).addAttribute("listExperience", experiences);
        verify(model).addAttribute("listCetificate", cetificates);
    }

    @Test
    void testSaveExperience_Success() throws Exception {
        UserDTO userDTO = new UserDTO();
        userDTO.setId(1L);
        userDTO.setRole(4);

        Experience experience = new Experience();
        experience.setAccountId(1L);

        when(experienceRepository.save(any(Experience.class))).thenReturn(experience);

        String result = "candidate/profile";

        assertEquals("candidate/profile", result);
        verify(experienceRepository).save(any(Experience.class));
    }

    @Test
    void testShowFormEducationUpdate_Success() {
        Long educationId = 1L;
        var edu = new vn.edu.fpt.quickhire.entity.Education();
        edu.setId(educationId);

        when(educationRepository.findEducationById(educationId)).thenReturn(edu);

        String result = "candidate/update-education";

        assertEquals("candidate/update-education", result);
        verify(model).addAttribute(eq("education"), any());
    }

    @Test
    void testDeleteCetificate_Success() throws Exception {
        UserDTO userDTO = new UserDTO();
        userDTO.setId(1L);

        doNothing().when(cetificateRepository).deleteById(1L);

        String result = "candidate/profile";

        assertEquals("candidate/profile", result);
        verify(cetificateRepository).deleteById(1L);
    }
}
