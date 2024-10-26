package vn.edu.fpt.quickhire.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import vn.edu.fpt.quickhire.entity.Job;

import java.util.List;
import java.util.Optional;

public interface JobRepository extends JpaRepository<Job, Long> {
   @Query("select x from Job x where  x.id = :id")
    Optional<Job> findById(Long id);

    @Query("select x from Job x")
    List<Job> findAll();
}
