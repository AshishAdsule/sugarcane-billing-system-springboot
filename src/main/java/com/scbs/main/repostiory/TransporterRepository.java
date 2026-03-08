package com.scbs.main.repostiory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.scbs.main.model.Transporter;

@Repository
public interface TransporterRepository extends JpaRepository<Transporter, Long>{

}
