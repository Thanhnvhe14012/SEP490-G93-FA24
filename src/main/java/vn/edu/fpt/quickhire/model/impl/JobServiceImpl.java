package vn.edu.fpt.quickhire.model.impl;

import jakarta.security.auth.message.config.AuthConfig;
import jakarta.transaction.Transactional;
import org.apache.http.auth.AUTH;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.edu.fpt.quickhire.entity.DTO.JobDTO;
import vn.edu.fpt.quickhire.entity.Job;
import vn.edu.fpt.quickhire.model.AddressService;
import vn.edu.fpt.quickhire.model.JobService;
import vn.edu.fpt.quickhire.model.repository.CompanyRepository;
import vn.edu.fpt.quickhire.model.repository.IndustryRepository;
import vn.edu.fpt.quickhire.model.repository.JobRepository;
import java.util.*;
import java.util.stream.Collectors;

@Service

public class JobServiceImpl implements JobService {
    @Autowired
    JobRepository jobRepository;
    @Autowired
    CompanyRepository companyRepository;
    @Autowired
    AddressService addressService;
    @Autowired
    IndustryRepository industryRepository;


    @Transactional
    @Override
    public void CreateJob(Job job) {
//        job.setRecruiter_id(4l);
        job.setCompany(companyRepository.findById(job.getCompany_id()).get());
        jobRepository.save(job);
    }

    @Override
    public Job GetJobById(Long id) {
        Optional<Job> job = jobRepository.findById(id);
        if(job.isPresent()) {
            return job.get();
        }
        else return null;
    }

    @Override
    public void UpdateJob(Long id, Job job) {
        Optional<Job> jobOptional = jobRepository.findById(id);
        if(jobOptional.isPresent()) {
            job.setId(id);
            jobRepository.save(job);
        }
        else throw new IllegalArgumentException("Job not found");
    }

    @Override
    public List<Job> GetAllJobs() {
        return jobRepository.findAll();
    }

    @Override
    public List<JobDTO> ShowAllJobs() {
        List<Job> jobs = this.jobRepository.findAll();
        return jobs.stream().map(x -> new JobDTO(
               x.getId(),
                x.getName(),
                x.getDescription(),
                x.getSalary_min(),
                x.getSalary_max(),
                addressService.getAddressFromCode(x.getAddressId1(),x.getAddressId2(),x.getAddressId3()),
                industryRepository.findById(x.getIndustry_id()).orElseThrow().getName()
        )).collect(Collectors.toList());
    }

    @Override
    public void DeleteById(Long id) {
        jobRepository.deleteById(id);
    }
}
