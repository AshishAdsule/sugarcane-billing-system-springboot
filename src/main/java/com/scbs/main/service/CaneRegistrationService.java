package com.scbs.main.service;

import java.util.List;
import com.scbs.main.model.CaneRegistration;

public interface CaneRegistrationService {

    void saveRegistration(CaneRegistration registration);

    List<CaneRegistration> getAllRegistrations();

    CaneRegistration getRegistrationById(Long id);

    void deleteRegistrationById(Long id);
}