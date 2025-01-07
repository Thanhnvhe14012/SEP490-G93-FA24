package vn.edu.fpt.quickhire.model.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.edu.fpt.quickhire.entity.JobApplied;
import vn.edu.fpt.quickhire.model.JobAppliedService;
import vn.edu.fpt.quickhire.model.repository.JobAppliedRepository;

import java.util.List;

@Service
public class JobAppliedServiceImpl implements JobAppliedService {

    @Autowired
    JobAppliedRepository jobAppliedRepository;

    @Override
    public List<JobApplied> getJobAppliedByUserId(Long userId) {
        return jobAppliedRepository.findAllByUserID(userId);
    }

    @Override
    public List<JobApplied> getJobAppliedByJobId(Long jobId) {
        return jobAppliedRepository.findAllByJobID(jobId);
    }

    @Override
    public JobApplied save(JobApplied jobApplied) {
        return jobAppliedRepository.save(jobApplied);
    }
}
