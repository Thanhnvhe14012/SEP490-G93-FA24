package vn.edu.fpt.quickhire.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "recruiter")
@Data
public class Recruiter {
    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "company_name")
    private String companyName;

    @Column(name = "company_description")
    private String companyDescription;

    @Column(name = "company_scale")
    private Integer companyScale;

    @Column(name = "manager_id")
    private Integer managerId;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "account_id")
    private Account account;
}
