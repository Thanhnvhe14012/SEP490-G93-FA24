package vn.edu.fpt.quickhire.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.edu.fpt.quickhire.entity.Role;
    

public interface RoleRepository extends JpaRepository<Role, Long> {
//    Role findById(long id);
}

