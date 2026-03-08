package com.scbs.main.repostiory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.scbs.main.model.Water;

@Repository
public interface WaterRepository extends JpaRepository<Water, Long>{

}
