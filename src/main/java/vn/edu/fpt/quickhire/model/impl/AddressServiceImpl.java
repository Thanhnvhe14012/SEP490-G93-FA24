package vn.edu.fpt.quickhire.model.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.edu.fpt.quickhire.entity.District;
import vn.edu.fpt.quickhire.entity.Province;
import vn.edu.fpt.quickhire.entity.Ward;
import vn.edu.fpt.quickhire.model.AddressService;
import vn.edu.fpt.quickhire.model.repository.DistrictRepository;
import vn.edu.fpt.quickhire.model.repository.ProvinceRepository;
import vn.edu.fpt.quickhire.model.repository.WardRepository;

import java.util.List;

@Service
public class AddressServiceImpl implements AddressService {
    @Autowired
    private ProvinceRepository provinceRepository;
    @Autowired
    private DistrictRepository districtRepository;
    @Autowired
    private WardRepository wardRepository;
    @Override
    public List<Province> getAllProvinces() {
        return this.provinceRepository.findAll();
    }

    @Override
    public String getAddressFromCode(String provinceCode, String districtCode, String wardCode) {
        return wardRepository.findById(wardCode).orElseThrow().getName() + "," + districtRepository.findById(districtCode).orElseThrow().getName() + "," + provinceRepository.findById(provinceCode).orElseThrow().getName();
    }

    @Override
    public List<District> getAllDistricts() {
        return this.districtRepository.findAll();
    }

    @Override
    public List<Ward> getAllWards() {
        return this.wardRepository.findAll();
    }

    @Override
    public List<District> getAllDistrictsByProvinceCode(String provinceCode) {
        return this.districtRepository.findByProvinceCode(provinceCode);
    }

    @Override
    public List<Ward> getAllWardsByDistrictCode(String districtCode) {
        return this.wardRepository.findByDistrictCode(districtCode);
    }
}
