package vn.edu.fpt.quickhire.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.edu.fpt.quickhire.entity.Industry;

public interface IndustryRepository extends JpaRepository<Industry, Long> {
}
