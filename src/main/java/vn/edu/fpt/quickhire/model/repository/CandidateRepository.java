package vn.edu.fpt.quickhire.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.edu.fpt.quickhire.entity.Candidate;

public interface CandidateRepository extends JpaRepository<Candidate, Long> {

}
