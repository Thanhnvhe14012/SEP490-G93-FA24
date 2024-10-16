package vn.edu.fpt.quickhire.model;

import vn.edu.fpt.quickhire.entity.Handbook;

import java.util.List;

public interface HandbookService {
    Handbook saveHandbook(Handbook handbook);
    Handbook findHandbookById(long id);
    List<Handbook> findAllHandbooks();
}
