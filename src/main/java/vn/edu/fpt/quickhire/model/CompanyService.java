package vn.edu.fpt.quickhire.model;

import vn.edu.fpt.quickhire.entity.Company;
import vn.edu.fpt.quickhire.entity.Recruiter;

import java.util.List;

public interface CompanyService {
    Company findById(long id);
    List<Company> ListCompany();
    void deleteById(long id);
    void createCompany(Company company);
    void updateCompany(Company company);
    Company save(Company company);

}
