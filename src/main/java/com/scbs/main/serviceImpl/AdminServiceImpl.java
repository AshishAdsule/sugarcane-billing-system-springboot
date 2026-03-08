package com.scbs.main.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scbs.main.model.Admin;
import com.scbs.main.repostiory.AdminRepository;
import com.scbs.main.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminRepository adminRepo;
	
	@Override
	public void saveAdmin(Admin admin) {
		adminRepo.save(admin);
	}

	@Override
	public List<Admin> getAllAdmin() {
		// TODO Auto-generated method stub
		return adminRepo.findAll();
	}

	@Override
	public void deleteAdminById(Long id) {
		adminRepo.deleteById(id);
	}

	@Override
	public Admin getAdminById(Long id) {
		// TODO Auto-generated method stub
		return adminRepo.findById(id).orElse(null);
	}

	@Override
	public Admin login(String adminName, String password) {
		Admin admin=adminRepo.findByAdminName(adminName);
		if(admin !=null && admin.getAdminPassword().equals(password))
		{
			return admin;
		}
		return null;
	}

}
