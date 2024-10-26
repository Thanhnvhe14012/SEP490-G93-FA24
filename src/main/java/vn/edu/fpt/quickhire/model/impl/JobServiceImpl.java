package vn.edu.fpt.quickhire.model.impl;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.edu.fpt.quickhire.entity.Job;
import vn.edu.fpt.quickhire.model.JobService;
import vn.edu.fpt.quickhire.model.repository.JobRepository;

import java.util.List;
import java.util.Optional;

@Service

public class JobServiceImpl implements JobService {
    @Autowired
    JobRepository jobRepository;

    @Transactional
    @Override
    public void CreateJob(Job job) {
        jobRepository.save(job);
    }

    @Override
    public Job GetJobById(Long id) {
        Optional<Job> job = jobRepository.findById(id);
        if(job.isPresent()) {
            return job.get();
        }
        else return null;
    }

    @Override
    public void UpdateJob(Long id, Job job) {
        Optional<Job> jobOptional = jobRepository.findById(id);
        if(jobOptional.isPresent()) {
            job.setId(id);
            jobRepository.save(job);
        }
        else throw new IllegalArgumentException("Job not found");
    }

    @Override
    public List<Job> GetAllJobs() {
        return jobRepository.findAll();
    }

    @Override
    public void DeleteById(Long id) {
        jobRepository.deleteById(id);
    }
}
