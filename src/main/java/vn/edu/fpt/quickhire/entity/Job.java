package vn.edu.fpt.quickhire.entity;

import jakarta.persistence.*;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Entity
@Table(name = "job")
@Data

public class Job {
    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "benefits")
    private String benefits;

    @DateTimeFormat(pattern = "yyyy-MM-dd") // Adjust format if necessary
    @Column(name = "start")
    private Date start;

    @DateTimeFormat(pattern = "yyyy-MM-dd") // Adjust format if necessary
    @Column(name = "end")
    private Date end;

    @Column(name = "status")
    private Integer status;

    @Column(name="company_id")
    private Long company_id;

    @Column(name = "company_description")
    private String company_description;

    @ManyToOne(fetch = FetchType.LAZY,targetEntity = Company.class)
    @JoinColumn(name = "company_id", referencedColumnName = "id",insertable=false, updatable=false)
    private Company company;

    public Job() {
    }

    public Job(Long id, String company_description, String benefits, String name, String description, Date start, Date end, Integer status, Long company_id) {
        this.id = id;
        this.company_description = company_description;
        this.benefits = benefits;
        this.name = name;
        this.description = description;
        this.start = start;
        this.end = end;
        this.status = status;
        this.company_id = company_id;
    }
}
