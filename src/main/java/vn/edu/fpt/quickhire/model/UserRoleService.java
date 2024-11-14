package vn.edu.fpt.quickhire.model;

import vn.edu.fpt.quickhire.entity.Account;
import vn.edu.fpt.quickhire.entity.DTO.UserDTO;

import java.util.Optional;

public interface UserRoleService {
    int findUserRoleByAccount_Id(Long id);

}
