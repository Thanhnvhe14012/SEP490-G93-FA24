package vn.edu.fpt.quickhire.model;

import vn.edu.fpt.quickhire.entity.Job;

import java.util.List;

public interface JobService {
   Job createJob(Job jobDTO, Long accountId);
   Job getJobById(Long id);
   Job updateJob(Long id,Job job);
   List<Job> getAllJobs();
   Job deleteById(Long id);
}
