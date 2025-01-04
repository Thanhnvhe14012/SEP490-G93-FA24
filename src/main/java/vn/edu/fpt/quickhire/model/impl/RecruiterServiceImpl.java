package vn.edu.fpt.quickhire.model.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.edu.fpt.quickhire.entity.Recruiter;
import vn.edu.fpt.quickhire.model.RecruiterService;
import vn.edu.fpt.quickhire.model.repository.RecruiterRepository;

import java.util.List;
import java.util.Optional;

@Service
public class RecruiterServiceImpl implements RecruiterService {

    @Autowired
    RecruiterRepository recruiterRepository;

    @Override
    public Optional<Recruiter> findById(long id) {
        return recruiterRepository.findById(id);
    }

    @Override
    public Recruiter findByCode(String code) {
        return recruiterRepository.findByCompanyCode(code);
    }

    @Override
    public Recruiter findByName(String name) {
        return recruiterRepository.findByCompanyName(name);
    }

    @Override
    public List<Recruiter> findAll() {
        return recruiterRepository.findAll();
    }

    @Override
    public void deleteById(long id) {
   recruiterRepository.deleteById(id);
    }

    @Override
    public Recruiter save(Recruiter recruiter) {
        return recruiterRepository.save(recruiter);
    }

    @Override
    public Recruiter findByAccount_Id(Long accountId) {
        return recruiterRepository.findByAccount_Id(accountId);
    }

//    @Override
//    public List<Recruiter> findByManagerIdAndCompanyCode(Long managerId, String companyCode) {
//        return recruiterRepository.findByManagerIdAndCompanyCode(managerId, companyCode);
//    }

}
