package vn.edu.fpt.quickhire.model.impl;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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
    private JobRepository jobRepository;

    @Autowired
    private StaffRepository staffRepository;

    @Override
    public Job createJob(Job jobDTO, Long accountId) {
        Staff staff = staffRepository.findByAccount_Id(accountId);

        if (staff == null) {
            throw new RuntimeException("Staff not found for account ID: " + accountId);
        }

        validateJobInput(jobDTO);

        Job job = getJob(jobDTO, staff);

        return jobRepository.save(job);
    }

    private void validateJobInput(Job jobDTO) {
        if (jobDTO.getName() == null || jobDTO.getName().trim().isEmpty()) {
            throw new IllegalArgumentException("Tên công việc không được để trống");
        }
        if (jobDTO.getDescription() == null || jobDTO.getDescription().trim().isEmpty()) {
            throw new IllegalArgumentException("Mô tả công việc không được để trống");
        }
        if (jobDTO.getType() == null) {
            throw new IllegalArgumentException("Loại công việc không được để trống");
        }
        if (jobDTO.getLevel() == null) {
            throw new IllegalArgumentException("Cấp bậc không được để trống");
        }
        if (jobDTO.getSalary_min() <= 0 || jobDTO.getSalary_max() <= 0) {
            throw new IllegalArgumentException("Lương phải là một con số dương");
        }
        if (jobDTO.getSalary_max() < jobDTO.getSalary_min()) {
            throw new IllegalArgumentException("Lương tối đa phải lớn hơn lương tối thiểu");
        }
        if (jobDTO.getBenefits() == null || jobDTO.getBenefits().trim().isEmpty()) {
            throw new IllegalArgumentException("Quyền lợi không được để trống");
        }
        if (jobDTO.getStart() == null) {
            throw new IllegalArgumentException("Ngày bắt đầu không được để trống");
        }
        if (jobDTO.getEnd() == null) {
            throw new IllegalArgumentException("Ngày kết thúc không được để trống");
        }
        if (jobDTO.getEnd().before(jobDTO.getStart())) {
            throw new IllegalArgumentException("Ngày bắt đầu phải trước ngày kết thúc");
        }
    }

    private static Job getJob(Job jobDTO, Staff staff) {
        Job job = new Job();
        job.setName(jobDTO.getName());
        job.setDescription(jobDTO.getDescription());
        job.setBenefits(jobDTO.getBenefits());
        job.setStart(jobDTO.getStart());
        job.setEnd(jobDTO.getEnd());
        job.setStatus(jobDTO.getStatus());
        job.setIndustry_id(staff.getIndustryId());
        job.setSalary_max(jobDTO.getSalary_max());
        job.setSalary_min(jobDTO.getSalary_min());
        job.setLevel(jobDTO.getLevel());
        job.setType(jobDTO.getType());
        job.setCompanyId(staff.getRecruiter().getAccount().getId());
        job.setCompany_description(staff.getRecruiter().getCompanyDescription());
        job.setRecruiterId(staff.getAccount().getId());
        return job;
    }

    @Override
    public Job getJobById(Long id) {
        return jobRepository.findById(id).orElse(null);
    }

    @Override
    public Job updateJob(Long id, Job jobDTO) {
        Optional<Job> job = jobRepository.findById(id);
        jobDTO.setStart(job.get().getStart());
        jobDTO.setEnd(job.get().getEnd());
        validateJobInput(jobDTO);
        job.get().setName(jobDTO.getName());
        job.get().setDescription(jobDTO.getDescription());
        job.get().setStatus(jobDTO.getStatus());
        job.get().setBenefits(jobDTO.getBenefits());
        job.get().setSalary_min(jobDTO.getSalary_min());
        job.get().setSalary_max(jobDTO.getSalary_max());
        job.get().setLevel(jobDTO.getLevel());
        job.get().setType(jobDTO.getType());
        jobRepository.save(job.orElse(null));
        return job.orElse(null);
    }

    @Override
    public List<Job> getAllJobs() {
        return jobRepository.findAllWithIndustryAndRecruiter();
    }

    @Override
    public List<Job> getLatestJobs(int limit) {
        Pageable pageable = PageRequest.of(0, limit);
        return jobRepository.findTopJobs(pageable);
    }

    @Override
    public List<Job> getJobsByRecruiterId(Long recruiterId) {
        List<Job> jobs = jobRepository.findAllByRecruiterId(recruiterId);
        return jobs;
    }

    @Override
    public List<Job> getJobsByCompanyId(Long companyId) {
        List<Job> jobs = jobRepository.findAllByCompanyId(companyId);
        return jobs;
    }

    @Override
    public Job deleteById(Long id) {
        return null;
    }

    public List<Job> searchJobs(String name, String address, Long industryId, Integer salaryMin, Integer salaryMax, Integer level, Integer type) {
        return jobRepository.searchJobs(name, address, industryId, salaryMin, salaryMax, level, type);
    }

    public int getJobCountByIndustry(Long industryId) {
        return jobRepository.countJobsByIndustryId(industryId);
    }
}
