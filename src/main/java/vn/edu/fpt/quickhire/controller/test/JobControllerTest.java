package vn.edu.fpt.quickhire.controller.test;
import jakarta.servlet.http.HttpSession;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.ui.Model;
import vn.edu.fpt.quickhire.controller.JobController;
import vn.edu.fpt.quickhire.entity.DTO.UserDTO;
import vn.edu.fpt.quickhire.entity.Job;
import vn.edu.fpt.quickhire.entity.Industry;
import vn.edu.fpt.quickhire.entity.Province;
import vn.edu.fpt.quickhire.model.impl.IndustryServiceImpl;
import vn.edu.fpt.quickhire.model.impl.JobServiceImpl;
import vn.edu.fpt.quickhire.model.repository.JobAppliedRepository;
import vn.edu.fpt.quickhire.model.repository.JobRepository;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

public class JobControllerTest {
    @InjectMocks
    private JobController jobController;

    @Mock
    private JobServiceImpl jobService;

    @Mock
    private IndustryServiceImpl industryService;

    @Mock
    private JobRepository jobRepository;

    @Mock
    private JobAppliedRepository jobAppliedRepository;

    @Mock
    private HttpSession session;

    @Mock
    private Model model;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testShowCreateJobForm_WithValidUser() {
        UserDTO user = new UserDTO();
        user.setRole(3); // Recruiter role
        when(session.getAttribute("user")).thenReturn(user);

        String result = jobController.showCreateJobForm(model, session);

        assertEquals("job/createJob", result);
        verify(model).addAttribute(eq("job"), any(Job.class));
    }

    @Test
    void testShowCreateJobForm_WithNoUser() {
        when(session.getAttribute("user")).thenReturn(null);

        String result = jobController.showCreateJobForm(model, session);

        assertEquals("redirect:/login", result);
    }

    @Test
    void testCreateJob_ValidUser() {
        UserDTO user = new UserDTO();
        user.setId(1L);
        when(session.getAttribute("user")).thenReturn(user);

        Job job = new Job();
        when(jobService.createJob(any(Job.class), eq(1L))).thenReturn(job);

        String result = jobController.createJob(job, session);

        assertEquals("redirect:/job/viewJobCreated", result);
    }

    @Test
    void testListAllJobs_WithNoFilters() {
        List<Job> jobs = new ArrayList<>();
        jobs.add(new Job());
        when(jobService.getAllJobs()).thenReturn(jobs);

        List<Industry> industries = new ArrayList<>();
        when(industryService.getAllIndustries()).thenReturn(industries);

        List<Province> provinces = new ArrayList<>();
//        when(jobRepository.findAll()).thenReturn(provinces);

        String result = jobController.listAllJobs(null, null, null, 0, 5, model);

        assertEquals("job/listJob", result);
        verify(model).addAttribute(eq("jobs"), any());
        verify(model).addAttribute(eq("totalPages"), eq(1));
        verify(model).addAttribute(eq("industries"), eq(industries));
//        verify(model).addAttribute(eq("provinces"), eq(provinces));
    }

    @Test
    void testDeleteJob_Success() {
        UserDTO user = new UserDTO();
        user.setId(1L);

        Job job = new Job();
        job.setStaff(null); // Mock case with staff

        when(session.getAttribute("user")).thenReturn(user);
        when(jobService.getJobById(1L)).thenReturn(job);

        String result = jobController.deleteJob(1L, session);

        assertEquals("redirect:/job/viewJobCreated", result);
        verify(jobRepository, times(1)).delete(job);
    }

    @Test
    void testDeleteJob_InvalidUser() {
        when(session.getAttribute("user")).thenReturn(null);

        String result = jobController.deleteJob(1L, session);

        assertEquals("redirect:/login", result);
    }
}
