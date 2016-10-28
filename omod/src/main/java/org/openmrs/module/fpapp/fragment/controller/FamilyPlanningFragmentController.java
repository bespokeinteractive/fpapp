package org.openmrs.module.fpapp.fragment.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.openmrs.Concept;
import org.openmrs.ConceptAnswer;
import org.openmrs.Patient;
import org.openmrs.api.context.Context;
import org.openmrs.module.fpapp.FamilyPlanningMetadata;
import org.openmrs.module.fpapp.api.FamilyPlanningMethod;
import org.openmrs.module.fpapp.api.FamilyPlanningService;
import org.openmrs.module.fpapp.model.FamilyPlanningMethods;
import org.openmrs.module.fpapp.model.FamilyPlanningType;
import org.openmrs.module.fpapp.model.FamilyPlanningTypes;
import org.openmrs.ui.framework.SimpleObject;
import org.openmrs.ui.framework.fragment.FragmentConfiguration;
import org.openmrs.ui.framework.fragment.FragmentModel;
import org.openmrs.ui.framework.page.PageModel;

/**
 * Created by franqq on 8/16/16.
 */
public class FamilyPlanningFragmentController {
    FamilyPlanningService fpService = Context.getService(FamilyPlanningService.class);

    public void controller(FragmentConfiguration config,
                           FragmentModel model,
                           PageModel pageModel) {
        Concept fpConcept = Context.getConceptService().getConceptByUuid(FamilyPlanningMetadata._FamilyPlanningConcept.FP_METHODS_CONCEPT);
        List<SimpleObject> fpMethods = new ArrayList<SimpleObject>();
        for (ConceptAnswer answer : fpConcept.getAnswers()) {
            Concept concept = Context.getConceptService().getConcept(answer.getAnswerConcept().getConceptId());
            FamilyPlanningMethods fpMethod = Context.getService(FamilyPlanningService.class).getFamilyPlanningMethodsByConcept(concept);

            SimpleObject method = new SimpleObject();
            method.put("label", answer.getAnswerConcept().getDisplayString().toUpperCase());
            method.put("value", answer.getAnswerConcept().getDisplayString().toUpperCase());
            method.put("id", answer.getAnswerConcept().getUuid());
            method.put("type", fpMethod.getType().getId());
            fpMethods.add(method);
        }
        Patient patient = (Patient)pageModel.get("patient");
        Set<FamilyPlanningMethod> administeredMethods = Context.getService(FamilyPlanningService.class).getPreviousMethods(patient);
        model.addAttribute("fpMethods", fpMethods);
        model.addAttribute("administeredMethods", administeredMethods);

        List<FamilyPlanningTypes> fpTypes = new ArrayList<FamilyPlanningTypes>();
        fpTypes.add(fpService.getFamilyPlanningTypesById(FamilyPlanningType.BARRIER_METHODS.getValue()));
        fpTypes.add(fpService.getFamilyPlanningTypesById(FamilyPlanningType.CONTRACEPTIVES.getValue()));
        fpTypes.add(fpService.getFamilyPlanningTypesById(FamilyPlanningType.INJECTABLES.getValue()));
        fpTypes.add(fpService.getFamilyPlanningTypesById(FamilyPlanningType.NATURAL_METHODS.getValue()));

        List<FamilyPlanningMethods> secondaryMethods = fpService.getFamilyPlanningMethodsByTypes(fpTypes);
        model.addAttribute("secondaryMethods", secondaryMethods);
        model.addAttribute("fptabIncludedInPNC", Context.getAdministrationService().getGlobalProperty("fptab.includedInPNC"));

    }
}