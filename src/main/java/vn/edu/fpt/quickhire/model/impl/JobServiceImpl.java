package vn.edu.fpt.quickhire.model.impl;

import org.springframework.data.domain.Sort;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.edu.fpt.quickhire.entity.Job;
import vn.edu.fpt.quickhire.entity.Staff;
import vn.edu.fpt.quickhire.model.JobService;
import vn.edu.fpt.quickhire.model.repository.JobRepository;
import vn.edu.fpt.quickhire.model.repository.RecruiterRepository;
import vn.edu.fpt.quickhire.model.repository.StaffRepository;

import java.util.*;
@Service

public class JobServiceImpl implements JobService {
    @Autowired
    JobRepository jobRepository;
    @Autowired
    RecruiterRepository recruiterRepository;

    @Autowired
    StaffRepository staffRepository;

    @Override
    public Job createJob(Job jobDTO, Long accountId) {
        Staff staff = staffRepository.findByAccount_Id(accountId);

        if (staff == null) {
            throw new RuntimeException("Staff not found for account ID: " + accountId);
        }

        Job job = getJob(jobDTO, staff);

        return jobRepository.save(job);
    }

    private static Job getJob(Job jobDTO, Staff staff) {
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
        job.setLevel(jobDTO.getLevel());
        job.setType(jobDTO.getType());
        job.setCompany_id(staff.getRecruiter().getAccount().getId());
        job.setCompany_description(staff.getRecruiter().getCompanyDescription());
        job.setRecruiter_id(staff.getAccount().getId());
        return job;
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
    public List<Job> getJobsByRecruiterId(Long recruiter_id) {
        System.out.println(recruiter_id);
        List<Job> jobs = jobRepository.findByRecruiter_id(recruiter_id);
        System.out.println("Jobs retrieved from repository: " + jobs); // Log the results// Log the results
        return jobs;
    }

    @Override
    public Job deleteById(Long id) {
        return null;
    }

    public List<Job> searchJobs(String name, String address, Long industryId, Integer salaryMin, Integer salaryMax, Integer level, Integer type, Sort sort) {
        return jobRepository.searchJobs(name, address, industryId, salaryMin, salaryMax, level, type);
    }
}
