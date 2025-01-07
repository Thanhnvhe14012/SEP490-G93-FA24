package vn.edu.fpt.quickhire.model;

import vn.edu.fpt.quickhire.entity.JobApplied;

import java.util.List;

public interface JobAppliedService {
    List<JobApplied> getJobAppliedByUserId(Long userId);
    List<JobApplied> getJobAppliedByJobId(Long jobId);
    JobApplied save(JobApplied jobApplied);
}
