package org.openmrs.module.fpapp.fragment.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.openmrs.Concept;
import org.openmrs.ConceptAnswer;
import org.openmrs.api.context.Context;
import org.openmrs.module.fpapp.FamilyPlanningMetadata;
import org.openmrs.module.fpapp.api.FamilyPlanningMethod;
import org.openmrs.module.fpapp.api.FamilyPlanningService;
import org.openmrs.ui.framework.SimpleObject;
import org.openmrs.ui.framework.fragment.FragmentConfiguration;
import org.openmrs.ui.framework.fragment.FragmentModel;

/**
 * Created by franqq on 8/16/16.
 */
public class FamilyPlanningFragmentController {
    public void controller(FragmentConfiguration config, FragmentModel model) {
        Concept fpConcept = Context.getConceptService().getConceptByUuid(FamilyPlanningMetadata._FamilyPlanningConcept.FP_METHODS_CONCEPT);
        List<SimpleObject> fpMethods = new ArrayList<SimpleObject>();
        for (ConceptAnswer answer : fpConcept.getAnswers()) {
            SimpleObject method = new SimpleObject();
            method.put("label", answer.getAnswerConcept().getDisplayString());
            method.put("value", answer.getAnswerConcept().getDisplayString());
            method.put("id", answer.getAnswerConcept().getUuid());
            fpMethods.add(method);
        }
        //Set<FamilyPlanningMethod> administeredMethods = Context.getService(FamilyPlanningService.class).getPreviousMethods(patient)
        model.addAttribute("fpMethods", fpMethods);
    }
}
