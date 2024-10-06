package vn.edu.fpt.quickhire.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import vn.edu.fpt.quickhire.entity.District;
import vn.edu.fpt.quickhire.entity.Ward;
import vn.edu.fpt.quickhire.model.repository.DistrictRepository;
import vn.edu.fpt.quickhire.model.repository.ProvinceRepository;
import vn.edu.fpt.quickhire.model.repository.WardRepository;

import java.util.List;

@Controller
public class LocationController {
    @Autowired
    private ProvinceRepository provinceRepository;

    @Autowired
    private DistrictRepository districtRepository;

    @Autowired
    private WardRepository wardRepository;

    // Trả về danh sách huyện theo tỉnh
    @GetMapping("/getDistricts")
    @ResponseBody
    public List<District> getDistricts(@RequestParam("provinceCode") String provinceCode) {
        return districtRepository.findByProvinceCode(provinceCode);
    }

    // Trả về danh sách xã theo huyện
    @GetMapping("/getWards")
    @ResponseBody
    public List<Ward> getWards(@RequestParam("districtCode") String districtCode) {
        return wardRepository.findByDistrictCode(districtCode);
    }
}
