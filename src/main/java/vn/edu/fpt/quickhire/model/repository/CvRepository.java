package vn.edu.fpt.quickhire.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import vn.edu.fpt.quickhire.entity.CvSection;

import java.util.List;
import java.util.Optional;

public interface CvRepository extends JpaRepository<CvSection,Long> {
    Optional<List<CvSection>> findAllByCandidate_IdAndCandidateCvNo(Long cid, int no);
    Optional<CvSection> findByCandidateCvNoAndCandidate_Id(int no, Long cid);

    @Query("SELECT DISTINCT c.candidateCvNo FROM CvSection c WHERE c.candidate.id = :candidateId")
    List<Integer> countDistinctCvNoByCandidateId(@Param("candidateId") Long candidateId);
}
