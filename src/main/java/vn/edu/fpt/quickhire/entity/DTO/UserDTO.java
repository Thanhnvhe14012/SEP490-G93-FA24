package vn.edu.fpt.quickhire.entity.DTO;

import lombok.Data;

import java.util.Date;

@Data
public class UserDTO {
    private Long id;
    private String username;
    private String password;
    private String email;
    private String dateOfBirth;
    private Integer accountType;
    private String name;
    private String biography;
    private String companyDescription;
    private Integer companyScale;
}
