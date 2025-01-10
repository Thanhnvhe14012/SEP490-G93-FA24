package vn.edu.fpt.quickhire.controller;

import jakarta.servlet.http.HttpSession;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
import vn.edu.fpt.quickhire.model.impl.UserRoleServiceImpl;
import vn.edu.fpt.quickhire.model.repository.AccountRepository;
import vn.edu.fpt.quickhire.model.repository.IndustryRepository;
import vn.edu.fpt.quickhire.model.repository.ProvinceRepository;
import vn.edu.fpt.quickhire.model.repository.RoleRepository;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.function.Function;
import java.util.stream.Collectors;

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
    @Autowired
    private AccountRepository accountRepository;

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
        if(userDTO == null){
            return "redirect:/login";
        }
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
//            recruiter.setIndustryId(staff.getIndustryId());
//            recruiter.setManagerId(userDTO.getId());


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


//    @DeleteMapping("/deleteOrRestoreCompany/{id}")
//    public ResponseEntity<String> deleteOrRestoreCompany(@PathVariable long id) {
//        try {
//            Optional<Recruiter> existingRecruiter = recruiterService.findById(id);
//            if (existingRecruiter.isPresent()) {
//                Recruiter oldR = existingRecruiter.get();
//                Hibernate.initialize(oldR.getAccount());
//                int status = oldR.getCompany_status();
//                List<Recruiter> listStaff = recruiterService.findByManagerIdAndCompanyCode(oldR.getAccount().getId(), oldR.getCompanyCode());
//
//                // Change the company status
//                if (status == 1) {
//                    oldR.setCompany_status(0);
//                    recruiterService.save(oldR);
//                    if (!listStaff.isEmpty()) {
//                        for (Recruiter staff : listStaff) {
//                            staff.setCompany_status(0);
//                            recruiterService.save(staff);
//                        }
//                    }
//                    return ResponseEntity.ok("Company deleted successfully.");
//                } else if (status == 0) {
//                    oldR.setCompany_status(1);
//                    recruiterService.save(oldR);
//                    if (!listStaff.isEmpty()) {
//                        for (Recruiter staff : listStaff) {
//                            staff.setCompany_status(1);
//                            recruiterService.save(staff);
//                        }
//                    }
//                    return ResponseEntity.ok("Company restored successfully.");
//                }
//            }
//            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Company not found.");
//        } catch (Exception e) {
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to update the company status.");
//        }
//    }
//
//
//    @GetMapping("/listCompany")
//    public String list(Model model) {
//        List<Recruiter> listC = recruiterService.findAll();
//        // dùng để lấy các bản ghi unique
//        List<Recruiter> listUniqueC= listC.stream()
//                .collect(Collectors.toMap(
//                        Recruiter::getCompanyCode,
//                        Function.identity(),
//                        (existing, replacement) -> existing // Keep the first encountered record
//                ))
//                .values()
//                .stream()
//                .collect(Collectors.toList());
//        model.addAttribute("listC", listUniqueC);
//        model.addAttribute("listNull", "listNullText");
//        return "company/listCompany";
//    }

    @GetMapping("/detailCompany/{id}")
    public String findById(@PathVariable long id, Model model) {
//        if (!userDTO.getRole() == 2) {
//
//
//            return "homepage";
//        }
        Optional<Recruiter> c = recruiterService.findById(id);
        if (!c.isPresent()) {
            model.addAttribute("msg", "Không tìm thấy thông tin");
            return "company/listCompany";
        }
        Recruiter recruiter = c.get();
        model.addAttribute("company", recruiter);
        return "company/detailCompany";
    }

//    @PostMapping("/updateCompany/{id}")
//    public String update(@ModelAttribute Recruiter newRecruiter,
//                         @PathVariable Long id,
//                         @RequestParam(value = "image", required = false) MultipartFile image,
//                         Model model) {
//        Optional<Recruiter> existingRecruiter = recruiterService.findById(id);
//        // update the Recruiter
//        if (existingRecruiter.isPresent()) {
//            Recruiter oldR = existingRecruiter.get();
//            Hibernate.initialize(oldR.getAccount());
//            Long accId = oldR.getAccount().getId();
//            List<Recruiter> listStaff = recruiterService.findByManagerIdAndCompanyCode(oldR.getAccount().getId(), oldR.getCompanyCode());
//
//            // Update fields
//            oldR.setCompanyCode(newRecruiter.getCompanyCode());
//            oldR.setCompanyName(newRecruiter.getCompanyName());
//            oldR.setCompanyDescription(newRecruiter.getCompanyDescription());
//            oldR.setCompanyScale(newRecruiter.getCompanyScale());
//            oldR.setCompany_status(newRecruiter.getCompany_status());
//            oldR.setCompany_location(newRecruiter.getCompany_location());
//            oldR.setCompany_website(newRecruiter.getCompany_website());
//
//            // Update logo if a new image is uploaded
//            if (image != null && !image.isEmpty()) {
//                try {
//                    String imageUrl = fileUploadService.UploadFile(image);
//                    oldR.setCompany_logo(imageUrl);
//                } catch (IOException e) {
//                    e.printStackTrace();
//                    model.addAttribute("message", "Cập nhập thất bại khi tải lên ảnh.");
//                    model.addAttribute("messageType", "error");
//                    return "errorPage"; // Or redirect to an error page if upload fails
//                }
//            }
//            try {
//                recruiterService.save(oldR);
//                model.addAttribute("message", "Cập nhập thành công!");
//                model.addAttribute("messageType", "success");
//            } catch (Exception e) {
//                model.addAttribute("message", "Cập nhập thất bại. Xin thử lại.");
//                model.addAttribute("messageType", "error");
//            }
//            //update recruiter's staffs
//            if (!listStaff.isEmpty()) {
//                for (Recruiter staff : listStaff) {
//                    staff.setCompanyCode(newRecruiter.getCompanyCode());
//                    staff.setCompanyName(newRecruiter.getCompanyName());
//                    staff.setCompanyDescription(newRecruiter.getCompanyDescription());
//                    staff.setCompanyScale(newRecruiter.getCompanyScale());
//                    staff.setCompany_status(newRecruiter.getCompany_status());
//                    staff.setCompany_location(newRecruiter.getCompany_location());
//                    staff.setCompany_website(newRecruiter.getCompany_website());
//                    staff.setCompany_logo(oldR.getCompany_logo());
//                    try {
//                        recruiterService.save(staff);
//                        model.addAttribute("message", "Cập nhập thành công!");
//                        model.addAttribute("messageType", "success");
//                    } catch (Exception e) {
//                        model.addAttribute("message", "Cập nhập thất bại. Xin thử lại.");
//                        model.addAttribute("messageType", "error");
//                    }
//                }
//            }
//        } else {
//            // Create new recruiter if not found
//            newRecruiter.setId(id);
//            if (image != null && !image.isEmpty()) {
//                try {
//                    String imageUrl = fileUploadService.UploadFile(image);
//                    newRecruiter.setCompany_logo(imageUrl);
//                } catch (IOException e) {
//                    e.printStackTrace();
//                    model.addAttribute("message", "Cập nhập thất bại khi tải lên ảnh.");
//                    model.addAttribute("messageType", "error");
//                    return "errorPage"; // Or handle accordingly
//                }
//            }
//            recruiterService.save(newRecruiter);
//            model.addAttribute("message", "Tạo công ty mới thành công!");
//            model.addAttribute("messageType", "success");
//        }
//        return "redirect:/detailCompany/" + id;
//    }

    @GetMapping("/viewCompany/{id}")
    public String showViewCompany(@PathVariable Long id,
                                  Model model) {
        Recruiter recruiter = recruiterService.findByAccount_Id(id);
        if(recruiter!=null) {
            model.addAttribute("recruiter", recruiter);
            return "recruiter/profile";
        }
        else {return "errorPage";}
    }


    @PostMapping("/updateAccount")
    public String registerUser(@ModelAttribute("user") UserDTO user, Model model,@RequestParam("image") MultipartFile image
    ) throws ParseException {

        if (user.getRole() == 2) {
            Account account = accountRepository.findById(user.getId().longValue());
            account.setUsername(user.getUsername());
            account.setPassword(user.getPassword());
            account.setEmail(user.getEmail());

            account.setAddressId1(user.getAddressId1());
            account.setAddressId2(user.getAddressId2());
            account.setAddressId3(user.getAddressId3());
            account.setAddress(user.getAddress());

//            Account accountSaved = userService.save(account);

            Recruiter existRecruiter= recruiterService.findByCode(user.getCompanyCode());
            if(existRecruiter != null) {
                model.addAttribute("message", "Failed to add recruiter . Company Code duplicate.");
                model.addAttribute("messageType", "error");
                return "login/register";
            }

            Recruiter recruiter = account.getRecruiter();
            recruiter.setCompanyCode(user.getCompanyCode());
            recruiter.setCompanyDescription(user.getCompanyDescription());
            recruiter.setCompanyScale(user.getCompanyScale());
            recruiter.setCompanyName(user.getCompanyName());
            if (image!= null && !image .isEmpty()) {
                try {
                    String imageUrl = fileUploadService.UploadFile(image);
                    recruiter.setCompany_logo(imageUrl);
                } catch (IOException e) {
                    // Handle the exception properly, log it, etc.
                    e.printStackTrace();
                }
            }
            recruiter.setCompany_status(1);

            Role existingRole = roleRepository.findById(Long.valueOf(2))
                    .orElseThrow(() -> new RuntimeException("Role not found"));

            UserRole userRole = new UserRole();
            userRole.setRole(existingRole);


            account.setUserRole(userRole);
            account.setRecruiter(recruiter);
            account.setRole(2L);
            userService.save(account);



        } else if (user.getRole() == 3) {
            Account account = accountRepository.findById(user.getId().longValue());
            account.setUsername(user.getUsername());
            account.setPassword(user.getPassword());
            account.setEmail(user.getEmail());
            Date dob=new SimpleDateFormat("yyyy-MM-dd").parse(user.getDateOfBirth());
            account.setDateOfBirth(dob);
            account.setFirstName(user.getFirstName());
            account.setMiddleName(user.getMiddleName());
            account.setLastName(user.getLastName());
            account.setAddressId1(user.getAddressId1());
            account.setAddressId2(user.getAddressId2());
            account.setAddressId3(user.getAddressId3());
            account.setAddress(user.getAddress());

//            Account accountSaved = userService.save(account);

            Candidate candidate = account.getCandidate();
            candidate.setBiography(user.getBiography());


            Role existingRole = roleRepository.findById(Long.valueOf(4))
                    .orElseThrow(() -> new RuntimeException("Role not found"));

            UserRole userRole = new UserRole();
            userRole.setRole(existingRole);

            account.setUserRole(userRole);
            account.setCandidate(candidate);
            account.setRole(4L);
            userService.save(account);
        }

        model.addAttribute("error", "Đăng ký thành công!");
        return "home";
    }

}
