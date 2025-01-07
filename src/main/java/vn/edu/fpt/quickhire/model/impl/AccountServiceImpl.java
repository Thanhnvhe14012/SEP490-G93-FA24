package vn.edu.fpt.quickhire.model.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.edu.fpt.quickhire.entity.Account;
import vn.edu.fpt.quickhire.entity.DTO.AccountDTO;
import vn.edu.fpt.quickhire.entity.DTO.UserDTO;
import vn.edu.fpt.quickhire.entity.Recruiter;
import vn.edu.fpt.quickhire.entity.Staff;
import vn.edu.fpt.quickhire.model.AccountService;
import vn.edu.fpt.quickhire.model.repository.AccountRepository;
import vn.edu.fpt.quickhire.model.repository.RecruiterRepository;
import vn.edu.fpt.quickhire.model.repository.StaffRepository;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class AccountServiceImpl implements AccountService {

    @Autowired
    AccountRepository accountRepository;
    @Autowired
    RecruiterRepository recruiterRepository;
    @Autowired
    StaffRepository staffRepository;

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
            userDTO.setAddressId1(account.getAddressId1());
            userDTO.setAddressId2(account.getAddressId2());
            userDTO.setAddressId3(account.getAddressId3());
            userDTO.setAddress(account.getAddress());
            userDTO.setEmail(account.getEmail());
            if (account.getRole() == 2) {
                userDTO.setCompanyName(account.getRecruiter().getCompanyName());
                userDTO.setCompanyDescription(account.getRecruiter().getCompanyDescription());
                userDTO.setCompanyScale(account.getRecruiter().getCompanyScale());
                userDTO.setDisplayName(account.getRecruiter().getCompanyName());
                userDTO.setCompanyCode(account.getRecruiter().getCompanyCode());
            }
            else if (account.getRole() == 3) {
                userDTO.setCompanyName(account.getStaff().getRecruiter().getCompanyName());
                userDTO.setCompanyDescription(account.getStaff().getRecruiter().getCompanyDescription());
                userDTO.setCompanyScale(account.getStaff().getRecruiter().getCompanyScale());
                userDTO.setDisplayName(account.getFirstName() + " " + account.getMiddleName() + " " + account.getLastName());
            }
            else if(account.getRole() == 4) {
                userDTO.setBiography(account.getCandidate().getBiography());
                userDTO.setDisplayName(account.getFirstName() + " " + account.getMiddleName() + " " + account.getLastName());
                userDTO.setDateOfBirth(formatter.format(account.getDateOfBirth()));
            }
            userDTO.setRole(Math.toIntExact(account.getRole()));

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

    @Override
    public List<AccountDTO> fillAllAccount() {
        List<Account> listAll = accountRepository.findAllByOrderByIdDesc();
        List<AccountDTO> accountDTOList = new ArrayList<>();
        if(!listAll.isEmpty()) {
            for (Account account : listAll) {
                AccountDTO accountDTO = new AccountDTO();
                accountDTO.setId(account.getId());
                accountDTO.setUsername(account.getUsername());
                accountDTO.setDisplayName((account.getFirstName() != null ? account.getFirstName() : "") + " " +
                        (account.getMiddleName() != null ? account.getMiddleName() : "") + " " +
                        (account.getLastName() != null ? account.getLastName() : ""));
                accountDTO.setEmail(account.getEmail());
                if(account.getRole() == 2){
                    accountDTO.setRole("Nhà tuyển dụng");
                    accountDTO.setCompanyName(account.getRecruiter().getCompanyName());
                    accountDTO.setCompanyCode(account.getRecruiter().getCompanyCode());
                } else if(account.getRole() == 3){
                    accountDTO.setRole("Nhân viên công ty");
                    accountDTO.setCompanyName(account.getRecruiter().getCompanyName());
                    accountDTO.setCompanyCode(account.getRecruiter().getCompanyCode());
                } else if(account.getRole() == 4){
                    accountDTO.setRole("Người ứng tuyển");
                }
                accountDTO.setStatus(1);
                accountDTOList.add(accountDTO);
            }
            return accountDTOList;
        }
        return null;
    }

    @Override
    public List<AccountDTO> fillAllStaffByRecruiterId(long recruiterId) {
        Recruiter recruiter = recruiterRepository.findById(recruiterId).get();
        List<Staff> staffs = staffRepository.findAllByRecruiter(recruiter);
        List<AccountDTO> accountDTOList = new ArrayList<>();
        if(!staffs.isEmpty()) {
            for (Staff staff : staffs) {
                AccountDTO accountDTO = new AccountDTO();
                accountDTO.setId(staff.getAccount().getId());
                accountDTO.setUsername(staff.getAccount().getUsername());
                accountDTO.setDisplayName((staff.getAccount().getFirstName() != null ? staff.getAccount().getFirstName() : "") + " " +
                        (staff.getAccount().getMiddleName() != null ? staff.getAccount().getMiddleName() : "") + " " +
                        (staff.getAccount().getLastName() != null ? staff.getAccount().getLastName() : ""));
                accountDTO.setEmail(staff.getAccount().getEmail());
                    accountDTO.setRole("Nhân viên công ty");
                    accountDTO.setCompanyName(staff.getAccount().getRecruiter().getCompanyName());
                    accountDTO.setCompanyCode(staff.getAccount().getRecruiter().getCompanyCode());

                accountDTO.setStatus(1);
                accountDTOList.add(accountDTO);
            }
            return accountDTOList;
        }
        return null;

    }


}


