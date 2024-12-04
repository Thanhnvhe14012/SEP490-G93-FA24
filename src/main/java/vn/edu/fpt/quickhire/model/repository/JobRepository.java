package vn.edu.fpt.quickhire.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.edu.fpt.quickhire.entity.Job;

import java.util.List;

public interface JobRepository extends JpaRepository<Job, Long> {
    Job save(Job job);
    Job findById(long id);
    List<Job> findAll();
}
