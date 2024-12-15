package vn.edu.fpt.quickhire.model;

import vn.edu.fpt.quickhire.entity.Recruiter;

import java.util.List;
import java.util.Optional;

public interface RecruiterService {
    Optional<Recruiter> findById(long id);

    Recruiter findByCode(String code);

    Recruiter findByName(String name);

    List<Recruiter> findAll();

    void deleteById(long id);

    Recruiter save(Recruiter recruiter);

    Recruiter findByAccount_Id(Long accountId);

    List<Recruiter> findByManagerIdAndCompanyCode(Long managerId, String companyCode);
}