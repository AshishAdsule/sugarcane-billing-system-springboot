package com.scbs.main.service;

import java.time.LocalDate;
import java.util.List;
import com.scbs.main.model.WeightSlip;

public interface WeightSlipService {

	Double getTotWeight();
    void saveWeightSlip(WeightSlip weightSlip);

    List<WeightSlip> getAllWeightSlips();

    WeightSlip getWeightSlipById(Long id);

    void deleteWeightSlip(Long id);
    public List<WeightSlip> getWeightSlipsBetweenDates(LocalDate startDate, LocalDate endDate);
}