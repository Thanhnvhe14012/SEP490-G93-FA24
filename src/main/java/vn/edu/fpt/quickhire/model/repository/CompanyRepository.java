package vn.edu.fpt.quickhire.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.edu.fpt.quickhire.entity.Account;
import vn.edu.fpt.quickhire.entity.Company;

import java.util.List;
import java.util.Optional;


public interface CompanyRepository extends JpaRepository<
        Company, Long> {

    Optional<Company> findById(long id);
    Company findByCompanyCode(String code);
    Company findByCompanyName(String companyName);
    List<Company> findAll();
    void deleteById(long id);
    Company save(Company company);
}
