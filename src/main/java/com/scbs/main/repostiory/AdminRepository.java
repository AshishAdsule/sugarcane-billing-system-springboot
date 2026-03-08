package com.scbs.main.repostiory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.scbs.main.model.Admin;

@Repository
public interface AdminRepository extends JpaRepository<Admin, Long>{

	Admin findByAdminName(String adminName);
}
