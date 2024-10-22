package vn.edu.fpt.quickhire.model;

import org.springframework.web.multipart.MultipartFile;
import vn.edu.fpt.quickhire.entity.Company;

import java.io.IOException;
import java.util.List;

public interface FileUploadService {
   String UploadFile(MultipartFile file) throws IOException ;
}
