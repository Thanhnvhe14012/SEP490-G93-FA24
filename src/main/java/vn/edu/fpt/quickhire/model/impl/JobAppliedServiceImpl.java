package vn.edu.fpt.quickhire.model.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.edu.fpt.quickhire.entity.JobApplied;
import vn.edu.fpt.quickhire.model.JobAppliedService;
import vn.edu.fpt.quickhire.model.repository.JobAppliedRepository;

import java.util.List;
import java.util.Optional;

@Service
public class JobAppliedServiceImpl implements JobAppliedService {

    @Autowired
    JobAppliedRepository jobAppliedRepository;

    @Override
    public Optional<JobApplied> findById(Long id) {
        return jobAppliedRepository.findById(id);
    }

    @Override
    public List<JobApplied> getJobAppliedByUserId(Long userId) {
        return jobAppliedRepository.findAllByUserID(userId);
    }

    @Override
    public List<JobApplied> getJobAppliedByJobId(Long jobID) {
        return jobAppliedRepository.findAllByJobID(jobID);
    }

    @Override
    public JobApplied getJobAppliedByJobIdAndUserId(Long jobID, Long userID) {
        return jobAppliedRepository.findByJobIDAndUserID(jobID, jobID);
    }

    @Override
    public JobApplied save(JobApplied jobApplied) {
        return jobAppliedRepository.save(jobApplied);
    }

    @Override
    public boolean unapplyForJob(Long jobID, Long userID) {
        JobApplied jobApplied = jobAppliedRepository.findByJobIDAndUserID(jobID, userID);
        if (jobApplied != null) {
            jobAppliedRepository.delete(jobApplied);
            return true;
        }
        return false;
    }

}
