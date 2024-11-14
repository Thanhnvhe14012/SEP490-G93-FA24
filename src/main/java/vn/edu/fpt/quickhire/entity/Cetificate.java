package vn.edu.fpt.quickhire.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Entity
@Table(name = "cetificate")
@Getter
@Setter
public class Cetificate {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "account_id")
    private Integer accountId;

    @Column(name = "cetificate_name")
    private String cetificateName;

    @Column(name = "organization")
    private String organization;

    @Column(name = "start")
    private Date start;

    @Column(name = "end")
    private Date end;
}
