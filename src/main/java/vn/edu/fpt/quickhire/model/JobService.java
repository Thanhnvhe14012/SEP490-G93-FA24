package vn.edu.fpt.quickhire.model;

import vn.edu.fpt.quickhire.entity.Job;

import java.util.List;

public interface JobService {
   void CreateJob(Job job);
   Job GetJobById(Long id);
   void UpdateJob(Long id,Job job);
   List<Job> GetAllJobs();
   void DeleteById(Long id);
}
