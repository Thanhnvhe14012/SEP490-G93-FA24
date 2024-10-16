package vn.edu.fpt.quickhire.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "cv_section")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CvSection {
    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "candidate_cv_no")
    private int candidateCvNo;

    @Column(name = "description")
    private String description;
    // Mapping thông tin biến với tên cột trong Database
    @Column(name = "section")
    private String section;
    @Column(name = "organization")
    private String organization;
    @Column(name = "title")
    private String title;
    @Column(name = "techstack")
    private String techstack;
    @Column(name = "client")
    private String client;
    @Column(name = "team")
    private Integer team;
    @Column(name = "image")
    private String image;


    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
    @JoinColumn(name = "candidate_id", nullable = false)
    private Candidate candidate;

    public CvSection(String section, int no) {
        this.section = section;
        this.candidateCvNo = no;
    }
}
