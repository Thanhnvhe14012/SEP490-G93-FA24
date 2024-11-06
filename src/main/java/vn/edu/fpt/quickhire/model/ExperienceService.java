package vn.edu.fpt.quickhire.model;

import vn.edu.fpt.quickhire.entity.Experience;

import java.util.List;

public interface ExperienceService {
    List<Experience> getAllExperiencesById(Long id);
    Experience getExperienceById(Long id);
}
