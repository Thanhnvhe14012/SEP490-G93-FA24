package vn.edu.fpt.quickhire.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.edu.fpt.quickhire.entity.Account;
import vn.edu.fpt.quickhire.entity.Company;

import java.util.List;


public interface CompanyRepository extends JpaRepository<
        Company, Long> {

    Company findById(long id);
    Company findByCompanyName(String companyName);
    List<Company> findAll();
    void deleteById(long id);
    Company save(Company company);
}
