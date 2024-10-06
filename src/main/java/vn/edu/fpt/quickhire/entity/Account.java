package vn.edu.fpt.quickhire.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Entity
@Table(name = "account")
@Data
public class Account {
    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Mapping thông tin biến với tên cột trong Database
    @Column(name = "username")
    private String username;

    @Column(name = "password")
    private String password;

    @Column(name = "email")
    private String email;

    @Column(name = "date_of_birth")
    private Date dateOfBirth;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "middle_name")
    private String middleName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "address_id_1")
    private String addressId1;

    @Column(name = "address_id_2")
    private String addressId2;

    @Column(name = "address_id_3")
    private String addressId3;

    @Column(name = "address")
    private String address;

    // Quan hệ một account chỉ có duy nhất một candidate
    @OneToOne(mappedBy = "account", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Candidate candidate;

    // Quan hệ một account chỉ có duy nhất một recruiter
    @OneToOne(mappedBy = "account", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Recruiter recruiter;

    @OneToOne(mappedBy = "account", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private UserRole userRole;

    public void setUserRole(UserRole userRole) {
        this.userRole = userRole;
        userRole.setAccount(this); // Liên kết UserRole với Account
    }

    public void setCandidate(Candidate candidate) {
        this.candidate = candidate;
        candidate.setAccount(this);
    }
    public void setRecruiter(Recruiter recruiter) {
        this.recruiter = recruiter;
        recruiter.setAccount(this);
    }


}
