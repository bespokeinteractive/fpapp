package org.openmrs.module.fpapp.fragment.controller;

import org.openmrs.Encounter;
import org.openmrs.EncounterType;
import org.openmrs.Patient;
import org.openmrs.api.EncounterService;
import org.openmrs.api.context.Context;
import org.openmrs.module.mchapp.MchMetadata;
import org.openmrs.module.mchapp.api.MchService;
import org.openmrs.module.mchapp.model.TriageDetail;
import org.openmrs.module.mchapp.model.TriageSummary;
import org.openmrs.ui.framework.SimpleObject;
import org.openmrs.ui.framework.UiUtils;
import org.openmrs.ui.framework.fragment.FragmentConfiguration;
import org.openmrs.ui.framework.fragment.FragmentModel;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.List;

/**
 * Created by franqq on 8/27/16.
 */
public class TriageSummaryFragmentController {
    public void controller(FragmentConfiguration config,
                           FragmentModel model,
                           PageModel pageModel) {

        Patient patient = (Patient)pageModel.get("patient");

        MchService mchService = Context.getService(MchService.class);
        EncounterType mchEncType = null;

        mchEncType = Context.getEncounterService().getEncounterTypeByUuid(MchMetadata._MchEncounterType.PNC_TRIAGE_ENCOUNTER_TYPE);
        Collection<EncounterType> encounterTypes = new ArrayList<EncounterType>();
        encounterTypes.add(mchEncType);
        EncounterService encounterService = Context.getEncounterService();
        Calendar now = Calendar.getInstance();
        now.set(Calendar.HOUR_OF_DAY,0);
        Date fromDate = now.getTime();
        Date toDate = new Date();
        List<Encounter> encounters = encounterService.getEncounters(patient,null,fromDate,toDate,null,encounterTypes,null, null, null, false);

        List<TriageSummary> triageSummaries = new ArrayList<TriageSummary>();

        for(Encounter encounter : encounters){
            TriageSummary triageSummary = new TriageSummary();
            triageSummary.setVisitDate(encounter.getDateCreated());
            triageSummary.setEncounterId(encounter.getEncounterId());
            triageSummaries.add(triageSummary);
        }
        model.addAttribute("patient", patient);
        model.addAttribute("triageSummaries", triageSummaries);
    }
    public SimpleObject getTriageSummaryDetails(
            @RequestParam("encounterId") Integer encounterId,
            UiUtils ui
    ){
        Encounter encounter = Context.getEncounterService().getEncounter(encounterId);
        TriageDetail triageDetail = TriageDetail.create(encounter);

        SimpleObject triage = SimpleObject.fromObject(triageDetail, ui, "weight", "height", "temperature", "pulseRate", "systolic", "daistolic", "muac" ,"growthStatus","weightcategory");
        return SimpleObject.create("notes", triage);
    }

}
