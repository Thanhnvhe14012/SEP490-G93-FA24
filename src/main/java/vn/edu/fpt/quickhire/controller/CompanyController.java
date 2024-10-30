package vn.edu.fpt.quickhire.controller;

import lombok.RequiredArgsConstructor;
import org.apache.tomcat.util.http.fileupload.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import vn.edu.fpt.quickhire.entity.Company;
import vn.edu.fpt.quickhire.model.FileUploadService;
import vn.edu.fpt.quickhire.model.impl.CompanyServiceImpl;
import vn.edu.fpt.quickhire.model.repository.CompanyRepository;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
@RequestMapping(path = "Company")
public class CompanyController {

    @Autowired
    private CompanyServiceImpl companyService;
    @Autowired
    private CompanyRepository companyRepository;
    @Autowired
    private FileUploadService fileUploadService;

    @GetMapping("/listCompany")
    public String list(Model model) {
        List<Company> listC = companyService.findAll();
        model.addAttribute("listC", listC);
        model.addAttribute("listNull", "listNullText");
        return "company/listCompany";
    }

    @GetMapping("/{id}")
    public String findById(@PathVariable long id, Model model) {
        Optional<Company> c = companyService.findById(id);
        if (!c.isPresent()) {
            model.addAttribute("msg", "Company not found");
            return "company/listCompany";
        }
        Company company = c.get();
        model.addAttribute("company", company);
        return "company/detailCompany";
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<String> delete(@PathVariable long id) {
        try {
            companyService.deleteById(id);
            return ResponseEntity.ok("Company deleted successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to delete the company");
        }
    }

    @GetMapping("/createCompany")
    public String createCompanyPage(Model model) {
        model.addAttribute("company", new Company());
        return "company/createCompany";
    }


    @PostMapping("/create")
    public String create(
            @ModelAttribute Company company,
            @RequestParam("image") MultipartFile image,
            Model model) {

        Company c = companyService.findByCompanyCode(company.getCompanyCode());
        if (c != null) {
            model.addAttribute("message", "Failed to add company. Company Code duplicate.");
            model.addAttribute("messageType", "error");
            return "company/createCompany";
        }
        if (image != null && !image.isEmpty()) {
            try {
                String imageUrl = fileUploadService.UploadFile(image);
                company.setLogo(imageUrl);
            } catch (IOException e) {
                // Handle the exception properly, log it, etc.
                e.printStackTrace();
            }
        }
        try {
            companyService.save(company);
            model.addAttribute("message", "Company added successfully!");
            model.addAttribute("messageType", "success");
//            return "company/listCompany";
            return "redirect:/Company/listCompany" ;
        } catch (Exception e) {
            model.addAttribute("message", "Failed to add company. Please try again.");
            model.addAttribute("messageType", "error");
        }
        return "company/createCompany";
    }


    @PostMapping("/update/{id}")
    public String update(@ModelAttribute Company newCompany, @PathVariable Long id, @RequestParam(value = "image", required = false) MultipartFile image) throws IOException {
        Company updatedCompany = companyService.findById(id).map(oldC -> {
            // Update other fields
            oldC.setCompanyName(newCompany.getCompanyName());
            oldC.setLocation(newCompany.getLocation());
            oldC.setNumOfEmps(newCompany.getNumOfEmps());
            oldC.setStatus(newCompany.getStatus());
            oldC.setTypeId(newCompany.getTypeId());
            oldC.setDescription(newCompany.getDescription());
            // If a new image is provided, upload and update the logo
            if (image != null && !image.isEmpty()) {
                try {
                    String imageUrl = fileUploadService.UploadFile(image);
                    oldC.setLogo(imageUrl); // Update logo only if a new image is uploaded
                } catch (IOException e) {
                    // Handle the exception properly, log it, etc.
                    e.printStackTrace();
                }
            }
            return companyService.save(oldC);
        }).orElseGet(() -> {
            // If the company doesn't exist, create a new one
            newCompany.setId(id);
            // If a new image is provided, upload and set the logo
            if (image != null && !image.isEmpty()) {
                try {
                    String imageUrl = fileUploadService.UploadFile(image);
                    newCompany.setLogo(imageUrl); // Set the logo if an image is uploaded
                } catch (IOException e) {
                    // Handle the exception properly, log it, etc.
                    e.printStackTrace();
                }
            }
            return companyService.save(newCompany);
        });
        return "redirect:/Company/" + id;

    }


}
