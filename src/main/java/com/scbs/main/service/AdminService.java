package com.scbs.main.service;

import java.util.List;

import com.scbs.main.model.Admin;

public interface AdminService {

	void saveAdmin(Admin admin);
	List<Admin> getAllAdmin();
	void deleteAdminById(Long id);
	Admin getAdminById(Long id);
	Admin login(String adminName,String password);
}
