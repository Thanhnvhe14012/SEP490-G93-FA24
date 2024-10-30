package vn.edu.fpt.quickhire.model.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import vn.edu.fpt.quickhire.entity.Candidate;
import vn.edu.fpt.quickhire.entity.CvSection;
import vn.edu.fpt.quickhire.entity.ProfileSection;
import vn.edu.fpt.quickhire.model.CandidateService;
import vn.edu.fpt.quickhire.model.repository.CandidateRepository;
import vn.edu.fpt.quickhire.model.repository.ProfileSectionRepository;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.*;

@Service
public class CandidateServiceImpl implements CandidateService {

    @Autowired
    CandidateRepository candidateRepository;
    @Autowired
    ProfileServiceImpl profileService;

    @Autowired
    ProfileSectionRepository profileSectionRepository;

    @Override
    public Candidate save(Candidate candidate, boolean isUpdateProfile, boolean isUpdateCV, MultipartFile file) {
        if (!Objects.equals(file.getOriginalFilename(), "") && isUpdateProfile)
            candidate.getProfileSections().get(0).setImage(this.saveImage(file));
        if (!Objects.equals(file.getOriginalFilename(), "") && isUpdateCV)
            candidate.getCvSections().get(0).setImage(this.saveImage(file));

        Candidate a = candidateRepository.findById(candidate.getId()).orElseThrow();
        if(isUpdateProfile){
            List<ProfileSection> profileSections = candidate.getProfileSections();
            for (ProfileSection p: profileSections
            ) {
                if (p.getCandidate()==null){
                    p.setCandidate(a);
                }
            }
            a.setProfileSections(profileSections);
        }
        if(isUpdateCV){
            List<CvSection> cvSections = candidate.getCvSections();
            for (CvSection cv: cvSections
            ) {
                if (cv.getCandidate()==null){
                    cv.setCandidate(a);
                }
            }
            a.setCvSections(cvSections);
        }
        a.setBiography(candidate.getBiography());
        return candidateRepository.save(a);
    }

    @Override
    public void saveProfile(List<ProfileSection> sectionList, Long id) {
        Candidate c = this.findByID(id);
        this.candidateRepository.save(c);
    }


    @Override
    public Candidate findByID(Long id) {
            Optional<Candidate> candidateOpt = candidateRepository.findById(id);

            if (candidateOpt.isPresent()) {
                Candidate candidate = candidateOpt.get();

                if (candidate.getProfileSections() == null || candidate.getProfileSections().isEmpty()) {
                    List<ProfileSection> profileSections = new ArrayList<>();
                    profileSections.add(new ProfileSection("education"));
                    profileSections.add(new ProfileSection("experience"));
                    profileSections.add(new ProfileSection("skill"));
                    profileSections.add(new ProfileSection("project"));
                    profileSections.add(new ProfileSection("cert"));
                    profileSections.add(new ProfileSection("trophy"));

                    for (ProfileSection section : profileSections) {
                        section.setCandidate(candidate);
                    }

                    candidate.setProfileSections(profileSections);
                    candidateRepository.save(candidate);
                }
                if (candidate.getCvSections() == null || candidate.getCvSections().isEmpty()){
                    List<CvSection> cvSections = new ArrayList<>();
                    cvSections.add(new CvSection("introduction",1));
                    cvSections.add(new CvSection("experience",1));
                    cvSections.add(new CvSection("education",1));
                    cvSections.add(new CvSection("project",1));
                    cvSections.add(new CvSection("cert",1));
                    cvSections.add(new CvSection("hobby",1));
                    cvSections.add(new CvSection("introducer",1));
                    cvSections.add(new CvSection("trophy",1));
                    for (CvSection section : cvSections) {
                        section.setCandidate(candidate);
                    }
                    candidate.setCvSections(cvSections);
                    candidateRepository.save(candidate);
                }

                return candidate;
            }

            return null;
        }

    @Override
    public List<ProfileSection> getAllProfileSectionOfCandidate(Long id) {
        return Objects.requireNonNull(this.candidateRepository.findById(id).orElse(null)).getProfileSections();
    }

    @Override
    public void deleteProfileSection(Long id) {
        profileSectionRepository.deleteById(id);
    }

    private String saveImage(MultipartFile imageFile) {
        String fileName = UUID.randomUUID().toString() + "_" + imageFile.getOriginalFilename();
        String uploadDir = "src/main/resources/static/upload/";
        String uploadServerDir= "target/classes/static/upload/";

        try {
            Path filePath = Paths.get(uploadDir + fileName);
            Path filePath2 = Paths.get(uploadServerDir + fileName);
            Files.copy(imageFile.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
            Files.copy(imageFile.getInputStream(), filePath2, StandardCopyOption.REPLACE_EXISTING);
            return "/upload/" + fileName; // Return the URL where the image is saved
        } catch (IOException e) {
            // Handle the exception
            return null;
        }
    }
}
