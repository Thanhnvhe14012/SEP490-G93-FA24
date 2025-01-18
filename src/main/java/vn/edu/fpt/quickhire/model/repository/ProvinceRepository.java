package vn.edu.fpt.quickhire.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.edu.fpt.quickhire.entity.Province;

public interface ProvinceRepository extends JpaRepository<Province, Long> {
    Province findByCode(String code);
}
