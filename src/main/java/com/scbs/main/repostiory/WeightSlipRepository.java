package com.scbs.main.repostiory;
import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.scbs.main.model.WeightSlip;
@Repository
public interface WeightSlipRepository extends JpaRepository<WeightSlip, Long> {
	 List<WeightSlip> findByWeightSlipDateBetween(LocalDate startDate, LocalDate endDate);
	 @Query("SELECT SUM(w.netWeight) FROM WeightSlip w")
	 Double getTotalWeight();
}