package vn.edu.fpt.quickhire.entity.DTO;

import jakarta.persistence.Column;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ExperienceDTO {
    private Long exId;
    private Long accountId;
    private String company;
    private String start;
    private String end;
    private String jobTitle;
    private String description;
    private String project;
}
