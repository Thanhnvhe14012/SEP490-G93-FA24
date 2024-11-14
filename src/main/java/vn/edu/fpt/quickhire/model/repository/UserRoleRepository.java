package vn.edu.fpt.quickhire.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.edu.fpt.quickhire.entity.Account;
import vn.edu.fpt.quickhire.entity.UserRole;

import java.util.Optional;


public interface UserRoleRepository extends JpaRepository<UserRole, Long> {

   int findUserRoleByAccount_Id(Long id);

}
