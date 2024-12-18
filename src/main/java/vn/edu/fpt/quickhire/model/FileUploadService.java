package vn.edu.fpt.quickhire.model;

import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface FileUploadService {
   String UploadFile(MultipartFile file) throws IOException ;
}
