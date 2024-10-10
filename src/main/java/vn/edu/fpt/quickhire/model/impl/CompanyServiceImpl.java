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
    public Company findByName(String name) {
        return companyRepository.findByName(name);
    }

    @Override
    public List<Company> ListCompany() {
        return companyRepository.ListCompany();
    }

    @Override
    public void deleteById(long id) {
        companyRepository.deleteById(id);
    }

    @Override
    public void createCompany(Company company) {
        companyRepository.createCompany(company);
    }

    @Override
    public void updateCompany(Company company) {
        companyRepository.updateCompany(company);
    }

    @Override
    public Company save(Company company) {
        return companyRepository.save(company);
    }
}
