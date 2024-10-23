package vn.edu.fpt.quickhire.model;

import org.springframework.web.multipart.MultipartFile;
import vn.edu.fpt.quickhire.entity.Candidate;
import vn.edu.fpt.quickhire.entity.ProfileSection;

import java.util.List;

public interface CandidateService {
    Candidate save(Candidate candidate, boolean isUpdateProfile, boolean isUpdateCV, MultipartFile file);

    void saveProfile(List<ProfileSection> sectionList, Long id);

    Candidate findByID(Long id);

    List<ProfileSection> getAllProfileSectionOfCandidate (Long id);

    void deleteProfileSection(Long id);
}
