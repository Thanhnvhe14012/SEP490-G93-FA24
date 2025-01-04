package vn.edu.fpt.quickhire.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import vn.edu.fpt.quickhire.entity.Job;

import java.util.List;

public interface JobRepository extends JpaRepository<Job, Long> {
    Job save(Job job);
    Job findById(long id);
    List<Job> findAll();

    @Query("SELECT j FROM Job j LEFT JOIN FETCH j.industry LEFT JOIN FETCH j.recruiter")
    List<Job> findAllWithIndustryAndRecruiter();

    @Query("SELECT j FROM Job j LEFT JOIN j.industry i LEFT JOIN j.recruiter r WHERE "
            + "(:name IS NULL OR j.name LIKE %:name%) AND "
            + "(:industryId IS NULL OR i.id = :industryId) AND "
            + "(:location IS NULL OR r.company_location LIKE %:location%)")
    List<Job> searchJobs(@Param("name") String name,
                         @Param("industryId") Long industryId,
                         @Param("location") String location);

}
