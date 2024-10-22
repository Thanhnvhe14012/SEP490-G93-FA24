package vn.edu.fpt.quickhire.helper;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;

@Configuration
public class CloudinaryConfig {
    @Bean
    public Cloudinary cloudinary() {
        return new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "dnpf7xmjw",
                "api_key", "499216548635258",
                "api_secret", "1s_BdBnEcm9N8oZ66O0J2mcSyes"
        ));
    }
}