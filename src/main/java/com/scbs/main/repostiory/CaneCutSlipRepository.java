package com.scbs.main.repostiory;

import org.springframework.data.jpa.repository.JpaRepository;
import com.scbs.main.model.CaneCutSlip;

public interface CaneCutSlipRepository extends JpaRepository<CaneCutSlip, Long> {

	long count();
}