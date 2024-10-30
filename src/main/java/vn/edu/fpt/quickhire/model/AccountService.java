package vn.edu.fpt.quickhire.model;

import vn.edu.fpt.quickhire.entity.Account;
import vn.edu.fpt.quickhire.entity.DTO.UserDTO;

import java.util.Optional;

public interface AccountService {
    Account findUserById(long id) ;

    UserDTO login(String username, String password);

    boolean checkRegister(String username);

    Account save(Account account);

    Optional<Account> findByEmail(String email);
}
