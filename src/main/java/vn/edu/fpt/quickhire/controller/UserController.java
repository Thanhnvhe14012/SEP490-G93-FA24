package vn.edu.fpt.quickhire.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import vn.edu.fpt.quickhire.entity.*;
import vn.edu.fpt.quickhire.entity.DTO.AccountDTO;
import vn.edu.fpt.quickhire.entity.DTO.PasswordRequestDTO;
import vn.edu.fpt.quickhire.entity.DTO.UserDTO;
import vn.edu.fpt.quickhire.model.AccountService;
import vn.edu.fpt.quickhire.model.FileUploadService;
import vn.edu.fpt.quickhire.model.repository.*;

import java.io.IOException;
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
    public String saveAccountInfo(@ModelAttribute UserDTO userProfileDTO,
                                  @RequestParam(value= "image", required = false) MultipartFile image,
                                  @SessionAttribute(name = "user", required = false) UserDTO user,
                                  HttpSession session) throws ParseException, IOException {

//        UserDTO userProfileDTO = new UserDTO();
//        userProfileDTO.setUsername(username);
//        userProfileDTO.setEmail(email);
//        userProfileDTO.setPhoneNumber(phoneNumber);
//        userProfileDTO.setCompanyCode(companyCode);
//        userProfileDTO.setCompanyName(companyName);
//        userProfileDTO.setCompanyDescription(companyDescription);
//        userProfileDTO.setCompanyScale(companyScale);
//        userProfileDTO.setAddress(address);
//        userProfileDTO.setAddressId1(addressId1);
//        userProfileDTO.setAddressId2(addressId2);
//        userProfileDTO.setAddressId3(addressId3);
//        userProfileDTO.setRole(user.getRole());
//        userProfileDTO.setDateOfBirth(dateOfBirth);
//        userProfileDTO.setBiography(biography);
//        userProfileDTO.setFirstName(firstName);
//        userProfileDTO.setMiddleName(middleName);
//        userProfileDTO.setLastName(lastName);

        userProfileDTO.setRole(user.getRole());
        userProfileDTO.setUsername(user.getUsername());
        Account x = accountService.updateAccount(userProfileDTO, image);
        UserDTO account = accountService.login(x.getUsername(), x.getPassword());

        session.setAttribute("user", account);
        session.setAttribute("userDisplayName", account.getDisplayName());

        if (user.getRole() == 2) {
            return "redirect:/my-profile-recruiter";
        } else if (user.getRole() == 3) {
            return "redirect:/my-profile-candidate";
        } else {
            return "redirect:/my-profile-staff";
        }
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

    @GetMapping("/my-profile-staff")
    public String showMyProfileStaffForm(@SessionAttribute(name = "user", required = false) UserDTO user, Model model) throws ParseException {
        SimpleDateFormat inputFormat = new SimpleDateFormat("dd-MM-yyyy");
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
        System.out.println(user.getDateOfBirth());
        if (user.getRole() == 3) {
            user.setDateOfBirth(outputFormat.format(inputFormat.parse(user.getDateOfBirth())));
            model.addAttribute("user", user);
            List<Province> provinces = provinceRepository.findAll();
            model.addAttribute("provinces", provinces);
            List<District> districts = districtRepository.findByProvinceCode(user.getAddressId1());
            model.addAttribute("districts", districts);
            List<Ward> wards = wardRepository.findByDistrictCode(user.getAddressId2());
            model.addAttribute("wards", wards);
            return "staff/myprofile";
        } else return "redirect:/login";
    }

}
