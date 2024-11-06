package vn.edu.fpt.quickhire.model.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.edu.fpt.quickhire.entity.Account;
import vn.edu.fpt.quickhire.entity.DTO.UserDTO;
import vn.edu.fpt.quickhire.model.AccountService;
import vn.edu.fpt.quickhire.model.repository.AccountRepository;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Optional;

@Service
public class AccountServiceImpl implements AccountService {

    @Autowired
    AccountRepository accountRepository;

    @Override
    public Account findUserById(long id) {
        return accountRepository.findById(id);
    }

    @Override
    public UserDTO login(String username, String password) {

        Format formatter = new SimpleDateFormat("dd-MM-yyyy");
        Account account = accountRepository.findByUsernameAndPassword(username, password);
        if (account != null) {
            UserDTO userDTO = new UserDTO();
            userDTO.setId(account.getId());
            userDTO.setUsername(account.getUsername());
            userDTO.setPassword(account.getPassword());
            userDTO.setFirstName(account.getFirstName());
            userDTO.setMiddleName(account.getMiddleName());
            userDTO.setLastName(account.getLastName());
            userDTO.setEmail(account.getEmail());
            if (account.getUserRole().getRole().getId() == 2) {
                userDTO.setCompanyName(account.getRecruiter().getCompanyName());
                userDTO.setCompanyDescription(account.getRecruiter().getCompanyDescription());
                userDTO.setCompanyScale(account.getRecruiter().getCompanyScale());
                userDTO.setDisplayName(account.getRecruiter().getCompanyName());
            } else if(account.getUserRole().getRole().getId() == 4) {
                userDTO.setBiography(account.getCandidate().getBiography());
                userDTO.setDisplayName(account.getFirstName() + " " + account.getMiddleName() + " " + account.getLastName());
                userDTO.setDateOfBirth(formatter.format(account.getDateOfBirth()));
            }
            userDTO.setRole(Math.toIntExact(account.getUserRole().getRole().getId()));

            return userDTO;
        } else return null;
    }

    @Override
    public boolean checkRegister(String username) {
        Account account = accountRepository.findByUsername(username);
        if (account == null) {
            return true;
        } else return false;
    }

    @Override
    public Account save(Account account) {
        return accountRepository.save(account);
    }

    @Override
    public Optional<Account> findByEmail(String email) {
        return accountRepository.findAllByEmail(email);
    }
}


