package vn.edu.fpt.quickhire.model.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import vn.edu.fpt.quickhire.entity.Candidate;
import vn.edu.fpt.quickhire.entity.ProfileSection;
import vn.edu.fpt.quickhire.model.ProfileService;
import vn.edu.fpt.quickhire.model.repository.CandidateRepository;
import vn.edu.fpt.quickhire.model.repository.ProfileRepository;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class ProfileServiceImpl implements ProfileService {
    @Autowired
    ProfileRepository profileRepository;
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
