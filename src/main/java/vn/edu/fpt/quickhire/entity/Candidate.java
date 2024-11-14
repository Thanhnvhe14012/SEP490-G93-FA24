package vn.edu.fpt.quickhire.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Entity
@Table(name = "candidate")
@Getter
@Setter
public class Candidate {
    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Mapping thông tin biến với tên cột trong Database
    @Column(name = "biography")
    private String biography;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "account_id", nullable = false)
    private Account account;
}
