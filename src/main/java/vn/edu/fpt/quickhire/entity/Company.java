package vn.edu.fpt.quickhire.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "company")
@Data
public class Company {
    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "company_code")
    private String companyCode;

    @Column(name = "company_name")
    private String companyName;

    @Column(name = "location")
    private String location;

    @Column(name = "NumOfEmps")
    private int numOfEmps;

    @Column(name = "logo")
    private String logo;

    @Column(name = "description")
    private String description;

    @Column(name = "status")
    private int status;

    @Column(name="typeId")
    private Long typeId;

    public Company() {
    }

    public Company(Long id, Long typeId, String logo, int status, int numOfEmps, String location, String companyName, String companyCode) {
        this.id = id;
        this.typeId = typeId;
        this.logo = logo;
        this.status = status;
        this.numOfEmps = numOfEmps;
        this.location = location;
        this.companyName = companyName;
        this.companyCode = companyCode;
    }
}
