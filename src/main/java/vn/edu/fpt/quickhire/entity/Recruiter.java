    package vn.edu.fpt.quickhire.entity;

    import jakarta.persistence.*;
    import lombok.Data;

    @Entity
    @Table(name = "recruiter")
    @Data
    public class Recruiter {
        @Id
        @Column(name="id")
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;

        @Column(name = "company_code")
        private String companyCode;

        @Column(name = "company_name")
        private String companyName;

        @Column(name = "company_description")
        private String companyDescription;

        @Column(name = "company_scale")
        private Integer companyScale;

        @Column(name = "description")
        private String description;

        @Column(name = "status")
        private int status;

        @Column(name = "manager_id")
        private Integer managerId;

        @Column(name = "industry_id")
        private Integer industryId;

        @OneToOne(fetch = FetchType.LAZY)
        @JoinColumn(name = "account_id")
        private Account account;

        public Recruiter() {
        }

        public Recruiter(Long id, String companyCode, String companyName, String companyDescription, Integer companyScale, int status, String description, Integer managerId, Integer industryId, Account account) {
            this.id = id;
            this.companyCode = companyCode;
            this.companyName = companyName;
            this.companyDescription = companyDescription;
            this.companyScale = companyScale;
            this.status = status;
            this.description = description;
            this.managerId = managerId;
            this.industryId = industryId;
            this.account = account;
        }
    }
