package vn.edu.fpt.quickhire.model.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import vn.edu.fpt.quickhire.entity.CV;
import vn.edu.fpt.quickhire.model.CVService;
import vn.edu.fpt.quickhire.model.repository.CVRepository;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Service
public class CVServiceImpl implements CVService {

    @Autowired
    CVRepository cvRepository;

    private final String UPLOAD_DIR = "src/main/resources/static/upload/";

    @Override
    public CV save(CV cv, MultipartFile file) throws IOException {
        Path path = Paths.get(UPLOAD_DIR + "/" + file.getOriginalFilename());
        Files.write(path, file.getBytes());
        return cvRepository.save(cv);
    }

    @Override
    public CV findById(long id) {
        return cvRepository.findById(id);
    }
}
