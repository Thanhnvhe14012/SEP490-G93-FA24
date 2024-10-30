package vn.edu.fpt.quickhire.entity.DTO;

import lombok.Data;

@Data
public class EducationDTO {
    private Integer accountId;
    private String schoolName;
    private String start;
    private String end;
    private String gpa;
}
