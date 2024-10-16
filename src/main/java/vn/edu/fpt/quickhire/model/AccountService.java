package vn.edu.fpt.quickhire.model;

import vn.edu.fpt.quickhire.entity.Account;
import vn.edu.fpt.quickhire.entity.DTO.UserDTO;

public interface AccountService {
    Account findUserById(long id) ;

    UserDTO login(String username, String password);

    boolean checkRegister(String username);

    Account save(Account account);
}
