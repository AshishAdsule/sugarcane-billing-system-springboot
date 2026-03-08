package com.scbs.main.repostiory;

import org.springframework.data.jpa.repository.JpaRepository;

import com.scbs.main.model.Cultivator;

public interface CultivatorRepository extends JpaRepository<Cultivator, Long>{
	long count();
}
