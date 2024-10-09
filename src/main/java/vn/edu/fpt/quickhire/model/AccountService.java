package vn.edu.fpt.quickhire.model;

import vn.edu.fpt.quickhire.entity.Account;

public interface AccountService {
    Account findUserById(long id) ;

    Account login(String username, String password);

    boolean checkRegister(String username);

    Account save(Account account);
}
