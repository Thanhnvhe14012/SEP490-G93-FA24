package vn.edu.fpt.quickhire.model.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.edu.fpt.quickhire.entity.Candidate;
import vn.edu.fpt.quickhire.entity.Company;
import vn.edu.fpt.quickhire.model.CandidateService;
import vn.edu.fpt.quickhire.model.CompanyService;
import vn.edu.fpt.quickhire.model.repository.CandidateRepository;
import vn.edu.fpt.quickhire.model.repository.CompanyRepository;

import java.util.List;

@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    CompanyRepository companyRepository;

    @Override
    public Company findById(long id) {
        return companyRepository.findById(id);
    }

    @Override
    public Company findByName(String companyName) {
        return companyRepository.findByCompanyName(companyName);
    }

    @Override
    public List<Company> findAll() {
        return companyRepository.findAll();
    }

    @Override
    public void deleteById(long id) {
        companyRepository.deleteById(id);
    }



    @Override
    public Company save(Company company) {
        return companyRepository.save(company);
    }
}
