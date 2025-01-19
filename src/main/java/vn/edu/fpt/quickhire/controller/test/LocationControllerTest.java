package vn.edu.fpt.quickhire.controller.test;


import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import vn.edu.fpt.quickhire.controller.LocationController;
import vn.edu.fpt.quickhire.entity.District;
import vn.edu.fpt.quickhire.entity.Ward;
import vn.edu.fpt.quickhire.model.repository.DistrictRepository;
import vn.edu.fpt.quickhire.model.repository.WardRepository;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

public class LocationControllerTest {
    @InjectMocks
    private LocationController locationController;

    @Mock
    private DistrictRepository districtRepository;

    @Mock
    private WardRepository wardRepository;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testGetDistricts_WithValidProvinceCode() {
        String provinceCode = "01";
        List<District> districts = new ArrayList<>();
        District district1 = new District();
        district1.setCode("001");
        district1.setName("District 1");

        District district2 = new District();
        district2.setCode("002");
        district2.setName("District 2");

        districts.add(district1);
        districts.add(district2);

        when(districtRepository.findByProvinceCode(provinceCode)).thenReturn(districts);

        List<District> result = locationController.getDistricts(provinceCode);

        assertEquals(2, result.size());
        assertEquals("District 1", result.get(0).getName());
        assertEquals("District 2", result.get(1).getName());
        verify(districtRepository, times(1)).findByProvinceCode(provinceCode);
    }

    @Test
    void testGetDistricts_WithNoResults() {
        String provinceCode = "02";
        when(districtRepository.findByProvinceCode(provinceCode)).thenReturn(new ArrayList<>());

        List<District> result = locationController.getDistricts(provinceCode);

        assertEquals(0, result.size());
        verify(districtRepository, times(1)).findByProvinceCode(provinceCode);
    }

    @Test
    void testGetWards_WithValidDistrictCode() {
        String districtCode = "001";
        List<Ward> wards = new ArrayList<>();
        Ward ward1 = new Ward();
        ward1.setCode("1001");
        ward1.setName("Ward 1");

        Ward ward2 = new Ward();
        ward2.setCode("1002");
        ward2.setName("Ward 2");

        wards.add(ward1);
        wards.add(ward2);

        when(wardRepository.findByDistrictCode(districtCode)).thenReturn(wards);

        List<Ward> result = locationController.getWards(districtCode);

        assertEquals(2, result.size());
        assertEquals("Ward 1", result.get(0).getName());
        assertEquals("Ward 2", result.get(1).getName());
        verify(wardRepository, times(1)).findByDistrictCode(districtCode);
    }

    @Test
    void testGetWards_WithNoResults() {
        String districtCode = "002";
        when(wardRepository.findByDistrictCode(districtCode)).thenReturn(new ArrayList<>());

        List<Ward> result = locationController.getWards(districtCode);

        assertEquals(0, result.size());
        verify(wardRepository, times(1)).findByDistrictCode(districtCode);
    }
}
