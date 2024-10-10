package vn.edu.fpt.quickhire.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "industry")
@Data
public class Industry {
    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Mapping thông tin biến với tên cột trong Database
    @Column(name = "name")
    private String name;
}
