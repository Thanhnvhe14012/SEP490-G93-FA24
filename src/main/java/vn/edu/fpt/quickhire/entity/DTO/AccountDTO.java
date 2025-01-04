package vn.edu.fpt.quickhire.entity.DTO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AccountDTO {
    private Long id;
    private String username;
    private String email;
    private String role;
    private String companyCode;
    private String companyName;
    private Integer status;
    private String displayName;
}
