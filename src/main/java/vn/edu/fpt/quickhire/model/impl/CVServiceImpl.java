package vn.edu.fpt.quickhire.model.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import vn.edu.fpt.quickhire.entity.CV;
import vn.edu.fpt.quickhire.model.CVService;
import vn.edu.fpt.quickhire.model.repository.CVRepository;

import java.io.IOException;
import java.util.List;

@Service
public class CVServiceImpl implements CVService {

    @Autowired
    CVRepository cvRepository;

    @Override
    public CV save(CV cv) {
        return cvRepository.save(cv);
    }

    @Override
    public List<CV> findAllByAccountIdAndStatus(long accountId, int status) {
        return cvRepository.findAllByAccountIdAndStatus(accountId, status);
    }

    @Override
    public CV findById(long id) {
        return cvRepository.findById(id);
    }

    @Override
    public void delete(CV cv) {
        cvRepository.delete(cv);
    }
}
