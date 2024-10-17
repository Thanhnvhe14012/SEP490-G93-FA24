package vn.edu.fpt.quickhire.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.Date;

@Entity
@Table(name = "profile_section")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProfileSection {
    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "description")
    private String description;
    // Mapping thông tin biến với tên cột trong Database
    @Column(name = "section")
    private String section;
    @Column(name = "from_month")
    private int fromMonth;
    @Column(name = "from_year")
    private int fromYear;
    @Column(name = "to_month")
    private int toMonth;
    @Column(name = "to_year")
    private int toYear;
    @Column(name = "url")
    private String url;
    @Column(name = "organization")
    private String organization;
    @Column(name = "title")
    private String title;
    @Column(name = "image")
    private String image;




    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
    @JoinColumn(name = "candidate_id", nullable = false)
    private Candidate candidate;

    public ProfileSection(String section) {
        this.section = section;
    }
}
