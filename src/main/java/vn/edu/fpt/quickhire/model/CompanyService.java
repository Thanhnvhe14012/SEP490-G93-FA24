package vn.edu.fpt.quickhire.model;

import vn.edu.fpt.quickhire.entity.Company;
import vn.edu.fpt.quickhire.entity.Recruiter;

import java.util.List;
import java.util.Optional;

public interface CompanyService {
    Optional<Company> findById(long id);
    Company findByCompanyCode(String code);
    Company findByName(String companyName);
    List<Company> findAll();
    void deleteById(long id);
    Company save(Company company);

}
