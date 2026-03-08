package com.scbs.main.repostiory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.scbs.main.model.Village;

@Repository
public interface VillageRepository extends JpaRepository<Village, Long> {

}
