package vn.edu.fpt.quickhire.model;

import vn.edu.fpt.quickhire.entity.Job;

import java.util.List;

public interface JobService {
   Job createJob(Job jobDTO, Long accountId);
   Job getJobById(Long id);
   Job updateJob(Long id,Job job);
   List<Job> getAllJobs();

    List<Job> getJobsByCompanyId(Long companyId);

    Job deleteById(Long id);
   List<Job> getLatestJobs(int limit);
   List<Job> getJobsByRecruiterId(Long recruiterId);
   List<Job> searchJobs(String name, String location, Long industryId, Integer salaryMin, Integer salaryMax, Integer level, Integer type);
   int getJobCountByIndustry(Long industryId);
}
