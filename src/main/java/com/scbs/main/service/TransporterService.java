package com.scbs.main.service;

import java.util.List;

import com.scbs.main.model.Transporter;

public interface TransporterService {

	void saveTransporterInfo(Transporter transporter);
	List<Transporter> getAllTraList();
	void deleteTransporterById(Long id);
	Transporter getTransporterById(Long id);
}
