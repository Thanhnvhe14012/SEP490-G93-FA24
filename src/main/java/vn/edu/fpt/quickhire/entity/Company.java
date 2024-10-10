package vn.edu.fpt.quickhire.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "company")
@Data
public class Company {
    @Id
    @Column(name="id")
    private Long id;

    @Column(name = "company_name")
    private String companyName;

    @Column(name = "location")
    private String location;

    @Column(name = "NumOfEmps")
    private int numOfEmps;

    @Column(name = "logo")
    private String logo;

    @Column(name="typeId")
    private Long typeId;

    public Company() {
    }

    public Company(Long id, String companyName, String location, Long typeId, String logo, int numOfEmps) {
        this.id = id;
        this.companyName = companyName;
        this.location = location;
        this.typeId = typeId;
        this.logo = logo;
        this.numOfEmps = numOfEmps;
    }
}
