package org.openmrs.module.fpapp.page.controller;

import java.text.ParseException;
import java.util.Date;

import org.openmrs.Encounter;
import org.openmrs.Patient;
import org.openmrs.api.context.Context;
import org.openmrs.module.appui.UiSessionContext;
import org.openmrs.module.fpapp.FamilyPlanningMetadata;
import org.openmrs.module.hospitalcore.HospitalCoreService;
import org.openmrs.module.hospitalcore.PatientQueueService;
import org.openmrs.module.hospitalcore.model.OpdPatientQueue;
import org.openmrs.module.mchapp.api.MchService;
import org.openmrs.module.mchapp.api.model.ClinicalForm;
import org.openmrs.module.mchapp.api.parsers.QueueLogs;
import org.openmrs.ui.framework.UiUtils;
import org.openmrs.ui.framework.page.PageModel;
import org.openmrs.ui.framework.page.PageRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by franqq on 8/16/16.
 */
public class MainPageController {
    protected Logger log = LoggerFactory.getLogger(MainPageController.class);
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

        model.addAttribute("previousVisit", hospitalCoreService.getLastVisitTime(patient));
        model.addAttribute("patientCategory", patient.getAttribute(14));

        model.addAttribute("date", new Date());

        MchService mchService = Context.getService(MchService.class);
        boolean enrolledInPNC = mchService.enrolledInPNC(patient);
        model.addAttribute("enrolledInPNC",enrolledInPNC);
    }

    public String post(
            @RequestParam("patientId") Patient patient, 
            @RequestParam("queueId") Integer queueId, 
            PageRequest request, 
            UiSessionContext session, 
            UiUtils ui) {
        try {
            OpdPatientQueue patientQueue = Context.getService(PatientQueueService.class).getOpdPatientQueueById(queueId);
            ClinicalForm form = ClinicalForm.generateForm(request.getRequest(), patient, null);
            //Set this based on count of previous FP encounters
            String encounterType = FamilyPlanningMetadata._FamilyPlanningEncounterType.FP_NEW_ENCOUNTER_TYPE;
            Encounter encounter = Context.getService(MchService.class).saveMchEncounter(form, encounterType, session.getSessionLocation());
            QueueLogs.logOpdPatient(patientQueue, encounter);
        } catch (ParseException e) {
            log.error(e.getMessage());
            return null;
        }
        return "redirect:" + ui.pageLinkWithoutContextPath("patientqueueapp", "mchClinicQueue", null);
    }
}
