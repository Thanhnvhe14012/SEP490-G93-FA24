package vn.edu.fpt.quickhire.model.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.edu.fpt.quickhire.entity.Industry;
import vn.edu.fpt.quickhire.model.IndustryService;
import vn.edu.fpt.quickhire.model.repository.IndustryRepository;

import java.util.List;

@Service
public class IndustryServiceImpl implements IndustryService {
    @Autowired
    private IndustryRepository industryRepository;

    @Override
    public List<Industry> getAllIndustries() {
        return industryRepository.findAll();
    }
}
