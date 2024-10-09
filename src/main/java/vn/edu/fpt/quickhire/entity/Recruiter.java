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
}
