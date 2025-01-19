package vn.edu.fpt.quickhire.model;

import org.springframework.web.multipart.MultipartFile;
import vn.edu.fpt.quickhire.entity.CV;

import java.io.IOException;
import java.util.List;

public interface CVService {
    CV save(CV cv, MultipartFile file) throws IOException;

    List<CV> findAllByAccountId(long accountId);

    CV findById(long id);

    void delete(CV cv);
}
