package vn.edu.fpt.quickhire.controller.test;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import vn.edu.fpt.quickhire.controller.HandbookController;
import vn.edu.fpt.quickhire.entity.Handbook;
import vn.edu.fpt.quickhire.model.impl.HandbookServiceImpl;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

public class HandbookComtrollerTest {
    @InjectMocks
    private HandbookController handbookController;

    @Mock
    private HandbookServiceImpl handbookService;

    @Mock
    private Model model;

    @Mock
    private MultipartFile multipartFile;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testShowAddHandbookForm() {
        String viewName = handbookController.showAddHandbookForm();
        assertEquals("handbook/addHandbook", viewName);
    }

    @Test
    void testAddHandbookWithValidData() throws IOException {
        // Mock input
        String title = "Test Handbook";
        String content = "This is a test handbook.";

        // Mock file
        when(multipartFile.isEmpty()).thenReturn(false);
        when(multipartFile.getOriginalFilename()).thenReturn("testImage.png");
        when(multipartFile.getInputStream()).thenReturn(getClass().getResourceAsStream("/testImage.png"));

        // Mock service
        Handbook mockHandbook = new Handbook();
        mockHandbook.setTitle(title);
        mockHandbook.setContent(content);
        mockHandbook.setImageUrl("/upload/testImage.png");

        when(handbookService.saveHandbook(any(Handbook.class))).thenReturn(mockHandbook);

        // Call method
        ResponseEntity<Handbook> response = handbookController.addHandbook(title, content, multipartFile);

        // Assert
        assertEquals(HttpStatus.CREATED, response.getStatusCode());
        assertNotNull(response.getBody());
        assertEquals(title, response.getBody().getTitle());
        assertEquals(content, response.getBody().getContent());
        assertEquals("/upload/testImage.png", response.getBody().getImageUrl());
    }

    @Test
    void testAddHandbookWithEmptyFile() {
        // Mock input
        String title = "Test Handbook";
        String content = "This is a test handbook.";

        // Mock file
        when(multipartFile.isEmpty()).thenReturn(true);

        // Mock service
        Handbook mockHandbook = new Handbook();
        mockHandbook.setTitle(title);
        mockHandbook.setContent(content);

        when(handbookService.saveHandbook(any(Handbook.class))).thenReturn(mockHandbook);

        // Call method
        ResponseEntity<Handbook> response = handbookController.addHandbook(title, content, multipartFile);

        // Assert
        assertEquals(HttpStatus.CREATED, response.getStatusCode());
        assertNotNull(response.getBody());
        assertEquals(title, response.getBody().getTitle());
        assertEquals(content, response.getBody().getContent());
        assertEquals(null, response.getBody().getImageUrl());
    }

    @Test
    void testGetHandbook() {
        // Mock handbook
        Handbook handbook = new Handbook();
        handbook.setId(1L);
        handbook.setTitle("Test Handbook");
        when(handbookService.findHandbookById(1L)).thenReturn(handbook);

        String viewName = handbookController.getHandbook(1L, model);

        // Assert
        assertEquals("handbook/handbookDetail", viewName);
        verify(model).addAttribute("handbook", handbook);
    }

    @Test
    void testGetHandbookNotFound() {
        when(handbookService.findHandbookById(1L)).thenReturn(null);

        String viewName = handbookController.getHandbook(1L, model);

        // Assert
        assertEquals("homepage", viewName);
    }

    @Test
    void testGetAllHandbooks() {
        // Mock data
        Handbook handbook1 = new Handbook();
        handbook1.setTitle("Handbook 1");

        Handbook handbook2 = new Handbook();
        handbook2.setTitle("Handbook 2");

        List<Handbook> handbookList = Arrays.asList(handbook1, handbook2);
        when(handbookService.findAllHandbooks()).thenReturn(handbookList);

        String viewName = handbookController.getAllHandbooks(model);

        // Assert
        assertEquals("handbook/handbookPage", viewName);
        verify(model).addAttribute("handbookList", handbookList);
    }
}
