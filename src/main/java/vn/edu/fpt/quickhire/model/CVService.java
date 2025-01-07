package vn.edu.fpt.quickhire.model;

import org.springframework.web.multipart.MultipartFile;
import vn.edu.fpt.quickhire.entity.CV;

import java.io.IOException;

public interface CVService {
    CV save(CV cv, MultipartFile file) throws IOException;
    CV findById(long id);
}
