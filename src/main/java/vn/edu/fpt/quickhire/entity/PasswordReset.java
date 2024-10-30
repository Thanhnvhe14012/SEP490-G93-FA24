package vn.edu.fpt.quickhire.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

import java.time.LocalDateTime;

@Entity
@Table(name = "password_reset")
@Data
public class PasswordReset {

    @Id
    @Column(name = "email")
    private String email;

    @Column(name = "verification_code")
    private String verificationCode;

    @Column(name = "expiry_time")
    private LocalDateTime expiryTime;

    public PasswordReset(String email, String verificationCode, LocalDateTime expiryTime) {
        this.email = email;
        this.verificationCode = verificationCode;
        this.expiryTime = expiryTime;
    }

    public PasswordReset() {

    }
}
