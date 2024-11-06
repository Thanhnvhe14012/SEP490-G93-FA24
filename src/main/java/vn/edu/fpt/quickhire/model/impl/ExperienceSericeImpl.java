package vn.edu.fpt.quickhire.model.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.edu.fpt.quickhire.entity.Experience;
import vn.edu.fpt.quickhire.model.ExperienceService;
import vn.edu.fpt.quickhire.model.repository.ExperienceRepository;

import java.util.List;

@Service
public class ExperienceSericeImpl implements ExperienceService {

    @Autowired
    private ExperienceRepository experienceRepository;

    @Override
    public List<Experience> getAllExperiencesById(Long id) {
        return experienceRepository.findAllByAccountId(id);
    }
}
