package vn.edu.fpt.quickhire.model.impl;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.edu.fpt.quickhire.entity.Job;
import vn.edu.fpt.quickhire.entity.Recruiter;
import vn.edu.fpt.quickhire.model.JobService;
import vn.edu.fpt.quickhire.model.repository.JobRepository;
import vn.edu.fpt.quickhire.model.repository.RecruiterRepository;

import java.util.*;
@Service

public class JobServiceImpl implements JobService {
    @Autowired
    JobRepository jobRepository;
    RecruiterRepository recruiterRepository;

    @Override
    public Job createJob(Job jobDTO, Long accountId) {
        Recruiter recruiter = recruiterRepository.findByAccount_Id(accountId);

        if (recruiter == null) {
            throw new RuntimeException("Recruiter not found for account ID: " + accountId);
        }

        Job job = new Job();
        job.setName(jobDTO.getName());
        job.setDescription(jobDTO.getDescription());
        job.setBenefits(jobDTO.getBenefits());
        job.setStart(jobDTO.getStart());
        job.setEnd(jobDTO.getEnd());
        job.setStatus(jobDTO.getStatus());
        job.setIndustry_id(jobDTO.getIndustry_id());
        job.setSalary_max(jobDTO.getSalary_max());
        job.setSalary_min(jobDTO.getSalary_min());
        job.setCompany_id(recruiter.getManagerId());
        job.setCompany_description(recruiter.getCompanyDescription());
        job.setRecruiter_id(recruiter.getId());

        return jobRepository.save(job);
    }

    @Override
    public Job getJobById(Long id) {
        return jobRepository.findById(id).orElse(null);
    }

    @Override
    public Job updateJob(Long id, Job job) {
        return null;
    }

    @Override
    public List<Job> getAllJobs() {
        return jobRepository.findAllWithIndustryAndRecruiter();
    }

    @Override
    public Job deleteById(Long id) {
        return null;
    }
    public List<Job> searchJobs(String name, Long industryId, String location) {
        return jobRepository.searchJobs(name, industryId, location);
    }
}
