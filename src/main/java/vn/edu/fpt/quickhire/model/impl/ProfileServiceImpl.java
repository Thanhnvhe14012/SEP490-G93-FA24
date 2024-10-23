package vn.edu.fpt.quickhire.model.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.edu.fpt.quickhire.entity.ProfileSection;
import vn.edu.fpt.quickhire.model.ProfileService;
import vn.edu.fpt.quickhire.model.repository.CandidateRepository;
import vn.edu.fpt.quickhire.model.repository.ProfileSectionRepository;

import java.util.List;

@Service
public class ProfileServiceImpl implements ProfileService {
    @Autowired
    ProfileSectionRepository profileRepository;
    @Autowired
    CandidateRepository candidateRepository;
    @Override
    public List<ProfileSection> getAllProfileSection() {
        return null;
    }

    @Override
    public ProfileSection getProfileSectionBySectionAndCandidateID(String section, Long candidateID) {
        return null;
    }

    @Override
    public ProfileSection getProfileSectionByID(Long id) {
        return null;
    }

    @Override
    public void addProfileSectionByCandidateID(ProfileSection profileSection, Long candidateID) {
        profileSection.setCandidate(this.candidateRepository.findById(candidateID).orElseThrow());
        this.profileRepository.save(profileSection);
    }

    @Override
    public void updateProfileSectionByCandidateID(ProfileSection profileSection, Long candidateID) {

    }
}
