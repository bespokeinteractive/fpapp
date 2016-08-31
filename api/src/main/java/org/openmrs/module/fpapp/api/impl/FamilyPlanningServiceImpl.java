package org.openmrs.module.fpapp.api.impl;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.openmrs.Concept;
import org.openmrs.Encounter;
import org.openmrs.EncounterType;
import org.openmrs.Obs;
import org.openmrs.Patient;
import org.openmrs.Person;
import org.openmrs.api.context.Context;
import org.openmrs.module.fpapp.FamilyPlanningMetadata;
import org.openmrs.module.fpapp.api.FamilyPlanningMethod;
import org.openmrs.module.fpapp.api.FamilyPlanningService;

public class FamilyPlanningServiceImpl implements FamilyPlanningService {

    @Override
    public Set<FamilyPlanningMethod> getPreviousMethods(Patient patient) {
        Concept fpMethodConcept = Context.getConceptService().getConceptByUuid(FamilyPlanningMetadata._FamilyPlanningConcept.FP_METHODS_CONCEPT);
        List<Obs> fpObservations = Context.getObsService().getObservations(
                Arrays.asList((Person)patient),
                null, //encounters
                Arrays.asList(fpMethodConcept), //questions
                null, //answers
                null, //personTypes
                null, //locations
                Arrays.asList("obsDatetime"), //sort
                null, //mostRecentN
                null, //obsGroupId
                null, //fromDate,
                null, //toDate
                false); //includeVoidedObs
        Set<FamilyPlanningMethod> administeredMethods = new HashSet<FamilyPlanningMethod>();
        for(Obs obs : fpObservations) {
            administeredMethods.add(new FamilyPlanningMethod(obs));
        }
        return administeredMethods;
    }

    @Override
    public Integer getNumberOfVisits(Patient patient) {
        EncounterType newFPEncounterType = Context.getEncounterService().getEncounterTypeByUuid(FamilyPlanningMetadata._FamilyPlanningEncounterType.FP_NEW_ENCOUNTER_TYPE);
        EncounterType revisitFPEncounterType = Context.getEncounterService().getEncounterTypeByUuid(FamilyPlanningMetadata._FamilyPlanningEncounterType.FP_REVISIT_ENCOUNTER_TYPE);
        List<Encounter> fpEncounters = Context.getEncounterService().getEncounters(
                patient, //who
                null, //loc
                null, //fromDate
                null, //toDate
                null, //enteredViaForms
                Arrays.asList(newFPEncounterType, revisitFPEncounterType), //encounterTypes
                null, //providers
                null, //visitTypes
                null, //visits
                false); //includeVoided
        return fpEncounters.size();
    }

}
