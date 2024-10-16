package vn.edu.fpt.quickhire.model;

import vn.edu.fpt.quickhire.entity.Candidate;
import vn.edu.fpt.quickhire.entity.CvSection;

import java.util.List;

public interface CvService {
    List<CvSection> findAllCvSectionByCandidateCVNo(int no ,Long id);

    CvSection findCvByCvNoAndCandidateId(int no, Long id);

    List<Integer> countCVofCandidate(Long id);
}
