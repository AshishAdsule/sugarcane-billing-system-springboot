package com.scbs.main.service;

import java.util.List;
import com.scbs.main.model.CaneCutSlip;

public interface CaneCutSlipService {

    void saveCaneCut(CaneCutSlip caneCut);
    List<CaneCutSlip> getAllCaneCut();
    void deleteCaneCut(Long id);
    CaneCutSlip getCaneCutById(Long id);
    long countCutSlips();
}