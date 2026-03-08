package com.scbs.main.repostiory;

import org.springframework.data.jpa.repository.JpaRepository;
import com.scbs.main.model.CaneRegistration;

public interface CaneRegistrationRepository 
        extends JpaRepository<CaneRegistration, Long> {

}