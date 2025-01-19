package vn.edu.fpt.quickhire.controller.test;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpSession;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.*;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import vn.edu.fpt.quickhire.controller.LoginController;
import vn.edu.fpt.quickhire.entity.Account;
import vn.edu.fpt.quickhire.entity.PasswordReset;
import vn.edu.fpt.quickhire.entity.DTO.UserDTO;
import vn.edu.fpt.quickhire.model.FileUploadService;
import vn.edu.fpt.quickhire.model.impl.AccountServiceImpl;
import vn.edu.fpt.quickhire.model.impl.RecruiterServiceImpl;
import vn.edu.fpt.quickhire.model.repository.PasswordResetRepository;
import vn.edu.fpt.quickhire.model.repository.ProvinceRepository;

import java.io.IOException;
import java.text.ParseException;
import java.util.Optional;
import java.util.Random;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

public class LoginControllerTest {
    @InjectMocks
    private LoginController loginController;

    @Mock
    private AccountServiceImpl userService;

    @Mock
    private ProvinceRepository provinceRepository;

    @Mock
    private JavaMailSender mailSender;

    @Mock
    private PasswordResetRepository passwordResetRepository;

    @Mock
    private FileUploadService fileUploadService;

    @Mock
    private RecruiterServiceImpl recruiterService;

    @Mock
    private HttpSession session;

    @Mock
    private Model model;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    // Test đăng nhập với tài khoản hợp lệ
    @Test
    void testLoginSuccess() {
        String username = "candidate";
        String password = "123";
        UserDTO mockUser = new UserDTO();
        mockUser.setUsername(username);

        when(userService.login(username, password)).thenReturn(mockUser);

        String result = loginController.login(username, password, session, model);

        assertEquals("redirect:/", result);
        verify(session, times(1)).setAttribute("user", mockUser);
    }

    // Test đăng nhập thất bại (tài khoản không tồn tại hoặc bị khóa)
    @Test
    void testLoginFailure() {
        String username = "candidate";
        String password = "wrongpassword";

        when(userService.login(username, password)).thenReturn(null);

        String result = loginController.login(username, password, session, model);

        assertEquals("login/login", result);
        verify(model, times(1)).addAttribute("error", "Không tìm thấy tài khoản hoặc tài khoản đã bị khóa");
    }

    // Test đăng ký tài khoản mới (thành công)
    @Test
    void testRegisterSuccess() throws IOException, ParseException {
        UserDTO userDTO = new UserDTO();
        userDTO.setUsername("user1");
        userDTO.setEmail("user1@test.com");
        userDTO.setPassword("password");
        MultipartFile image = mock(MultipartFile.class);
        when(userService.checkRegister(userDTO.getUsername())).thenReturn(true);
        when(fileUploadService.uploadFile(image)).thenReturn("url_image");

        String result = loginController.registerUser(userDTO, model, image);

        assertEquals("login/login", result);
        verify(userService, times(1)).save(any(Account.class));
    }

    // Test đăng ký tài khoản mới (tài khoản đã tồn tại)
    @Test
    void testRegisterUsernameExists() throws IOException, ParseException {
        UserDTO userDTO = new UserDTO();
        userDTO.setUsername("user1");
        MultipartFile image = mock(MultipartFile.class);

        when(userService.checkRegister(userDTO.getUsername())).thenReturn(false);

        String result = loginController.registerUser(userDTO, model, image);

        assertEquals("login/register", result);
        verify(model, times(1)).addAttribute("error", "Tài khoản đã tồn tại");
    }

    // Test gửi mã xác nhận quên mật khẩu
    @Test
    void testSendVerificationCode() {
        String email = "user1@test.com";
        String verificationCode = "123456";
        PasswordReset mockReset = new PasswordReset(email, verificationCode, null);

        when(passwordResetRepository.save(any(PasswordReset.class))).thenReturn(mockReset);

        String result = loginController.sendVerificationCode(email, model);

        assertEquals("login/verify-code", result);
        verify(mailSender, times(1)).send((MimeMessage) any());
    }

    // Test xác nhận mã quên mật khẩu hợp lệ
    @Test
    void testVerifyCodeSuccess() {
        String email = "user1@test.com";
        String code = "123456";
        PasswordReset reset = new PasswordReset(email, code, null);
        Optional<PasswordReset> mockReset = Optional.of(reset);

        when(passwordResetRepository.findByEmail(email)).thenReturn(mockReset);

        String result = loginController.verifyCode(email, code, model);

        assertEquals("login/reset-password", result);
    }

    // Test xác nhận mã quên mật khẩu không hợp lệ
    @Test
    void testVerifyCodeFailure() {
        String email = "user1@test.com";
        String code = "wrongcode";

        when(passwordResetRepository.findByEmail(email)).thenReturn(Optional.empty());

        String result = loginController.verifyCode(email, code, model);

        assertEquals("login/verify-code", result);
        verify(model, times(1)).addAttribute("error", "Không tìm thấy yêu cầu đặt lại mật khẩu cho email này.");
    }

    // Test reset mật khẩu thành công
    @Test
    void testResetPasswordSuccess() {
        String email = "user1@test.com";
        String newPassword = "newpassword";
        Account mockAccount = new Account();
        mockAccount.setEmail(email);
        mockAccount.setPassword(newPassword);

        when(userService.findByEmail(email)).thenReturn(Optional.of(mockAccount));

        String result = loginController.resetPassword(email, newPassword, model);

        assertEquals("login/login", result);
        verify(userService, times(1)).save(mockAccount);
        verify(model, times(1)).addAttribute("error", "Thay đổi mật khẩu thành công");
    }

    // Test reset mật khẩu không tìm thấy tài khoản
    @Test
    void testResetPasswordFailure() {
        String email = "user1@test.com";
        String newPassword = "newpassword";

        when(userService.findByEmail(email)).thenReturn(Optional.empty());

        String result = loginController.resetPassword(email, newPassword, model);

        assertEquals("login/login", result);
        verify(model, times(1)).addAttribute("error", "Không tìm thấy tài khoản để đặt lại mật khẩu.");
    }
}
