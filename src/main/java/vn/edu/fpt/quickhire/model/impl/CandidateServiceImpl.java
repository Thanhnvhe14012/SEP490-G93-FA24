package vn.edu.fpt.quickhire.model.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.edu.fpt.quickhire.entity.Candidate;
import vn.edu.fpt.quickhire.model.CandidateService;
import vn.edu.fpt.quickhire.model.repository.CandidateRepository;

import java.util.Optional;

@Service
public class CandidateServiceImpl implements CandidateService {

    @Autowired
    CandidateRepository candidateRepository;

    @Override
    public Candidate save(Candidate candidate) {
        return candidateRepository.save(candidate);
    }

    @Override
    public Optional<Candidate> findById(long id) {
        return candidateRepository.findById(id);
    }

//    @Override
//    public Candidate findByAccountId(long id) {
//        return candidateRepository.findByAccount_Id(id);
//    }

}
