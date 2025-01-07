package vn.edu.fpt.quickhire.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.edu.fpt.quickhire.entity.JobApplied;

import java.util.List;

public interface JobAppliedRepository extends JpaRepository<JobApplied, Long> {
    List<JobApplied> findAllByJobID(long jobID);
    List<JobApplied> findAllByJobIDAndUserID(long jobID, long userID);
}
