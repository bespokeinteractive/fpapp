package org.openmrs.module.fpapp.api;

import java.util.Set;

import org.openmrs.Patient;

public interface FamilyPlanningService {

    Set<FamilyPlanningMethod> getPreviousMethods(Patient patient);

}
