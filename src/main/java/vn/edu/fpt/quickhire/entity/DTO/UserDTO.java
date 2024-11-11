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
    private Integer role;
    private String firstName;
    private String middleName;
    private String lastName;
    private String addressId1;
    private String addressId2;
    private String addressId3;
    private String address;
    private String biography;
    private String companyCode;
    private String companyName;
    private String companyDescription;
    private Integer companyScale;
    private Integer company_status;
    private String company_logo;
    private String displayName;
}
