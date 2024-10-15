package vn.edu.fpt.quickhire.model.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import vn.edu.fpt.quickhire.entity.Candidate;
import vn.edu.fpt.quickhire.entity.CvSection;
import vn.edu.fpt.quickhire.model.CvService;
import vn.edu.fpt.quickhire.model.repository.CvRepository;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.UUID;

@Service
public class CvServiceImpl implements CvService {
    @Autowired
    CvRepository cvRepository;
    @Override
    public List<CvSection> findAllCvSectionByCandidateCVNo(int no,Long id) {
        return cvRepository.findAllByCandidate_IdAndCandidateCvNo(id,no).orElseThrow();
    }

    @Override
    public CvSection findCvByCvNoAndCandidateId(int no, Long id) {
        return cvRepository.findByCandidateCvNoAndCandidate_Id(no, id).orElseThrow();
    }

    @Override
    public List<Integer> countCVofCandidate(Long id) {
        return cvRepository.countDistinctCvNoByCandidateId(id);
    }

}
