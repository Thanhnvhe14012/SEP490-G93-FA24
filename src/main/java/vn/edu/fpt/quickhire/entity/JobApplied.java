package vn.edu.fpt.quickhire.entity;

import jakarta.persistence.*;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Entity
@Table(name = "job_applied")
@Data
public class JobApplied {
    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="userID")
    private Long userID;

    @Column(name="jobID")
    private Long jobID;

    @Column(name="cvID")
    private Long cvID;

    @Column(name="message")
    private String message;
}
