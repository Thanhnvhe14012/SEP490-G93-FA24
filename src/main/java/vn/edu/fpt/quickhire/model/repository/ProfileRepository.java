package vn.edu.fpt.quickhire.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.edu.fpt.quickhire.entity.Candidate;
import vn.edu.fpt.quickhire.entity.ProfileSection;

import java.util.List;
import java.util.Optional;

public interface ProfileRepository extends JpaRepository<ProfileSection, Long> {
    Optional<ProfileSection> findBySectionAndCandidate(String section, Candidate candidate);
    Optional<List<ProfileSection>> findAllByCandidate(Candidate candidate);
}
