package vn.edu.fpt.quickhire.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.edu.fpt.quickhire.entity.Account;
import vn.edu.fpt.quickhire.entity.Recruiter;
import vn.edu.fpt.quickhire.entity.Report;

import java.util.List;
import java.util.Optional;


public interface ReportRepository extends JpaRepository<Report, Long> {

    Report findById(long id);
    List<Report> findByCandidate_Id(long id);
    List<Report> findByJob_Id(long id);
    Report save(Report report);
    List<Report> findAll();

}
