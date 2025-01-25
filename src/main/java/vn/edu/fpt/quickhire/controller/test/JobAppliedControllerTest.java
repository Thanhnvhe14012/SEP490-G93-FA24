//package vn.edu.fpt.quickhire.controller.test;
//
//import org.junit.jupiter.api.BeforeEach;
//import org.junit.jupiter.api.Test;
//import org.mockito.InjectMocks;
//import org.mockito.Mock;
//import org.mockito.MockitoAnnotations;
//import org.springframework.ui.Model;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//import vn.edu.fpt.quickhire.controller.JobAppliedController;
//import vn.edu.fpt.quickhire.entity.CV;
//import vn.edu.fpt.quickhire.entity.DTO.UserDTO;
//import vn.edu.fpt.quickhire.entity.JobApplied;
//import vn.edu.fpt.quickhire.model.impl.CVServiceImpl;
//import vn.edu.fpt.quickhire.model.impl.FileUploadServiceImpl;
//import vn.edu.fpt.quickhire.model.impl.JobAppliedServiceImpl;
//
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.List;
//import java.util.Optional;
//
//import static org.junit.jupiter.api.Assertions.*;
//import static org.mockito.ArgumentMatchers.any;
//import static org.mockito.Mockito.*;
//public class JobAppliedControllerTest {
//    @InjectMocks
//    private JobAppliedController jobAppliedController;
//
//    @Mock
//    private JobAppliedServiceImpl jobAppliedService;
//
//    @Mock
//    private CVServiceImpl cvService;
//
//    @Mock
//    private FileUploadServiceImpl fileUploadService;
//
//    @Mock
//    private RedirectAttributes redirectAttributes;
//
//    @Mock
//    private Model model;
//
//    @Mock
//    private MultipartFile multipartFile;
//
//    @BeforeEach
//    void setUp() {
//        MockitoAnnotations.openMocks(this);
//    }
//
//    @Test
//    void testShowViewJobAppliedForm() {
//        UserDTO userDTO = new UserDTO();
//        userDTO.setId(1L);
//
//        List<JobApplied> jobApplieds = new ArrayList<>();
//        when(jobAppliedService.getJobAppliedByUserId(1L)).thenReturn(jobApplieds);
//
//        String viewName = jobAppliedController.showViewJobAppliedForm(userDTO, model, null);
////
//        assertEquals("v2/viewAppliedJob", viewName);
//        verify(model).addAttribute("jobApplieds", jobApplieds);
//    }
//
//    @Test
//    void testApplyForJob_Success() throws IOException {
//        UserDTO userDTO = new UserDTO();
//        userDTO.setId(1L);
//        userDTO.setRole(4);
//
//        when(fileUploadService.uploadFile(multipartFile)).thenReturn("mockFileUrl");
//        doNothing().when(cvService).save(any(CV.class), eq(multipartFile));
//
//        String viewName = jobAppliedController.applyForJob(1L, "test message", multipartFile, userDTO, redirectAttributes);
//
//        assertEquals("redirect:/job/jobDetail?id=1", viewName);
//        verify(jobAppliedService).save(any(JobApplied.class));
//    }
//
//    @Test
//    void testApplyForJob_Unauthorized() {
//        UserDTO userDTO = new UserDTO();
//        userDTO.setId(1L);
//        userDTO.setRole(3);
//
//        String viewName = jobAppliedController.applyForJob(1L, "test message", multipartFile, userDTO, redirectAttributes);
//
//        assertEquals("redirect:/job/jobDetail?id=1", viewName);
//        verify(redirectAttributes).addFlashAttribute("errorMessage", "Bạn không có quyền ứng tuyển cho công việc này.");
//        verifyNoInteractions(jobAppliedService);
//    }
//
//    @Test
//    void testApplyForJob_NoUser() {
//        String viewName = jobAppliedController.applyForJob(1L, "test message", multipartFile, null, redirectAttributes);
//
//        assertEquals("redirect:/login", viewName);
//        verifyNoInteractions(jobAppliedService);
//    }
//
//    @Test
//    void testUnapplyJob_Success() {
//        UserDTO userDTO = new UserDTO();
//        userDTO.setId(1L);
//
//        when(jobAppliedService.unapplyForJob(1L, 1L)).thenReturn(true);
//
//        String viewName = jobAppliedController.unapplyJob(1L, userDTO, redirectAttributes);
//
//        assertEquals("redirect:/job/jobDetail?id=1", viewName);
//        verify(redirectAttributes).addFlashAttribute("message", "Bạn đã rút hồ sơ thành công.");
//    }
//
//    @Test
//    void testUnapplyJob_Failure() {
//        UserDTO userDTO = new UserDTO();
//        userDTO.setId(1L);
//
//        when(jobAppliedService.unapplyForJob(1L, 1L)).thenReturn(false);
//
//        String viewName = jobAppliedController.unapplyJob(1L, userDTO, redirectAttributes);
//
//        assertEquals("redirect:/job/jobDetail?id=1", viewName);
//        verify(redirectAttributes).addFlashAttribute("errorMessage", "Có lỗi xảy ra khi rút hồ sơ. Vui lòng thử lại.");
//    }
//
//    @Test
//    void testUpdateStatus_Success() {
//        JobApplied jobApplied = new JobApplied();
//        jobApplied.setJobID(1L);
//
//        when(jobAppliedService.findById(1L)).thenReturn(Optional.of(jobApplied));
//
//        String viewName = jobAppliedController.updateStatus(1L, 2, redirectAttributes);
//
//        assertEquals("redirect:/job/viewJobDetailRecruiter?id?=1", viewName);
//        verify(jobAppliedService).save(any(JobApplied.class));
//        verify(redirectAttributes).addFlashAttribute("message", "Trạng thái hồ sơ đã được cập nhật thành công.");
//    }
//
//    @Test
//    void testUpdateStatus_NotFound() {
//        when(jobAppliedService.findById(1L)).thenReturn(Optional.empty());
//
//        String viewName = jobAppliedController.updateStatus(1L, 2, redirectAttributes);
//
//        assertEquals("redirect:/job/viewJobDetailRecruiter?id?=null", viewName);
//        verify(redirectAttributes).addFlashAttribute("errorMessage", "Không tìm thấy hồ sơ ứng tuyển.");
//    }
//}
