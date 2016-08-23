package org.openmrs.module.fpapp.page.controller;

import org.openmrs.Patient;
import org.openmrs.api.context.Context;
import org.openmrs.module.hospitalcore.HospitalCoreService;
import org.openmrs.module.hospitalcore.model.PatientSearch;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

/**
 * Created by franqq on 8/16/16.
 */
public class MainPageController {
    public void get(
            @RequestParam("patientId") Patient patient,
            @RequestParam("queueId") Integer queueId,
            PageModel model) {

        model.addAttribute("patient", patient);
        model.addAttribute("queueId", queueId);

        if (patient.getGender().equals("M")) {
            model.addAttribute("gender", "Male");
        } else {
            model.addAttribute("gender", "Female");
        }

        HospitalCoreService hospitalCoreService = Context.getService(HospitalCoreService.class);
        PatientSearch patientSearch = hospitalCoreService.getPatientByPatientId(patient.getPatientId());

        String patientType = hospitalCoreService.getPatientType(patient);

        model.addAttribute("patientType", patientType);
        model.addAttribute("patientSearch", patientSearch);
        model.addAttribute("previousVisit", hospitalCoreService.getLastVisitTime(patient));
        model.addAttribute("patientCategory", patient.getAttribute(14));

        model.addAttribute("patientId", patient.getPatientId());
        model.addAttribute("date", new Date());
    }
}
