package vn.edu.fpt.quickhire.entity.DTO;

import lombok.Data;

@Data
public class PasswordRequestDTO {
    private String currentPassword;
    private String newPassword;
}
