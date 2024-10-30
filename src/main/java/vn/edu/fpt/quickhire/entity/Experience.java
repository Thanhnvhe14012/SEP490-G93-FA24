package vn.edu.fpt.quickhire.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;

@Entity
@Table(name = "experience")
@Data
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


    @Override
    public String toString() {
        return "Experience{" +
                "id=" + id +
                ", accountId=" + accountId +
                ", company='" + company + '\'' +
                ", start=" + start +
                ", end=" + end +
                ", jobTitle='" + jobTitle + '\'' +
                ", description='" + description + '\'' +
                ", project='" + project + '\'' +
                '}';
    }
}
