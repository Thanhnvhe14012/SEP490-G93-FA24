package vn.edu.fpt.quickhire.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.edu.fpt.quickhire.entity.JobApplied;

import java.util.List;

public interface JobAppliedRepository extends JpaRepository<JobApplied, Long> {
    //Get list of cvs that a job has
    List<JobApplied> findAllByJobID(long jobID);
    //Get a specific job applied
    JobApplied findByJobIDAndUserID(long jobID, long userID);
    //Get list of job that user has applied
    List<JobApplied> findAllByUserID(long userID);
    JobApplied save(JobApplied jobApplied);
    void delete(JobApplied jobApplied);
}
