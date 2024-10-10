package vn.edu.fpt.quickhire.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import vn.edu.fpt.quickhire.entity.Company;
import vn.edu.fpt.quickhire.model.impl.AccountServiceImpl;
import vn.edu.fpt.quickhire.model.impl.CompanyServiceImpl;

import java.util.List;

@Controller
@RequestMapping(path = "Company")
public class CompanyController {

    @Autowired
    private CompanyServiceImpl companyService;


    @GetMapping("/adminListCompany")
    public String list(Model model) {
        List<Company> listC = companyService.ListCompany();
        model.addAttribute("listC", listC);
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
        companyService.createCompany(company);
        model.addAttribute("msg", "Company created");
        return "company/adminListCompany";
    }

    @PutMapping("/update")
    public String update(@RequestBody Company company, Model model) {
        Company c = companyService.findByName(company.getCompanyName());
        if (c != null) {
            model.addAttribute("msg", "Company code not unique");
            return "company/adminListCompany";
        }
        companyService.updateCompany(company);
        model.addAttribute("msg", "Company updated");
        return "company/adminListCompany";
    }

}
