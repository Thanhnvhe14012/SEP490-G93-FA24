package vn.edu.fpt.quickhire.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "companyType")
@Data
public class CompanyType {
    @Id
    @Column(name="id")
    private Long id;

    @Column(name = "type_name")
    private String typeName;

    public CompanyType() {
    }

    public CompanyType(Long id, String typeName) {
        this.id = id;
        this.typeName = typeName;
    }
}
