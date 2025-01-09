package vn.edu.fpt.quickhire.model.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import vn.edu.fpt.quickhire.model.FileUploadService;

import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@Service
public class FileUploadServiceImpl implements FileUploadService {
    private final Cloudinary cloudinary;

    public FileUploadServiceImpl(Cloudinary cloudinary) {
        this.cloudinary = cloudinary;
    }

    @Override
    public String uploadFile(MultipartFile file) {
        try {
            String originalFileName = file.getOriginalFilename();

            // Generate a unique public_id by appending a timestamp
            String publicId = originalFileName + "_" + System.currentTimeMillis();

            // Convert MultipartFile to byte array
            byte[] fileBytes = file.getBytes();

            // Upload the file to Cloudinary
            Map<String, Object> params = ObjectUtils.asMap("public_id", publicId);
            Map uploadResult = cloudinary.uploader().upload(fileBytes, params);

            // Get the URL of the uploaded file
            return uploadResult.get("url").toString();
        } catch (IOException e) {
            // Handle IOException
            e.printStackTrace();
            return "Error uploading file: " + e.getMessage();
        } catch (Exception e) {
            // Handle other exceptions
            e.printStackTrace();
            return "Error uploading file: " + e.getMessage();
        }
    }
}


