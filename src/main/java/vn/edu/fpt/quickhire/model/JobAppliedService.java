package vn.edu.fpt.quickhire.model;

import vn.edu.fpt.quickhire.entity.JobApplied;

import java.util.List;
import java.util.Optional;

public interface JobAppliedService {
    Optional<JobApplied> findById(Long id);
    List<JobApplied> getJobAppliedByUserId(Long userId);
    List<JobApplied> getJobAppliedByJobIdAndStatus(Long jobId, int status);
    JobApplied save(JobApplied jobApplied);
    JobApplied getJobAppliedByJobIdAndUserId(Long jobID, Long userID);
    boolean unapplyForJob(Long jobID, Long userID);
}
