package vn.edu.fpt.quickhire.model.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.edu.fpt.quickhire.entity.Report;
import vn.edu.fpt.quickhire.model.ReportService;
import vn.edu.fpt.quickhire.model.repository.ReportRepository;

import java.util.List;

@Service
public class ReportServiceImpl implements ReportService {
    @Autowired
    ReportRepository reportRepository;

    @Override
    public Report findById(long id) {
        return reportRepository.findById(id);
    }

    @Override
    public List<Report> findByCandidate_Id(long id) {
        return reportRepository.findByCandidate_Id(id);
    }

    @Override
    public List<Report> findByJob_Id(long id) {
        return reportRepository.findByJob_Id(id);
    }

    @Override
    public Report save(Report report) {
        return reportRepository.save(report);
    }

    @Override
    public List<Report> findAll() {
        return reportRepository.findAll();
    }
}
