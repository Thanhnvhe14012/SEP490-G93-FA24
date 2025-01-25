package vn.edu.fpt.quickhire.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.edu.fpt.quickhire.entity.CV;

import java.util.List;


public interface CVRepository extends JpaRepository<CV, Long> {
    CV save(CV cv);
    CV findById(long id);
    List<CV> findAll();
    List<CV> findAllByAccountIdAndStatus(long accountId, int status);
}
