package vn.edu.fpt.quickhire.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.edu.fpt.quickhire.entity.Account;

import java.util.Optional;


public interface AccountRepository extends JpaRepository<Account, Long> {

    Account findById(long id);
    Account findByUsernameAndPassword(String username, String password);
    Account findByUsername(String username);
    Optional<Account> findAllByEmail(String email);

}
