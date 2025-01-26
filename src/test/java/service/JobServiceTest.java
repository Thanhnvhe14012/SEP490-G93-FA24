package service;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import vn.edu.fpt.quickhire.entity.Account;
import vn.edu.fpt.quickhire.entity.Job;
import vn.edu.fpt.quickhire.entity.Recruiter;
import vn.edu.fpt.quickhire.entity.Staff;
import vn.edu.fpt.quickhire.model.impl.JobServiceImpl;
import vn.edu.fpt.quickhire.model.repository.JobRepository;
import vn.edu.fpt.quickhire.model.repository.StaffRepository;

import java.util.Date;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class JobServiceTest {
    @Mock
    JobRepository jobRepository;

    @Mock
    private StaffRepository staffRepository;

    @InjectMocks
    JobServiceImpl jobService;

    private Job mockJobDTO(Integer salaryMin, Integer salaryMax, String name, String description, Integer type, Integer level, String benefits, Date startDate, Date endDate) {
        Job job = new Job();
        job.setName(name);
        job.setDescription(description);
        job.setBenefits(benefits);
        job.setType(type);
        job.setLevel(level);
        job.setSalary_min(salaryMin);
        job.setSalary_max(salaryMax);
        job.setStart(startDate);
        job.setEnd(endDate);
        return job;
    }

    private Staff mockStaff() {
        Staff staff = new Staff();
        Recruiter recruiter = new Recruiter();
        Account recruiterAccount = new Account();
        recruiterAccount.setId(1L);
        Account staffAccount = new Account();
        staffAccount.setId(2L);
        recruiter.setAccount(recruiterAccount);
        recruiter.setCompanyDescription("Company Description");
        staff.setAccount(staffAccount);
        staff.setRecruiter(recruiter);
        staff.setIndustryId(100L);
        return staff;
    }

    @Test
    void UTCID01_CreateJob_SuccessfulCreation() {
        Long accountId = 2L;
        Staff staff = mockStaff();
        Job jobDTO = mockJobDTO(
                5000000, 10000000, "Nhân viên bán hàng", "Phụ trách bán hàng và chăm sóc khách hàng", 1, 1,
                "Bảo hiểm, thưởng tháng",
                new Date(2025 - 1900, 0, 21), // Start Date: Jan 21, 2025
                new Date(2025 - 1900, 0, 31)  // End Date: Jan 31, 2025
        );

        when(staffRepository.findByAccount_Id(accountId)).thenReturn(staff);
        when(jobRepository.save(any(Job.class))).thenReturn(jobDTO);

        Job createdJob = jobService.createJob(jobDTO, accountId);

        assertNotNull(createdJob);
        assertEquals("Nhân viên bán hàng", createdJob.getName());
        assertEquals(5000000, createdJob.getSalary_min());
        assertEquals(10000000, createdJob.getSalary_max());
    }

    @Test
    void UTCID02_CreateJob_NotLoggedInAsStaff_ShouldThrowException() {
        Long accountId = 2L;  // Mocked staff account ID
        Staff staff = null;  // Simulating that the staff is not found (not logged in)

        Job jobDTO = mockJobDTO(
                5000000, 10000000, "Nhân viên bán hàng", "Phụ trách bán hàng và chăm sóc khách hàng", 1, 1,
                "Bảo hiểm, thưởng tháng",
                new Date(2025 - 1900, 0, 21),  // Start Date: Jan 21, 2025
                new Date(2025 - 1900, 0, 31)  // End Date: Jan 31, 2025
        );

        when(staffRepository.findByAccount_Id(accountId)).thenReturn(staff);  // Simulate no staff found

        Exception exception = assertThrows(RuntimeException.class,
                () -> jobService.createJob(jobDTO, accountId));

        assertEquals("Staff not found for account ID: " + accountId, exception.getMessage());
    }

    @Test
    void UTCID03_CreateJob_MissingName_ShouldThrowException() {
        Long accountId = 2L;
        Staff staff = mockStaff();
        Job jobDTO = mockJobDTO(
                5000000, 10000000, null, "Phụ trách bán hàng và chăm sóc khách hàng", 1, 1,
                "Bảo hiểm, thưởng tháng",
                new Date(2025 - 1900, 0, 21),
                new Date(2025 - 1900, 0, 31)
        );

        when(staffRepository.findByAccount_Id(accountId)).thenReturn(staff);

        Exception exception = assertThrows(RuntimeException.class,
                () -> jobService.createJob(jobDTO, accountId));

        assertEquals("Tên công việc không được để trống", exception.getMessage());
    }

    @Test
    void UTCID04_CreateJob_MissingDescription_ShouldThrowException() {
        Long accountId = 2L;
        Staff staff = mockStaff();
        Job jobDTO = mockJobDTO(
                5000000, 10000000, "Nhân viên bán hàng", null, 1, 1,
                "Bảo hiểm, thưởng tháng",
                new Date(2025 - 1900, 0, 21),
                new Date(2025 - 1900, 0, 31)
        );

        when(staffRepository.findByAccount_Id(accountId)).thenReturn(staff);

        Exception exception = assertThrows(RuntimeException.class,
                () -> jobService.createJob(jobDTO, accountId));

        assertEquals("Mô tả công việc không được để trống", exception.getMessage());
    }

    @Test
    void UTCID05_CreateJob_MissingType_ShouldThrowException() {
        Long accountId = 2L;
        Staff staff = mockStaff();
        Job jobDTO = mockJobDTO(
                5000000, 10000000, "Nhân viên bán hàng", "Phụ trách bán hàng và chăm sóc khách hàng", null, 1,
                "Bảo hiểm, thưởng tháng",
                new Date(2025 - 1900, 0, 21),
                new Date(2025 - 1900, 0, 31)
        );

        when(staffRepository.findByAccount_Id(accountId)).thenReturn(staff);

        Exception exception = assertThrows(RuntimeException.class,
                () -> jobService.createJob(jobDTO, accountId));

        assertEquals("Loại công việc không được để trống", exception.getMessage());
    }

    @Test
    void UTCID06_CreateJob_MissingLevel_ShouldThrowException() {
        Long accountId = 2L;
        Staff staff = mockStaff();
        Job jobDTO = mockJobDTO(
                5000000, 10000000, "Nhân viên bán hàng", "Phụ trách bán hàng và chăm sóc khách hàng", 1, null,
                "Bảo hiểm, thưởng tháng",
                new Date(2025 - 1900, 0, 21),
                new Date(2025 - 1900, 0, 31)
        );

        when(staffRepository.findByAccount_Id(accountId)).thenReturn(staff);

        Exception exception = assertThrows(RuntimeException.class,
                () -> jobService.createJob(jobDTO, accountId));

        assertEquals("Cấp bậc không được để trống", exception.getMessage());
    }

    @Test
    void UTCID07_CreateJob_MissingBenefits_ShouldThrowException() {
        Long accountId = 2L;
        Staff staff = mockStaff();
        Job jobDTO = mockJobDTO(
                5000000, 10000000, "Nhân viên bán hàng", "Phụ trách bán hàng và chăm sóc khách hàng", 1, 1,
                null,
                new Date(2025 - 1900, 0, 21),
                new Date(2025 - 1900, 0, 31)
        );

        when(staffRepository.findByAccount_Id(accountId)).thenReturn(staff);

        Exception exception = assertThrows(RuntimeException.class,
                () -> jobService.createJob(jobDTO, accountId));

        assertEquals("Quyền lợi không được để trống", exception.getMessage());
    }

    @Test
    void UTCID08_CreateJob_MissingStartDate_ShouldThrowException() {
        Long accountId = 2L;
        Staff staff = mockStaff();
        Job jobDTO = mockJobDTO(
                5000000, 10000000, "Nhân viên bán hàng", "Phụ trách bán hàng và chăm sóc khách hàng", 1, 1,
                "Bảo hiểm, thưởng tháng",
                null,  // Start Date: null
                new Date(2025 - 1900, 0, 31)  // End Date: Jan 31, 2025
        );

        when(staffRepository.findByAccount_Id(accountId)).thenReturn(staff);

        Exception exception = assertThrows(RuntimeException.class,
                () -> jobService.createJob(jobDTO, accountId));

        assertEquals("Ngày bắt đầu không được để trống", exception.getMessage());
    }

    @Test
    void UTCID09_CreateJob_MissingEndDate_ShouldThrowException() {
        Long accountId = 2L;
        Staff staff = mockStaff();
        Job jobDTO = mockJobDTO(
                5000000, 10000000, "Nhân viên bán hàng", "Phụ trách bán hàng và chăm sóc khách hàng", 1, 1,
                "Bảo hiểm, thưởng tháng",
                new Date(2025 - 1900, 0, 21),  // Start Date: Jan 21, 2025
                null  // End Date: null
        );

        when(staffRepository.findByAccount_Id(accountId)).thenReturn(staff);

        Exception exception = assertThrows(RuntimeException.class,
                () -> jobService.createJob(jobDTO, accountId));

        assertEquals("Ngày kết thúc không được để trống", exception.getMessage());
    }

    @Test
    void UTCID10_CreateJob_MaxSalaryLessThanMinSalary_ShouldThrowException() {
        Long accountId = 2L;
        Staff staff = mockStaff();
        Job jobDTO = mockJobDTO(
                10000000, 5000000, "Nhân viên bán hàng", "Phụ trách bán hàng và chăm sóc khách hàng", 1, 1,
                "Bảo hiểm, thưởng tháng",
                new Date(2025 - 1900, 0, 21),
                new Date(2025 - 1900, 0, 31)
        );

        when(staffRepository.findByAccount_Id(accountId)).thenReturn(staff);

        Exception exception = assertThrows(RuntimeException.class,
                () -> jobService.createJob(jobDTO, accountId));

        assertEquals("Lương tối đa phải lớn hơn lương tối thiểu", exception.getMessage());
    }

    @Test
    void UTCID11_CreateJob_NegativeMinimumSalary_ShouldThrowException() {
        Long accountId = 2L;
        Staff staff = mockStaff();
        Job jobDTO = mockJobDTO(
                -5000000, 10000000, "Nhân viên bán hàng", "Phụ trách bán hàng và chăm sóc khách hàng", 1, 1,
                "Bảo hiểm, thưởng tháng",
                new Date(2025 - 1900, 0, 21),
                new Date(2025 - 1900, 0, 31)
        );

        when(staffRepository.findByAccount_Id(accountId)).thenReturn(staff);

        Exception exception = assertThrows(RuntimeException.class,
                () -> jobService.createJob(jobDTO, accountId));

        assertEquals("Lương phải là một con số dương", exception.getMessage());
    }

    @Test
    void UTCID12_CreateJob_StartDateAfterEndDate_ShouldThrowException() {
        Long accountId = 2L;
        Staff staff = mockStaff();
        Job jobDTO = mockJobDTO(
                5000000, 10000000, "Nhân viên bán hàng", "Phụ trách bán hàng và chăm sóc khách hàng", 1, 1,
                "Bảo hiểm, thưởng tháng",
                new Date(2025 - 1900, 1, 1),  // Start Date: Feb 1, 2025
                new Date(2025 - 1900, 0, 31)  // End Date: Jan 31, 2025
        );

        when(staffRepository.findByAccount_Id(accountId)).thenReturn(staff);

        Exception exception = assertThrows(RuntimeException.class,
                () -> jobService.createJob(jobDTO, accountId));

        assertEquals("Ngày bắt đầu phải trước ngày kết thúc", exception.getMessage());
    }

    @Test
    void UTCID13_CreateJob_SalaryZero_ShouldThrowException() {
        Long accountId = 2L;
        Staff staff = mockStaff();

        // Job with minimum salary 0, which is a boundary value.
        Job jobDTO = mockJobDTO(
                0, 10000000, "Nhân viên bán hàng", "Phụ trách bán hàng và chăm sóc khách hàng", 1, 1,
                "Bảo hiểm, thưởng tháng",
                new Date(2025 - 1900, 0, 21),  // Start Date: Jan 21, 2025
                new Date(2025 - 1900, 0, 31)  // End Date: Jan 31, 2025
        );

        when(staffRepository.findByAccount_Id(accountId)).thenReturn(staff);

        Exception exception = assertThrows(RuntimeException.class,
                () -> jobService.createJob(jobDTO, accountId));

        assertEquals("Lương phải là một con số dương", exception.getMessage());
    }

    @Test
    void UTCID01_UpdateJob_ValidInputs_ShouldUpdateJob() {
        Long jobId = 1L;
        Job existingJob = mockJobDTO(
                5000000, 10000000, "Nhân viên bán hàng", "Phụ trách bán hàng và chăm sóc khách hàng", 1, 1,
                "Bảo hiểm, thưởng tháng",
                new Date(2025 - 1900, 0, 21),
                new Date(2025 - 1900, 0, 31)
        );
        existingJob.setId(jobId);

        Job jobDTO = mockJobDTO(
                6000000, 11000000, "Nhân viên bán hàng", "Chăm sóc khách hàng và hỗ trợ bán hàng", 1, 1,
                "Bảo hiểm, thưởng tháng",
                new Date(2025 - 1900, 0, 21),
                new Date(2025 - 1900, 0, 31)
        );

        when(jobRepository.findById(jobId)).thenReturn(Optional.of(existingJob));
        when(jobRepository.save(any(Job.class))).thenReturn(existingJob);

        Job updatedJob = jobService.updateJob(jobId, jobDTO);

        assertNotNull(updatedJob);
        assertEquals("Nhân viên bán hàng", updatedJob.getName());
        assertEquals("Chăm sóc khách hàng và hỗ trợ bán hàng", updatedJob.getDescription());
        assertEquals(Integer.valueOf(6000000), updatedJob.getSalary_min());
        assertEquals(Integer.valueOf(11000000), updatedJob.getSalary_max());
    }

    @Test
    void UTCID02_UpdateJob_NameIsNull_ShouldThrowException() {
        Long jobId = 1L;
        Job existingJob = mockJobDTO(
                5000000, 10000000, "Nhân viên bán hàng", "Phụ trách bán hàng và chăm sóc khách hàng", 1, 1,
                "Bảo hiểm, thưởng tháng",
                new Date(2025 - 1900, 0, 21),
                new Date(2025 - 1900, 0, 31)
        );
        existingJob.setId(jobId);

        Job jobDTO = mockJobDTO(
                5000000, 10000000, null, "Mô tả công việc", 1, 1,
                "Bảo hiểm, thưởng tháng",
                new Date(2025 - 1900, 0, 21),
                new Date(2025 - 1900, 0, 31)
        );

        Exception exception = assertThrows(RuntimeException.class,
                () -> jobService.updateJob(jobId, jobDTO));

        assertEquals("Tên công việc không được để trống", exception.getMessage());
    }

    @Test
    void UTCID03_UpdateJob_DescriptionIsNull_ShouldThrowException() {
        Long jobId = 1L;
        Job existingJob = mockJobDTO(
                5000000, 10000000, "Nhân viên bán hàng", "Phụ trách bán hàng và chăm sóc khách hàng", 1, 1,
                "Bảo hiểm, thưởng tháng",
                new Date(2025 - 1900, 0, 21),
                new Date(2025 - 1900, 0, 31)
        );
        existingJob.setId(jobId);

        Job jobDTO = mockJobDTO(
                5000000, 10000000, "Nhân viên bán hàng", null, 1, 1,
                "Bảo hiểm, thưởng tháng",
                new Date(2025 - 1900, 0, 21),
                new Date(2025 - 1900, 0, 31)
        );

        Exception exception = assertThrows(RuntimeException.class,
                () -> jobService.updateJob(jobId, jobDTO));

        assertEquals("Mô tả công việc không được để trống", exception.getMessage());
    }

    @Test
    void UTCID04_UpdateJob_DescriptionIsNull_ShouldThrowException() {
        Long jobId = 1L;
        Job existingJob = mockJobDTO(
                5000000, 10000000, "Nhân viên bán hàng", "Phụ trách bán hàng và chăm sóc khách hàng", 1, 1,
                "Bảo hiểm, thưởng tháng",
                new Date(2025 - 1900, 0, 21),
                new Date(2025 - 1900, 0, 31)
        );
        existingJob.setId(jobId);

        Job jobDTO = mockJobDTO(
                5000000, 10000000, "Nhân viên bán hàng", null, 1, 1,
                "Bảo hiểm, thưởng tháng",
                new Date(2025 - 1900, 0, 21),
                new Date(2025 - 1900, 0, 31)
        );

        Exception exception = assertThrows(RuntimeException.class,
                () -> jobService.updateJob(jobId, jobDTO));

        assertEquals("Mô tả công việc không được để trống", exception.getMessage());
    }

    @Test
    void UTCID05_UpdateJob_TypeIsNull_ShouldThrowException() {
        Long jobId = 1L;
        Job existingJob = mockJobDTO(
                5000000, 10000000, "Nhân viên bán hàng", "Phụ trách bán hàng và chăm sóc khách hàng", 1, 1,
                "Bảo hiểm, thưởng tháng",
                new Date(2025 - 1900, 0, 21),
                new Date(2025 - 1900, 0, 31)
        );
        existingJob.setId(jobId);

        Job jobDTO = mockJobDTO(
                5000000, 10000000, "Nhân viên bán hàng", "Mô tả công việc", null, 1,
                "Bảo hiểm, thưởng tháng",
                new Date(2025 - 1900, 0, 21),
                new Date(2025 - 1900, 0, 31)
        );

        Exception exception = assertThrows(RuntimeException.class,
                () -> jobService.updateJob(jobId, jobDTO));

        assertEquals("Loại công việc không được để trống", exception.getMessage());
    }

    @Test
    void UTCID06_UpdateJob_LevelIsNull_ShouldThrowException() {
        Long jobId = 1L;
        Job existingJob = mockJobDTO(
                5000000, 10000000, "Nhân viên bán hàng", "Phụ trách bán hàng và chăm sóc khách hàng", 1, 1,
                "Bảo hiểm, thưởng tháng",
                new Date(2025 - 1900, 0, 21),
                new Date(2025 - 1900, 0, 31)
        );
        existingJob.setId(jobId);

        Job jobDTO = mockJobDTO(
                5000000, 10000000, "Nhân viên bán hàng", "Mô tả công việc", 1, null,
                "Bảo hiểm, thưởng tháng",
                new Date(2025 - 1900, 0, 21),
                new Date(2025 - 1900, 0, 31)
        );

        Exception exception = assertThrows(RuntimeException.class,
                () -> jobService.updateJob(jobId, jobDTO));

        assertEquals("Cấp bậc không được để trống", exception.getMessage());
    }

    @Test
    void UTCID07_UpdateJob_BenefitsIsNull_ShouldThrowException() {
        Long jobId = 1L;
        Job existingJob = mockJobDTO(
                5000000, 10000000, "Nhân viên bán hàng", "Phụ trách bán hàng và chăm sóc khách hàng", 1, 1,
                "Bảo hiểm, thưởng tháng",
                new Date(2025 - 1900, 0, 21),
                new Date(2025 - 1900, 0, 31)
        );
        existingJob.setId(jobId);

        Job jobDTO = mockJobDTO(
                5000000, 10000000, "Nhân viên bán hàng", "Mô tả công việc", 1, 1,
                null,
                new Date(2025 - 1900, 0, 21),
                new Date(2025 - 1900, 0, 31)
        );

        Exception exception = assertThrows(RuntimeException.class,
                () -> jobService.updateJob(jobId, jobDTO));

        assertEquals("Quyền lợi không được để trống", exception.getMessage());
    }

    @Test
    void UTCID08_UpdateJob_SalaryMinGreaterThanSalaryMax_ShouldThrowException() {
        Long jobId = 1L;
        Job existingJob = mockJobDTO(
                5000000, 10000000, "Nhân viên bán hàng", "Phụ trách bán hàng và chăm sóc khách hàng", 1, 1,
                "Bảo hiểm, thưởng tháng",
                new Date(2025 - 1900, 0, 21),
                new Date(2025 - 1900, 0, 31)
        );
        existingJob.setId(jobId);

        Job jobDTO = mockJobDTO(
                12000000, 10000000, "Nhân viên bán hàng", "Phụ trách bán hàng và chăm sóc khách hàng", 1, 1,
                "Bảo hiểm, thưởng tháng",
                new Date(2025 - 1900, 0, 21),
                new Date(2025 - 1900, 0, 31)
        );

        Exception exception = assertThrows(RuntimeException.class,
                () -> jobService.updateJob(jobId, jobDTO));

        assertEquals("Lương tối đa phải lớn hơn lương tối thiểu", exception.getMessage());
    }

    @Test
    void UTCID09_UpdateJob_SalaryZero_ShouldThrowException() {
        Long jobId = 1L;
        Job existingJob = mockJobDTO(
                5000000, 10000000, "Nhân viên bán hàng", "Phụ trách bán hàng và chăm sóc khách hàng", 1, 1,
                "Bảo hiểm, thưởng tháng",
                new Date(2025 - 1900, 0, 21),
                new Date(2025 - 1900, 0, 31)
        );
        existingJob.setId(jobId);

        Job jobDTO = mockJobDTO(
                0, 10000000, "Nhân viên bán hàng", "Phụ trách bán hàng và chăm sóc khách hàng", 1, 1,
                "Bảo hiểm, thưởng tháng",
                new Date(2025 - 1900, 0, 21),
                new Date(2025 - 1900, 0, 31)
        );

        Exception exception = assertThrows(RuntimeException.class,
                () -> jobService.updateJob(jobId, jobDTO));

        assertEquals("Lương phải là một con số dương", exception.getMessage());
    }
}
