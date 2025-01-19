package vn.edu.fpt.quickhire.controller.test;

import jakarta.servlet.http.HttpSession;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.ui.Model;
import vn.edu.fpt.quickhire.controller.UserController;
import vn.edu.fpt.quickhire.entity.Account;
import vn.edu.fpt.quickhire.entity.DTO.AccountDTO;
import vn.edu.fpt.quickhire.entity.DTO.PasswordRequestDTO;
import vn.edu.fpt.quickhire.entity.DTO.UserDTO;
import vn.edu.fpt.quickhire.entity.District;
import vn.edu.fpt.quickhire.entity.Province;
import vn.edu.fpt.quickhire.entity.Ward;
import vn.edu.fpt.quickhire.model.AccountService;
import vn.edu.fpt.quickhire.model.repository.*;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

public class UserControllerTest {
    @InjectMocks
    private UserController userController;

    @Mock
    private AccountService accountService;

    @Mock
    private AccountRepository accountRepository;

    @Mock
    private StaffRepository staffRepository;

    @Mock
    private ProvinceRepository provinceRepository;

    @Mock
    private DistrictRepository districtRepository;

    @Mock
    private WardRepository wardRepository;

    @Mock
    private HttpSession session;

    @Mock
    private Model model;

    @BeforeEach
    void setup() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testShowListUserForm() {
        List<AccountDTO> mockAccounts = new ArrayList<>();
        mockAccounts.add(new AccountDTO());
        when(accountService.fillAllAccount()).thenReturn(mockAccounts);

        String viewName = userController.showListUserForm(session, model);

        assertEquals("admin/listaccounts", viewName);
        verify(model, times(1)).addAttribute("accounts", mockAccounts);
    }

    @Test
    void testShowListStaffForm() {
        UserDTO mockUser = new UserDTO();
        mockUser.setId(1L);
        List<AccountDTO> mockAccounts = new ArrayList<>();
        when(accountService.fillAllStaffByRecruiterId(mockUser.getId())).thenReturn(mockAccounts);

        String viewName = userController.showListStaffForm(mockUser, model);

        assertEquals("admin/liststaff", viewName);
        verify(model, times(1)).addAttribute("accounts", mockAccounts);
    }

    @Test
    void testShowMyProfileForm() {
        UserDTO mockUser = new UserDTO();
        mockUser.setRole(2);
        when(provinceRepository.findAll()).thenReturn(new ArrayList<>());

        String viewName = userController.showMyProfileForm(mockUser, model);

        assertEquals("recruiter/myprofile", viewName);
        verify(model, times(1)).addAttribute("user", mockUser);
        verify(model, times(1)).addAttribute("provinces", new ArrayList<>());
    }

    @Test
    void testShowMyProfileCandidateForm() throws ParseException {
        UserDTO mockUser = new UserDTO();
        mockUser.setRole(4);
        mockUser.setDateOfBirth("15-01-1990");
        mockUser.setAddressId1("01");
        mockUser.setAddressId2("001");

        List<Province> provinces = new ArrayList<>();
        List<District> districts = new ArrayList<>();
        List<Ward> wards = new ArrayList<>();
        when(provinceRepository.findAll()).thenReturn(provinces);
        when(districtRepository.findByProvinceCode(mockUser.getAddressId1())).thenReturn(districts);
        when(wardRepository.findByDistrictCode(mockUser.getAddressId2())).thenReturn(wards);

        String viewName = userController.showMyProfileCandidateForm(mockUser, model);

        assertEquals("candidate/myprofile", viewName);
        verify(model, times(1)).addAttribute("user", mockUser);
        verify(model, times(1)).addAttribute("provinces", provinces);
        verify(model, times(1)).addAttribute("districts", districts);
        verify(model, times(1)).addAttribute("wards", wards);
    }

    @Test
    void testSaveAccountInfo() throws ParseException {
        UserDTO mockUser = new UserDTO();
        mockUser.setRole(2);
        UserDTO mockProfile = new UserDTO();

//        String viewName = userController.saveAccountInfo(mockProfile, mockUser);

//        assertEquals("redirect:/my-profile-recruiter", viewName);
        verify(accountService, times(1)).updateAccount(mockProfile);
    }

    @Test
    void testUpdatePassword_Success() {
        UserDTO mockUser = new UserDTO();
        mockUser.setId(1L);
        PasswordRequestDTO passwordRequest = new PasswordRequestDTO();
        passwordRequest.setCurrentPassword("oldPass");
        passwordRequest.setNewPassword("newPass");

        Account mockAccount = new Account();
        mockAccount.setPassword("oldPass");

        when(accountService.findUserById(mockUser.getId())).thenReturn(mockAccount);

        String viewName = userController.updatePassword(passwordRequest, mockUser, model);

        assertEquals("recruiter/myprofile", viewName);
        verify(accountService, times(1)).save(mockAccount);
    }

    @Test
    void testUpdatePassword_Failure() {
        UserDTO mockUser = new UserDTO();
        mockUser.setId(1L);
        PasswordRequestDTO passwordRequest = new PasswordRequestDTO();
        passwordRequest.setCurrentPassword("wrongPass");
        passwordRequest.setNewPassword("newPass");

        Account mockAccount = new Account();
        mockAccount.setPassword("oldPass");

        when(accountService.findUserById(mockUser.getId())).thenReturn(mockAccount);

        String viewName = userController.updatePassword(passwordRequest, mockUser, model);

        assertEquals("redirect:/error", viewName);
        verify(accountService, never()).save(any());
    }
}
