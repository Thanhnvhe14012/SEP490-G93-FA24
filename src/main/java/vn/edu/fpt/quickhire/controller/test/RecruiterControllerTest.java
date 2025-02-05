//package vn.edu.fpt.quickhire.controller.test;
//
//import org.junit.jupiter.api.BeforeEach;
//import org.junit.jupiter.api.Test;
//import org.mockito.InjectMocks;
//import org.mockito.Mock;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.test.web.servlet.MockMvc;
//import org.springframework.test.web.servlet.setup.MockMvcBuilders;
//import vn.edu.fpt.quickhire.controller.RecruiterController;
//import vn.edu.fpt.quickhire.entity.Account;
//import vn.edu.fpt.quickhire.entity.DTO.StaffDTO;
//import vn.edu.fpt.quickhire.entity.DTO.UserDTO;
//import vn.edu.fpt.quickhire.entity.Recruiter;
//import vn.edu.fpt.quickhire.model.impl.AccountServiceImpl;
//import vn.edu.fpt.quickhire.model.impl.RecruiterServiceImpl;
//import vn.edu.fpt.quickhire.model.repository.IndustryRepository;
//import vn.edu.fpt.quickhire.model.repository.ProvinceRepository;
//import vn.edu.fpt.quickhire.model.repository.RecruiterRepository;
//
//import java.util.Optional;
//
//import static org.mockito.Mockito.*;
//import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
//import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
//import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
//
//@SpringBootTest
//public class RecruiterControllerTest {
//    @Mock
//    private AccountServiceImpl accountService;
//
//    @Mock
//    private RecruiterServiceImpl recruiterService;
//
//    @Mock
//    private IndustryRepository industryRepository;
//
//    @Mock
//    private ProvinceRepository provinceRepository;
//
//    @Mock
//    private RecruiterRepository recruiterRepository;
//
//    @InjectMocks
//    private RecruiterController recruiterController;
//
//    private MockMvc mockMvc;
//
//    @BeforeEach
//    public void setup() {
//        mockMvc = MockMvcBuilders.standaloneSetup(recruiterController).build();
//    }
//
////    @Test
////    public void testShowCreateStaff_ReturnsAddStaffView() throws Exception {
////        // Mock authenticated user as recruiter (role 2)
////        UserDTO userDTO = new UserDTO();
////        userDTO.setRole(2);
////
////        // Trigger the request
////        mockMvc.perform(get("/createStaff").sessionAttr("user", userDTO))
////                .andExpect(status().isOk())
////                .andExpect(view().name("recruiter/addstaff"))
////                .andExpect(model().attributeExists("industryList", "staff", "provinces"));
////    }
//
//    @Test
//    public void testShowCreateStaff_RedirectsWhenNotAuthenticatedAsRecruiter() throws Exception {
//        // Simulate user with non-recruiter role
//        UserDTO userDTO = new UserDTO();
//        userDTO.setRole(3);  // Candidate role instead of recruiter
//
//        mockMvc.perform(get("/createStaff").sessionAttr("user", userDTO))
//                .andExpect(status().is3xxRedirection())
//                .andExpect(redirectedUrl("/"));
//    }
//
//    @Test
//    public void testCreateStaff_ValidData_ShouldCreateNewStaff() throws Exception {
//        // Prepare the mock userDTO (Recruiter)
//        UserDTO userDTO = new UserDTO();
//        userDTO.setRole(2);
//
//        // Create mock data for StaffDTO
//        // Note: Assume the existence of proper DTO constructor setters for simplification
//        StaffDTO staffDTO = new StaffDTO();
//        staffDTO.setUsername("john_doe");
//        staffDTO.setPassword("password123");
//        staffDTO.setEmail("john.doe@example.com");
//        staffDTO.setAddress("123 Main St");
//        staffDTO.setDateOfBirth("1990-01-01");
//        staffDTO.setFirstName("John");
//        staffDTO.setMiddleName("M");
//        staffDTO.setLastName("Doe");
//
//        // Perform the POST request
//        mockMvc.perform(post("/createStaff")
//                        .sessionAttr("user", userDTO)
//                        .param("username", staffDTO.getUsername())
//                        .param("password", staffDTO.getPassword())
//                        .param("email", staffDTO.getEmail())
//                        .param("address", staffDTO.getAddress())
//                        .param("dateOfBirth", staffDTO.getDateOfBirth())
//                        .param("firstName", staffDTO.getFirstName())
//                        .param("middleName", staffDTO.getMiddleName())
//                        .param("lastName", staffDTO.getLastName()))
//                .andExpect(status().is3xxRedirection())
//                .andExpect(redirectedUrl("/"));
//
//        // Verify interactions with the necessary services
//        verify(accountService, times(1)).save(any());
//    }
//
////    @Test
////    public void testFindById_CompanyExists_ShouldReturnCompanyDetail() throws Exception {
////        // Simulate Recruiter service returning a recruiter for the provided ID
////        Recruiter recruiter = new Recruiter();
////        recruiter.setCompanyName("Tech Corp");
////        when(recruiterService.findById(1L)).thenReturn(Optional.of(recruiter));
////
////        mockMvc.perform(get("/detailCompany/1"))
////                .andExpect(status().isOk())
////                .andExpect(view().name("company/detailCompany"))
////                .andExpect(model().attribute("company", recruiter));
////    }
//
////    @Test
////    public void testFindById_CompanyNotFound_ShouldReturnErrorPage() throws Exception {
////        when(recruiterService.findById(99L)).thenReturn(Optional.empty());
////
////        mockMvc.perform(get("/detailCompany/99"))
////                .andExpect(status().isOk())
////                .andExpect(view().name("company/listCompany"))
////                .andExpect(model().attribute("msg", "Không tìm thấy thông tin"));
////    }
//
//    @Test
//    public void testUpdateAccount_ShouldRedirectOnSuccessfulUpdate() throws Exception {
//        // Create mock DTO user for Recruiter
//        UserDTO userDTO = new UserDTO();
//        userDTO.setRole(2);
//        userDTO.setId(1L);
//        userDTO.setUsername("new_username");
//        userDTO.setCompanyCode("COMP123");
//        userDTO.setCompanyName("New Tech Corp");
//
//        // Simulate successful save method for accountService
//        Account account = new Account();
//        account.setId(userDTO.getId());
//        when(accountService.save(any(Account.class))).thenReturn(account);
//
//        mockMvc.perform(post("/updateAccount")
//                        .sessionAttr("user", userDTO)
//                        .param("username", userDTO.getUsername())
//                        .param("companyCode", userDTO.getCompanyCode())
//                        .param("companyName", userDTO.getCompanyName()))
//                .andExpect(status().isOk())
//                .andExpect(view().name("home"))
//                .andExpect(model().attribute("error", "Đăng ký thành công!"));
//    }
//
//}
