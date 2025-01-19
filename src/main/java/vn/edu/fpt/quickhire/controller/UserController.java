package vn.edu.fpt.quickhire.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import vn.edu.fpt.quickhire.entity.*;
import vn.edu.fpt.quickhire.entity.DTO.AccountDTO;
import vn.edu.fpt.quickhire.entity.DTO.PasswordRequestDTO;
import vn.edu.fpt.quickhire.entity.DTO.UserDTO;
import vn.edu.fpt.quickhire.model.AccountService;
import vn.edu.fpt.quickhire.model.repository.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    AccountService accountService;

    @Autowired
    AccountRepository accountRepository;

    @Autowired
    StaffRepository staffRepository;

    @Autowired
    ProvinceRepository provinceRepository;
    @Autowired
    private DistrictRepository districtRepository;
    @Autowired
    private WardRepository wardRepository;
    @Autowired
    private RecruiterRepository recruiterRepository;

    @GetMapping("/listUser")
    public String showListUserForm(HttpSession session,
                                   Model model) {
        List<AccountDTO> lstAccount = accountService.fillAllAccount();
        model.addAttribute("accounts", lstAccount);
        return "admin/listaccounts";
    }

    @GetMapping("/staffList")
    public String listAllStaff(@SessionAttribute(name = "user", required = false) UserDTO userDTO,
                                    Model model) {
        if (userDTO == null) {
            return "redirect:/login";
        }
        Recruiter recruiter = recruiterRepository.findByAccount_Id(userDTO.getId());
        List<Staff> staffs = staffRepository.findAllByRecruiter(recruiter);
        model.addAttribute("staffs", staffs);
        System.out.println(staffs);
        return "recruiter/staffList";
    }

    @GetMapping("/my-profile-recruiter")
    public String showMyProfileForm(@SessionAttribute(name = "user", required = false) UserDTO user, Model model) {

        if (user.getRole() == 2) {
            model.addAttribute("user", user);
            List<Province> provinces = provinceRepository.findAll();

            // Đưa danh sách tỉnh vào model để sử dụng trong JSP
            model.addAttribute("provinces", provinces);
            List<District> districts = districtRepository.findByProvinceCode(user.getAddressId1());
            model.addAttribute("districts", districts);
            List<Ward> wards = wardRepository.findByDistrictCode(user.getAddressId2());
            model.addAttribute("wards", wards);
            return "recruiter/myprofile";
        } else return "redirect:/login";
    }

    @GetMapping("/my-profile-candidate")
    public String showMyProfileCandidateForm(@SessionAttribute(name = "user", required = false) UserDTO user, Model model) throws ParseException {
        SimpleDateFormat inputFormat = new SimpleDateFormat("dd-MM-yyyy");
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
        if (user.getRole() == 4) {
            user.setDateOfBirth(outputFormat.format(inputFormat.parse(user.getDateOfBirth())));
            model.addAttribute("user", user);
            List<Province> provinces = provinceRepository.findAll();
            model.addAttribute("provinces", provinces);
            List<District> districts = districtRepository.findByProvinceCode(user.getAddressId1());
            model.addAttribute("districts", districts);
            List<Ward> wards = wardRepository.findByDistrictCode(user.getAddressId2());
            model.addAttribute("wards", wards);
            return "candidate/myprofile";
        } else return "redirect:/login";
    }

    @PostMapping("/saveAccountInfor")
    public String saveAccountInfo(@RequestBody UserDTO userProfileDTO, @SessionAttribute(name = "user", required = false) UserDTO user, HttpSession session) throws ParseException {

        // Validate and save user profile (e.g., via service)
        userProfileDTO.setRole(user.getRole());
        Account x = accountService.updateAccount(userProfileDTO);
        UserDTO account = accountService.login(x.getUsername(), x.getPassword());

        session.setAttribute("user", account);
        session.setAttribute("userDisplayName", account.getDisplayName());
        return "redirect:/my-profile-recruiter";

    }

    @PostMapping("/update-password")
    public String updatePassword(@RequestBody PasswordRequestDTO passwordRequest, @SessionAttribute(name = "user", required = false) UserDTO user, Model model) {

        Account account = accountService.findUserById(user.getId());
        if (passwordRequest.getCurrentPassword().equals(account.getPassword())) {
            account.setPassword(passwordRequest.getNewPassword());
            accountService.save(account);
            model.addAttribute("user", user);
            return "recruiter/myprofile";
        }
        else return "redirect:/error";


    }
}
