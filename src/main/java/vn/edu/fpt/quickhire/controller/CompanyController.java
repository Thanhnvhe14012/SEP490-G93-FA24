package vn.edu.fpt.quickhire.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import vn.edu.fpt.quickhire.entity.Company;
import vn.edu.fpt.quickhire.model.impl.AccountServiceImpl;
import vn.edu.fpt.quickhire.model.impl.CompanyServiceImpl;
import vn.edu.fpt.quickhire.model.repository.CompanyRepository;

import java.util.List;

@Controller
@RequestMapping(path = "Company")
public class CompanyController {

    @Autowired
    private CompanyServiceImpl companyService;
    @Autowired
    private CompanyRepository companyRepository;


    @GetMapping("/adminListCompany")
    public String list(Model model) {
        List<Company> listC = companyService.findAll();
        model.addAttribute("listC", listC);
        model.addAttribute("listNull", "listNullText");
        return "company/adminListCompany";
    }

    @GetMapping("/{id}")
    public String findById(@PathVariable long id, Model model) {
        Company company = companyService.findById(id);
        if (company == null) {
            model.addAttribute("msg", "Company not found");
            return "company/adminListCompany";
        }
        model.addAttribute("company", company);
        return "company/findById";
    }

    @DeleteMapping("/delete/{id}")
    public String delete(@PathVariable long id) {
        companyService.deleteById(id);
        return "redirect:/adminListCompany";
    }

    @PostMapping("/create")
    public String create(@RequestBody Company company, Model model) {
        Company c = companyService.findByName(company.getCompanyName());
        if (c != null) {
            model.addAttribute("msg", "Company code not unique");
            return "company/adminListCompany";
        }
        companyService.save(company);
        model.addAttribute("msg", "Company created");
        return "company/adminListCompany";
    }

    @PutMapping("/update/{id}")
    public String update(@RequestBody Company newCompany, @PathVariable Long id) {
        Company updatedCompany = companyRepository.findById(id).map(oldC -> {
            oldC.setCompanyName(newCompany.getCompanyName());
            oldC.setLocation(newCompany.getLocation());
            oldC.setNumOfEmps(newCompany.getNumOfEmps());
            oldC.setLogo(newCompany.getLogo());
            oldC.setStatus(newCompany.getStatus());
            oldC.setTypeId(newCompany.getTypeId());
            return companyService.save(oldC);
        }).orElseGet(() -> {
            newCompany.setId(id);
            return companyService.save(newCompany);
        });
        return "company/adminListCompany";
    }

}
