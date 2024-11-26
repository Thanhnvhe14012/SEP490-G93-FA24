package vn.edu.fpt.quickhire.model;

import vn.edu.fpt.quickhire.entity.Recruiter;
import vn.edu.fpt.quickhire.entity.Report;

import java.util.List;
import java.util.Optional;

public interface ReportService {
    Report findById(long id);
    List<Report> findByCandidate_Id(long id);
    List<Report> findByJob_Id(long id);
    Report save(Report report);
    List<Report> findAll();
}