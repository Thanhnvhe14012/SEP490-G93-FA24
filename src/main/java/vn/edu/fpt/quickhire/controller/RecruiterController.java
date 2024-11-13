package vn.edu.fpt.quickhire.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import vn.edu.fpt.quickhire.entity.*;
import vn.edu.fpt.quickhire.entity.DTO.StaffDTO;
import vn.edu.fpt.quickhire.entity.DTO.UserDTO;
import vn.edu.fpt.quickhire.model.FileUploadService;
import vn.edu.fpt.quickhire.model.impl.AccountServiceImpl;
import vn.edu.fpt.quickhire.model.impl.RecruiterServiceImpl;
import vn.edu.fpt.quickhire.model.repository.IndustryRepository;
import vn.edu.fpt.quickhire.model.repository.ProvinceRepository;
import vn.edu.fpt.quickhire.model.repository.RoleRepository;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
public class RecruiterController {
    @Autowired
    private AccountServiceImpl userService;

    @Autowired
    private RecruiterServiceImpl recruiterService;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private ProvinceRepository provinceRepository;

    @Autowired
    private IndustryRepository industryRepository;

    @Autowired
    private FileUploadService fileUploadService;

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

            Date dob = new SimpleDateFormat("yyyy-MM-dd").parse(staff.getDateOfBirth());
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

    @GetMapping("/listCompany")
    public String list(Model model) {
        List<Recruiter> listC = recruiterService.findAll();
        model.addAttribute("listC", listC);
        model.addAttribute("listNull", "listNullText");
        return "company/listCompany";
    }

    @GetMapping("/detailCompany/{id}")
    public String findById(@PathVariable long id, Model model) {
        Optional<Recruiter> c = recruiterService.findById(id);
        if (!c.isPresent()) {
            model.addAttribute("msg", "Company not found");
            return "company/listCompany";
        }
        Recruiter recruiter = c.get();
        model.addAttribute("company", recruiter);
        return "company/detailCompany";
    }

    @PostMapping("/updateCompany/{id}")
    public String update(@ModelAttribute Recruiter newRecruiter,
                         @PathVariable Long id,
                         @RequestParam(value = "image", required = false) MultipartFile image,
                         Model model) {
        Optional<Recruiter> existingRecruiter = recruiterService.findById(id);
        if (existingRecruiter.isPresent()) {
            Recruiter oldR = existingRecruiter.get();

            // Update fields
            oldR.setCompanyCode(newRecruiter.getCompanyCode());
            oldR.setCompanyName(newRecruiter.getCompanyName());
            oldR.setCompanyDescription(newRecruiter.getCompanyDescription());
            oldR.setCompanyScale(newRecruiter.getCompanyScale());
            oldR.setCompany_status(newRecruiter.getCompany_status());
            oldR.setCompany_location(newRecruiter.getCompany_location());
            oldR.setCompany_website(newRecruiter.getCompany_website());

            // Update logo if a new image is uploaded
            if (image != null && !image.isEmpty()) {
                try {
                    String imageUrl = fileUploadService.UploadFile(image);
                    oldR.setCompany_logo(imageUrl);
                } catch (IOException e) {
                    e.printStackTrace();
                    model.addAttribute("message", "Cập nhập thất bại khi tải lên ảnh.");
                    model.addAttribute("messageType", "error");
                    return "errorPage"; // Or redirect to an error page if upload fails
                }
            }
            try {
                recruiterService.save(oldR);
                model.addAttribute("message", "Cập nhập thành công!");
                model.addAttribute("messageType", "success");
            } catch (Exception e) {
                model.addAttribute("message", "Cập nhập thất bại. Xin thử lại.");
                model.addAttribute("messageType", "error");
            }
        } else {
            // Create new recruiter if not found
            newRecruiter.setId(id);
            if (image != null && !image.isEmpty()) {
                try {
                    String imageUrl = fileUploadService.UploadFile(image);
                    newRecruiter.setCompany_logo(imageUrl);
                } catch (IOException e) {
                    e.printStackTrace();
                    model.addAttribute("message", "Cập nhập thất bại khi tải lên ảnh.");
                    model.addAttribute("messageType", "error");
                    return "errorPage"; // Or handle accordingly
                }
            }
            recruiterService.save(newRecruiter);
            model.addAttribute("message", "Tạo công ty mới thành công!");
            model.addAttribute("messageType", "success");
        }
        return "redirect:/detailCompany/" + id;
    }

}
