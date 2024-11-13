package vn.edu.fpt.quickhire.entity.DTO;

import lombok.Data;

@Data
public class CetificateDTO {
    private Long cetificateId;
    private Integer accountId;
    private String cetificateName;
    private String organization;
    private String start;
    private String end;
}
