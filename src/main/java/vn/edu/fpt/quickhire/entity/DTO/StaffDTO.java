package vn.edu.fpt.quickhire.entity.DTO;

import lombok.Data;

@Data
public class StaffDTO {
    private String username;
    private String password;
    private String email;
    private String dateOfBirth;
    private String firstName;
    private String middleName;
    private String lastName;
    private String addressId1;
    private String addressId2;
    private String addressId3;
    private String address;
    private int industryId;
}
