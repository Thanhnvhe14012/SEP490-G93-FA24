package vn.edu.fpt.quickhire.entity;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "report")
@Getter
@Setter
public class Report {
    @Id
    @Column(name="report_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long reportId;

    @Column(name = "report_reason")
    private String reportReason;

    @Column(name = "report_description")
    private String reportDescription;

    @Column(name = "report_status")
    private int reportStatus;

    @ManyToOne(fetch = FetchType.LAZY,targetEntity = Candidate.class)
    @JoinColumn(name = "candidate_id", referencedColumnName = "id")
    private Candidate candidate;

    @ManyToOne(fetch = FetchType.LAZY,targetEntity = Job.class)
    @JoinColumn(name = "job_id", referencedColumnName = "id")
    private Job job;

    public Report() {
    }

    public Report(Long reportId, String reportReason, String reportDescription, int reportStatus, Candidate candidate, Job job) {
        this.reportId = reportId;
        this.reportReason = reportReason;
        this.reportDescription = reportDescription;
        this.reportStatus = reportStatus;
        this.candidate = candidate;
        this.job = job;
    }
}
