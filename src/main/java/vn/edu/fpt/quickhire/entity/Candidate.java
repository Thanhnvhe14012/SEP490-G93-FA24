package vn.edu.fpt.quickhire.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "candidate")
@Data
public class Candidate {
    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "accountid")
    private Long accountId;
    // Mapping thông tin biến với tên cột trong Database
    @Column(name = "biography")
    private String biography;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "account_id", nullable = false)
    private Account account;
}
