package vn.edu.fpt.quickhire.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.edu.fpt.quickhire.entity.Experience;

public interface ExperienceRepository extends JpaRepository<Experience, Long> {
}