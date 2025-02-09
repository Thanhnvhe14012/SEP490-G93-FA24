package vn.edu.fpt.quickhire.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.edu.fpt.quickhire.entity.Ward;

import java.util.List;

public interface WardRepository extends JpaRepository<Ward, Long> {
    List<Ward> findByDistrictCode(String districtCode);
    Ward findByCode(String code);
}
