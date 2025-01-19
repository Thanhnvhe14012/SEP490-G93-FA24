package vn.edu.fpt.quickhire.controller.test;

import jakarta.servlet.http.HttpSession;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.ui.Model;
import vn.edu.fpt.quickhire.controller.HomeController;
import vn.edu.fpt.quickhire.entity.Industry;
import vn.edu.fpt.quickhire.entity.Job;
import vn.edu.fpt.quickhire.entity.Province;
import vn.edu.fpt.quickhire.model.impl.IndustryServiceImpl;
import vn.edu.fpt.quickhire.model.impl.JobServiceImpl;
import vn.edu.fpt.quickhire.model.repository.ProvinceRepository;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;
public class HomeControllerTest {
    @InjectMocks
    private HomeController homeController;

    @Mock
    private IndustryServiceImpl industryService;

    @Mock
    private ProvinceRepository provinceRepository;

    @Mock
    private JobServiceImpl jobService;

    @Mock
    private HttpSession session;

    @Mock
    private Model model;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testHomeWithUsername() {
        // Mock session username
        when(session.getAttribute("username")).thenReturn("testUser");

        // Mock job data
        Job job = new Job();
        List<Job> jobs = Arrays.asList(job);
        when(jobService.getLatestJobs(5)).thenReturn(jobs);

        // Mock industry data
        Industry industry = new Industry();
        industry.setId(1L);
        when(industryService.getAllIndustries()).thenReturn(Arrays.asList(industry));
        when(jobService.getJobCountByIndustry(1L)).thenReturn(10);

        // Mock province data
        Province province = new Province();
        List<Province> provinces = Arrays.asList(province);
        when(provinceRepository.findAll()).thenReturn(provinces);

        String result = homeController.home(session, model);

        // Verify the model attributes
        verify(model).addAttribute("username", "testUser");
        verify(model).addAttribute("jobs", jobs);
        verify(model).addAttribute("industries", Arrays.asList(industry));
        verify(model).addAttribute("provinces", provinces);
        verify(model).addAttribute(eq("industryJobCounts"), anyList());

        assertEquals("homepage", result);
    }

    @Test
    void testHomeWithoutUsername() {
        // Mock session without username
        when(session.getAttribute("username")).thenReturn(null);

        // Mock job data
        Job job = new Job();
        List<Job> jobs = Arrays.asList(job);
        when(jobService.getLatestJobs(5)).thenReturn(jobs);

        // Mock industry data
        Industry industry = new Industry();
        industry.setId(1L);
        when(industryService.getAllIndustries()).thenReturn(Arrays.asList(industry));
        when(jobService.getJobCountByIndustry(1L)).thenReturn(5);

        // Mock province data
        Province province = new Province();
        List<Province> provinces = Arrays.asList(province);
        when(provinceRepository.findAll()).thenReturn(provinces);

        String result = homeController.home(session, model);

        // Verify the model attributes
        verify(model, never()).addAttribute(eq("username"), anyString());
        verify(model).addAttribute("jobs", jobs);
        verify(model).addAttribute("industries", Arrays.asList(industry));
        verify(model).addAttribute("provinces", provinces);
        verify(model).addAttribute(eq("industryJobCounts"), anyList());

        assertEquals("homepage", result);
    }

    @Test
    void testHomeIndustryJobCountSorting() {
        // Mock industries
        Industry industry1 = new Industry();
        industry1.setId(1L);
        Industry industry2 = new Industry();
        industry2.setId(2L);

        when(industryService.getAllIndustries()).thenReturn(Arrays.asList(industry1, industry2));
        when(jobService.getJobCountByIndustry(1L)).thenReturn(5);
        when(jobService.getJobCountByIndustry(2L)).thenReturn(10);

        // Mock other data
        when(jobService.getLatestJobs(5)).thenReturn(Collections.emptyList());
        when(provinceRepository.findAll()).thenReturn(Collections.emptyList());

        homeController.home(session, model);

        // Verify industries are sorted by job count
        verify(model).addAttribute(eq("industryJobCounts"), argThat(list -> {
            List<Map.Entry<Industry, Integer>> entries = (List<Map.Entry<Industry, Integer>>) list;
            return entries.get(0).getValue() == 10 && entries.get(1).getValue() == 5;
        }));
    }
}
