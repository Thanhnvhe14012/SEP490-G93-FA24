package vn.edu.fpt.quickhire.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "candidate")
@Data
public class Candidate {
    @Id
    @Column(name="id")
    private Long id;

    // Mapping thông tin biến với tên cột trong Database
    @Column(name = "biography")
    private String biography;
}
