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
    List<Job> findAllByRecruiterId(Long recruiterId);
    List<Job> findAllByCompanyId(Long companyId);

    @Query("SELECT j FROM Job j LEFT JOIN FETCH j.industry LEFT JOIN FETCH j.recruiter")
    List<Job> findAllWithIndustryAndRecruiter();

    @Query("SELECT j FROM Job j WHERE \n" +
            "    (:name IS NULL OR :name = '' OR j.name LIKE %:name%) AND \n" +
            "    (:address IS NULL OR :address = '' OR j.recruiter.account.province.code = :address) AND \n" +
            "    (:industryId IS NULL OR j.industry.id = :industryId) AND \n" +
            "    (:salaryMin IS NULL OR j.salary_min >= :salaryMin) AND \n" +
            "    (:salaryMax IS NULL OR j.salary_max <= :salaryMax) AND \n" +
            "    (:level IS NULL OR j.level = :level) AND \n" +
            "    (:type IS NULL OR j.type = :type)")
    List<Job> searchJobs(String name, String address, Long industryId, Integer salaryMin, Integer salaryMax, Integer level, Integer type);
}
