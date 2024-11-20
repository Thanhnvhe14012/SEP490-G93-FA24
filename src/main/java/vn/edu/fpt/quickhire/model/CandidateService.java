package vn.edu.fpt.quickhire.model;

import org.springframework.web.multipart.MultipartFile;
import vn.edu.fpt.quickhire.entity.Candidate;

import java.util.List;
import java.util.Optional;

public interface CandidateService {
    Candidate save(Candidate candidate);
    Optional<Candidate> findById(long id);
}
