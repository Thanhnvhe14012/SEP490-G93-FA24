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
import vn.edu.fpt.quickhire.model.repository.AccountRepository;
import vn.edu.fpt.quickhire.model.repository.IndustryRepository;
import vn.edu.fpt.quickhire.model.repository.ProvinceRepository;
import vn.edu.fpt.quickhire.model.repository.RecruiterRepository;

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
    private ProvinceRepository provinceRepository;

    @Autowired
    private IndustryRepository industryRepository;

    @Autowired
    private FileUploadService fileUploadService;
    @Autowired
    private AccountRepository accountRepository;
    @Autowired
    private RecruiterRepository recruiterRepository;

    @GetMapping("/createStaff")
    public String showCreateStaff(@SessionAttribute(name = "user", required = false) UserDTO userDTO, Model model) {
        if (userDTO != null && userDTO.getRole() == 2) {
            List<Industry> industryList = industryRepository.findAll();
            model.addAttribute("industryList", industryList);
            model.addAttribute("staff", new StaffDTO());
            List<Province> provinces = provinceRepository.findAll();
            model.addAttribute("provinces", provinces);
            return "recruiter/addstaff";
        } else return "redirect:/";

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
            account.setRole(3L);
            account.setStatus(1);

            Date dob = new SimpleDateFormat("yyyy-MM-dd").parse(staff.getDateOfBirth());
            account.setDateOfBirth(dob);
            account.setFirstName(staff.getFirstName());
            account.setMiddleName(staff.getMiddleName());
            account.setLastName(staff.getLastName());

//            Account accountSaved = userService.save(account);

            Staff newStaff = new Staff();
            newStaff.setRecruiter(recruiterRepository.findByAccount_Id(userDTO.getId()));
            newStaff.setAccount(account);
            newStaff.setIndustryId(staff.getIndustryId());

            account.setStaff(newStaff);
            userService.save(account);
            return "redirect:/";
        }
        return "redirect:/";

    }



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
    public String updateAccount(@ModelAttribute("user") UserDTO user, Model model, @RequestParam("image") MultipartFile image
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
//            if (image!= null && !image .isEmpty()) {
//                try {
//                    String imageUrl = fileUploadService.UploadFile(image);
//                    recruiter.setCompany_logo(imageUrl);
//                } catch (IOException e) {
//                    // Handle the exception properly, log it, etc.
//                    e.printStackTrace();
//                }
//            }
            recruiter.setCompany_status(1);

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


            account.setCandidate(candidate);
            account.setRole(4L);
            userService.save(account);
        }

        model.addAttribute("error", "Đăng ký thành công!");
        return "home";
    }

}
