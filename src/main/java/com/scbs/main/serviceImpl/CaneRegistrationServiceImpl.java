package com.scbs.main.serviceImpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scbs.main.model.CaneRegistration;
import com.scbs.main.repostiory.CaneRegistrationRepository;
import com.scbs.main.service.CaneRegistrationService;

@Service
public class CaneRegistrationServiceImpl  implements CaneRegistrationService {

    @Autowired
    private CaneRegistrationRepository registrationRepository;

    @Override
    public List<CaneRegistration> getAllRegistrations() {
        return registrationRepository.findAll();
    }

    @Override
    public CaneRegistration getRegistrationById(Long id) {
        return registrationRepository.findById(id).orElse(null);
    }

    @Override
    public void deleteRegistrationById(Long id) {
        registrationRepository.deleteById(id);
    }

	@Override
	public void saveRegistration(CaneRegistration registration) {
		 registrationRepository.save(registration);
	}
}