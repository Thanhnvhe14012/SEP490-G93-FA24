package vn.edu.fpt.quickhire.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.edu.fpt.quickhire.entity.Recruiter;
import vn.edu.fpt.quickhire.entity.Staff;

import java.util.List;

public interface StaffRepository extends JpaRepository<Staff, Long> {
    Staff save(Staff staff);
    Staff findByAccount_Id(Long account_id);
    List<Staff> findAllByRecruiter(Recruiter recruiter);
}
