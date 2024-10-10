package vn.edu.fpt.quickhire.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.edu.fpt.quickhire.entity.Handbook;

import java.util.List;

public interface HandbookRepository extends JpaRepository<Handbook, Long> {
    Handbook save(Handbook handbook);
    Handbook findById(long id);
    List<Handbook> findAll();
}
