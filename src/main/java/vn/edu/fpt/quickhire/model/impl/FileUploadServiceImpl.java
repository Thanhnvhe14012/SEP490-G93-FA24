package vn.edu.fpt.quickhire.model.impl;

import com.cloudinary.Cloudinary;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import vn.edu.fpt.quickhire.model.FileUploadService;

import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class FileUploadServiceImpl implements FileUploadService {
    private final Cloudinary cloudinary;

    @Override
    public String UploadFile(MultipartFile file) throws IOException {
        String publicId = UUID.randomUUID().toString();
        return cloudinary.uploader()
                .upload(file.getBytes(), Map.of("public_id", publicId))
                .get("url")
                .toString();
    }
}


