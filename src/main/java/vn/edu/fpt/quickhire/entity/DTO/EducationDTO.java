package vn.edu.fpt.quickhire.entity.DTO;

import lombok.Data;

@Data
public class EducationDTO {
    private Long eduId;
    private Long accountId;
    private String schoolName;
    private String major;
    private String start;
    private String end;
    private String gpa;
}
