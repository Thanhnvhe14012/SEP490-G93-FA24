package vn.edu.fpt.quickhire.model;

import org.springframework.web.multipart.MultipartFile;
import vn.edu.fpt.quickhire.entity.CV;

import java.io.IOException;
import java.util.List;

public interface CVService {
    CV save(CV cv);

    List<CV> findAllByAccountIdAndStatus(long accountId, int status);

    CV findById(long id);

    void delete(CV cv);
}
