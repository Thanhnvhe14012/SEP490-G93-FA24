package vn.edu.fpt.quickhire.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;

@Entity
@Table(name = "education")
@Data
public class Education {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "account_id")
    private Long accountId;

    @Column(name = "school_name")
    private String schoolName;

    @Column(name = "major")
    private String major;

    @Column(name = "start")
    private Date start;

    @Column(name = "end")
    private Date end;

    @Column(name = "gpa")
    private double gpa;
}
