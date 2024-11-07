package vn.edu.fpt.quickhire.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import vn.edu.fpt.quickhire.entity.*;
import vn.edu.fpt.quickhire.entity.DTO.StaffDTO;
import vn.edu.fpt.quickhire.entity.DTO.UserDTO;
import vn.edu.fpt.quickhire.model.impl.AccountServiceImpl;
import vn.edu.fpt.quickhire.model.repository.IndustryRepository;
import vn.edu.fpt.quickhire.model.repository.ProvinceRepository;
import vn.edu.fpt.quickhire.model.repository.RoleRepository;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class RecruiterController {
    @Autowired
    private AccountServiceImpl userService;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private ProvinceRepository provinceRepository;

    @Autowired
    private IndustryRepository industryRepository;


    @GetMapping("/createStaff")
    public String showCreateStaff(@SessionAttribute(name = "user", required = false) UserDTO userDTO, Model model) {
        if (userDTO != null && userDTO.getRole() == 2) {
            List<Industry> industryList = industryRepository.findAll();
            model.addAttribute("industryList", industryList);
            model.addAttribute("staff", new StaffDTO());
            List<Province> provinces = provinceRepository.findAll();
            model.addAttribute("provinces", provinces);
            return "recruiter/addstaff";
        } else return "/homepage";

    }

    @PostMapping("/createStaff")
    public String createStaff(@ModelAttribute("staff") StaffDTO staff, @SessionAttribute(name = "user", required = true) UserDTO userDTO, Model model) throws ParseException {
        if (userDTO.getRole() == 2) {

            Account account = new Account();
            account.setUsername(staff.getUsername());
            account.setPassword(staff.getPassword());
            account.setEmail(staff.getEmail());

            account.setAddressId1(staff.getAddressId1());
            account.setAddressId2(staff.getAddressId2());
            account.setAddressId3(staff.getAddressId3());
            account.setAddress(staff.getAddress());

            Date dob=new SimpleDateFormat("yyyy-MM-dd").parse(staff.getDateOfBirth());
            account.setDateOfBirth(dob);
            account.setFirstName(staff.getFirstName());
            account.setMiddleName(staff.getMiddleName());
            account.setLastName(staff.getLastName());

//            Account accountSaved = userService.save(account);

            Recruiter recruiter = new Recruiter();
            recruiter.setCompanyDescription(userDTO.getCompanyDescription());
            recruiter.setCompanyScale(userDTO.getCompanyScale());
            recruiter.setCompanyName(userDTO.getCompanyName());
            recruiter.setIndustryId(staff.getIndustryId());
            recruiter.setManagerId(Math.toIntExact(userDTO.getId()));


            Role existingRole = roleRepository.findById(Long.valueOf(4))
                    .orElseThrow(() -> new RuntimeException("Role not found"));

            UserRole userRole = new UserRole();
            userRole.setRole(existingRole);


            account.setUserRole(userRole);
            account.setRecruiter(recruiter);
            userService.save(account);
            return "homepage";
        }
        return "homepage";

    }

}
