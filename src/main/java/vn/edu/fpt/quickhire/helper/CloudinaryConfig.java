package vn.edu.fpt.quickhire.helper;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import org.cloudinary.json.JSONObject;
import org.cloudinary.json.JSONTokener;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

@Configuration
public class CloudinaryConfig {
    @Bean
    public Cloudinary cloudinary() {
        try {
            InputStream inputStream = getClass().getClassLoader().getResourceAsStream("cloudinary.json");
            JSONTokener tokener = new JSONTokener(inputStream);
            JSONObject configJson = new JSONObject(tokener);
            return new Cloudinary(ObjectUtils.asMap(
                    "cloud_name", configJson.getString("cloud_name"),
                    "api_key", configJson.getString("api_key"),
                    "api_secret", configJson.getString("api_secret")
            ));
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}