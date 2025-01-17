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
    private String addressDisplay;
    private String biography;
    private String companyCode;
    private String companyName;
    private String companyDescription;
    private Integer companyScale;
    private Integer company_status;
    private String company_logo;
    private String displayName;
    private String phoneNumber;
    private String avatar;

    @Override
    public String toString() {
        return "UserDTO{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", dateOfBirth='" + dateOfBirth + '\'' +
                ", role=" + role +
                ", firstName='" + firstName + '\'' +
                ", middleName='" + middleName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", addressId1='" + addressId1 + '\'' +
                ", addressId2='" + addressId2 + '\'' +
                ", addressId3='" + addressId3 + '\'' +
                ", address='" + address + '\'' +
                ", biography='" + biography + '\'' +
                ", companyName='" + companyName + '\'' +
                ", companyDescription='" + companyDescription + '\'' +
                ", companyScale=" + companyScale +
                ", displayName='" + displayName + '\'' +
                '}';
    }
}
