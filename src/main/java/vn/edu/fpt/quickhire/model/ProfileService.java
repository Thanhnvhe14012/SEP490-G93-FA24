package vn.edu.fpt.quickhire.model;

import vn.edu.fpt.quickhire.entity.Candidate;
import vn.edu.fpt.quickhire.entity.ProfileSection;

import java.util.List;

public interface ProfileService {
    List<ProfileSection> getAllProfileSection();

    ProfileSection getProfileSectionBySectionAndCandidateID(String section, Long candidateID);

    ProfileSection getProfileSectionByID(Long id);

    void addProfileSectionByCandidateID(ProfileSection profileSection, Long candidateID);

    void updateProfileSectionByCandidateID(ProfileSection profileSection, Long candidateID);
}
