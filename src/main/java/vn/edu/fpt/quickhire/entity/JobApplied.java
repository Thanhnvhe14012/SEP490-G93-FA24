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

    @Column(name="status")
    private Integer status;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "userID", referencedColumnName = "account_id", nullable = false, insertable = false, updatable = false)
    private Candidate candidate;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "jobID", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    private Job job;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cvID", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    private CV cv;

    public String getStatusAsString() {
        switch (status) {
            case 0: return "Ứng tuyển ngay";
            case 1: return "Đã ứng tuyển";
            case 2: return "Đã chấp thuận";
            case 3: return "Hồ sơ chưa phù hợp";
            default: return "N/A";
        }
    }
}
