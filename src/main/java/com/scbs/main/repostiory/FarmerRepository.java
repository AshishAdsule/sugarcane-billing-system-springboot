package com.scbs.main.repostiory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.scbs.main.model.Farmer;

@Repository
public interface FarmerRepository extends JpaRepository<Farmer, Long> {

}
