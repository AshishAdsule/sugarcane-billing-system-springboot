package com.scbs.main.repostiory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.scbs.main.model.Cane;

@Repository
public interface CaneRepository extends JpaRepository<Cane, Long> {

}
