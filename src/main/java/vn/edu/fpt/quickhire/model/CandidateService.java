package vn.edu.fpt.quickhire.model;

import org.springframework.web.multipart.MultipartFile;
import vn.edu.fpt.quickhire.entity.Candidate;

import java.util.List;

public interface CandidateService {
    Candidate save(Candidate candidate);
}
