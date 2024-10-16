package vn.edu.fpt.quickhire.model.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.edu.fpt.quickhire.entity.Handbook;
import vn.edu.fpt.quickhire.model.HandbookService;
import vn.edu.fpt.quickhire.model.repository.AccountRepository;
import vn.edu.fpt.quickhire.model.repository.HandbookRepository;

import java.util.List;

@Service
public class HandbookServiceImpl implements HandbookService {

    @Autowired
    HandbookRepository handbookRepository;

    @Override
    public Handbook saveHandbook(Handbook handbook) { return handbookRepository.save(handbook); }

    @Override
    public Handbook findHandbookById(long id) { return handbookRepository.findById(id); }

    @Override
    public List<Handbook> findAllHandbooks() { return handbookRepository.findAll(); }
}
