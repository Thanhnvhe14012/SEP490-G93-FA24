package vn.edu.fpt.quickhire.model;

import vn.edu.fpt.quickhire.entity.District;
import vn.edu.fpt.quickhire.entity.Province;
import vn.edu.fpt.quickhire.entity.Ward;

import java.util.List;

public interface AddressService {
    List<Province> getAllProvinces();

    String getAddressFromCode(String provinceCode, String districtCode, String wardCode);
    List<District> getAllDistricts();

    List<Ward> getAllWards();

    List<District> getAllDistrictsByProvinceCode(String provinceCode);

    List<Ward> getAllWardsByDistrictCode(String districtCode);
}
