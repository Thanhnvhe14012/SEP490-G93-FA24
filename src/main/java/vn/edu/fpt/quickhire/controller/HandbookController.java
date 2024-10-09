package vn.edu.fpt.quickhire.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import vn.edu.fpt.quickhire.entity.Handbook;
import vn.edu.fpt.quickhire.model.impl.HandbookServiceImpl;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/handbook")
public class HandbookController {

    @Autowired
    private HandbookServiceImpl handbookService;

    @GetMapping("/add")
    public String showAddHandbookForm() {
        return "handbook/addHandbook";
    }

    @PostMapping("/add")
    public ResponseEntity<Handbook> addHandbook(
            @RequestParam String title,
            @RequestParam String content,
            @RequestParam("imageFile") MultipartFile imageFile) {

        Handbook handbook = new Handbook();
        handbook.setTitle(title);
        handbook.setContent(content);

        // Handle the image file
        if (imageFile != null && !imageFile.isEmpty()) {
            String imageUrl = saveImage(imageFile);
            handbook.setImageUrl(imageUrl);
        }

        Handbook savedHandbook = handbookService.saveHandbook(handbook);
        return new ResponseEntity<>(savedHandbook, HttpStatus.CREATED);
    }

    private String saveImage(MultipartFile imageFile) {
        String fileName = UUID.randomUUID().toString() + "_" + imageFile.getOriginalFilename();
        String uploadDir = "src/main/resources/static/upload/";

        try {
            Path filePath = Paths.get(uploadDir + fileName);
            Files.copy(imageFile.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
            return "/uploads/" + fileName; // Return the URL where the image is saved
        } catch (IOException e) {
            // Handle the exception
            return null;
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<Handbook> getHandbook(@PathVariable long id) {
        Handbook handbook = handbookService.findHandbookById(id);
        if (handbook != null) {
            return new ResponseEntity<>(handbook, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

//    @GetMapping()
//    public String getAllHandbooks() {
//        List<Handbook> handbookList = handbookService.findAllHandbooks();
//        if (handbookList != null) {
//            model.addAttribute("handbookList", handbookList);
//            return "handbookPage";
//        } else {
//            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
//        }
//    }
}
