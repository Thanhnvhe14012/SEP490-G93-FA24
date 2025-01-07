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
    private Long companyId;

    @Column(name="recruiter_id")
    private Long recruiterId;

    @Column(name="industry_id")
    private Long industry_id;

    @Column(name="salary_max")
    private Integer salary_max;

    @Column(name="salary_min")
    private Integer salary_min;

    @Column(name = "company_description")
    private String company_description;

    @Column(name = "type")
    private Integer type;

    @Column(name = "level")
    private Integer level;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "recruiter_id", referencedColumnName = "account_id", nullable = false, insertable = false, updatable = false)
    private Staff staff;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "industry_id", referencedColumnName = "id", insertable = false, updatable = false)
    private Industry industry; // Reference to the Industry


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id", referencedColumnName = "account_id", nullable = false, insertable = false, updatable = false)
    private Recruiter recruiter; // Reference to the Recruiter

    public Job() {
    }

    public Job(Long id, String name, String description, String benefits, Date start, Date end, Integer status, Long companyId, Long recruiterId, Long industry_id, Integer salary_max, Integer salary_min, String company_description, Integer type, Integer level, Staff staff, Industry industry, Recruiter recruiter) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.benefits = benefits;
        this.start = start;
        this.end = end;
        this.status = status;
        this.companyId = companyId;
        this.recruiterId = recruiterId;
        this.industry_id = industry_id;
        this.salary_max = salary_max;
        this.salary_min = salary_min;
        this.company_description = company_description;
        this.type = type;
        this.level = level;
        this.staff = staff;
        this.industry = industry;
        this.recruiter = recruiter;
    }

    public String getTypeAsString() {
        switch (type) {
            case 1: return "Toàn thời gian";
            case 2: return "Bán thời gian";
            case 3: return "Thời vụ";
            case 4: return "Làm tại nhà";
            default: return "N/A";
        }
    }

    public String getLevelAsString() {
        switch (level) {
            case 1: return "Thực tập sinh";
            case 2: return "Nhân viên";
            case 3: return "Quản Lý";
            case 4: return "Giám đốc";
            default: return "N/A";
        }
    }

}
