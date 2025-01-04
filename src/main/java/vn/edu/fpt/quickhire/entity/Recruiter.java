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

        @Column(name = "company_status")
        private Integer company_status;

        @Column(name = "company_logo")
        private String company_logo;

        @Column(name = "company_location")
        private String company_location;

        @Column(name = "company_website")
        private String company_website;

        @Column(name = "industry_id")
        private Long industryId;

        @OneToOne(fetch = FetchType.LAZY)
        @JoinColumn(name = "account_id")
        private Account account;

        public Recruiter() {
        }

        public Recruiter(Long id, String companyCode, String companyName, String companyDescription, Integer companyScale, int company_status, String company_logo, Long industryId, Account account) {
            this.id = id;
            this.companyCode = companyCode;
            this.companyName = companyName;
            this.companyDescription = companyDescription;
            this.companyScale = companyScale;
            this.company_status = company_status;
            this.company_logo = company_logo;
            this.industryId = industryId;
            this.account = account;
        }
    }
