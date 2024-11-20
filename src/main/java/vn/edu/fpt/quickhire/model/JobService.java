package vn.edu.fpt.quickhire.model;

import vn.edu.fpt.quickhire.entity.DTO.JobDTO;
import vn.edu.fpt.quickhire.entity.Job;

import java.util.List;

public interface JobService {
   void CreateJob(Job job);
   Job GetJobById(Long id);
   void UpdateJob(Long id,Job job);
   List<Job> GetAllJobs();
   List<JobDTO> ShowAllJobs();
   void DeleteById(Long id);
}
