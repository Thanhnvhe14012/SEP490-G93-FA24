package vn.edu.fpt.quickhire.entity;

import jakarta.persistence.*;

import java.util.Date;

@Entity
@Table(name = "experience")
public class Experience {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "account_id")
    private Integer accountId;

    @Column(name = "company")
    private String company;

    @Column(name = "start")
    private Date start;

    @Column(name = "end")
    private Date end;

    @Column(name = "job_title")
    private String jobTitle;

    @Column(name = "description")
    private String description;

    @Column(name = "project")
    private String project;
}
