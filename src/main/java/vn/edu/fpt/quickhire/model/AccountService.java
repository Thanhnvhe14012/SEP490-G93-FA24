package vn.edu.fpt.quickhire.model;

import org.springframework.web.multipart.MultipartFile;
import vn.edu.fpt.quickhire.entity.Account;
import vn.edu.fpt.quickhire.entity.DTO.AccountDTO;
import vn.edu.fpt.quickhire.entity.DTO.UserDTO;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.Optional;

public interface AccountService {
    Account findUserById(long id) ;

    UserDTO login(String username, String password);

    boolean checkRegister(String username);

    boolean checkEmail(String email);

    Account save(Account account);

    Optional<Account> findByEmail(String email);

    List<AccountDTO> fillAllAccount();

    List<AccountDTO> fillAllStaffByRecruiterId(long recruiterId);

    Account updateAccount(UserDTO userDTO,  MultipartFile image) throws ParseException, IOException;
}
