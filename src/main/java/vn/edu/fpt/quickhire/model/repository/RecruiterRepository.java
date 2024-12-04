package vn.edu.fpt.quickhire.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.edu.fpt.quickhire.entity.Recruiter;

import java.util.List;

public interface RecruiterRepository extends JpaRepository<Recruiter, Long> {
    Recruiter save(Recruiter recruiter);
    Recruiter findByCompanyCode(String code);
    Recruiter findByCompanyName(String name);
    List<Recruiter> findAll();
    void deleteById(long id);
    Recruiter findByAccount_Id(Long accountId);
    List<Recruiter> findByManagerIdAndCompanyCode(Long managerId, String companyCode);
}
