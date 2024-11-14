package vn.edu.fpt.quickhire.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.edu.fpt.quickhire.entity.Cetificate;

import java.util.List;

public interface CetificateRepository extends JpaRepository<Cetificate, Long> {
    Cetificate findCetificateById(Long id);
    List<Cetificate> findAllByAccountId(Long id);
}
