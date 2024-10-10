package vn.edu.fpt.quickhire.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "recruiter")
@Data
public class Recruiter {
    @Id
    @Column(name="id")
    private Long id;

    // Mapping thông tin biến với tên cột trong Database
    @Column(name = "company_description")
    private String companyDescription;

    @Column(name = "company_scale")
    private Integer companyScale;

    public Recruiter() {
    }

    public Recruiter(Long id, String companyDescription, Integer companyScale) {
        this.id = id;
        this.companyDescription = companyDescription;
        this.companyScale = companyScale;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCompanyDescription() {
        return companyDescription;
    }

    public void setCompanyDescription(String companyDescription) {
        this.companyDescription = companyDescription;
    }

    public Integer getCompanyScale() {
        return companyScale;
    }

    public void setCompanyScale(Integer companyScale) {
        this.companyScale = companyScale;
    }
}
