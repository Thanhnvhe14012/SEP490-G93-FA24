package vn.edu.fpt.quickhire.entity.DTO;

import vn.edu.fpt.quickhire.entity.Industry;

import java.util.Date;
import java.util.Optional;

public class JobDTO {
    private Long id;

    private String name;

    private String description;

    private String benefits;

    private Date start;

    private Date end;

    private Integer status;

    private Long company_id;

    private Long recruiter_id;

    private String industryName;

    private float salary_min;

    private float salary_max;

    private String company_description;

    private String address;

    public JobDTO(Long id, String name, String description, String benefits, Date start, Date end, Integer status, Long company_id, Long recruiter_id, String industry_id, float salary_min, float salary_max, String company_description, String address) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.benefits = benefits;
        this.start = start;
        this.end = end;
        this.status = status;
        this.company_id = company_id;
        this.recruiter_id = recruiter_id;
        this.industryName = industry_id;
        this.salary_min = salary_min;
        this.salary_max = salary_max;
        this.company_description = company_description;
        this.address = address;
    }

    public JobDTO(Long id, String name, String description, float salary_min, float salary_max, String addressFromCode, String industryName) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.salary_min = salary_min;
        this.salary_max = salary_max;
        this.address = addressFromCode;
        this.industryName = industryName;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getBenefits() {
        return benefits;
    }

    public void setBenefits(String benefits) {
        this.benefits = benefits;
    }

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Date getEnd() {
        return end;
    }

    public void setEnd(Date end) {
        this.end = end;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Long getCompany_id() {
        return company_id;
    }

    public void setCompany_id(Long company_id) {
        this.company_id = company_id;
    }

    public Long getRecruiter_id() {
        return recruiter_id;
    }

    public void setRecruiter_id(Long recruiter_id) {
        this.recruiter_id = recruiter_id;
    }

    public String getIndustryName() {
        return industryName;
    }

    public void setIndustryName(String industry_id) {
        this.industryName = industry_id;
    }

    public float getSalary_min() {
        return salary_min;
    }

    public void setSalary_min(float salary_min) {
        this.salary_min = salary_min;
    }

    public float getSalary_max() {
        return salary_max;
    }

    public void setSalary_max(float salary_max) {
        this.salary_max = salary_max;
    }

    public String getCompany_description() {
        return company_description;
    }

    public void setCompany_description(String company_description) {
        this.company_description = company_description;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
