package vn.edu.fpt.quickhire.model;

import vn.edu.fpt.quickhire.entity.Company;
import vn.edu.fpt.quickhire.entity.Recruiter;

import java.util.List;

public interface CompanyService {
    Company findById(long id);
    Company findByName(String companyName);
    List<Company> findAll();
    void deleteById(long id);
    Company save(Company company);

}
