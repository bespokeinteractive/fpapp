package org.openmrs.module.fpapp.api;

import java.util.List;
import java.util.Set;

import org.openmrs.Concept;
import org.openmrs.Patient;
import org.openmrs.api.OpenmrsService;
import org.openmrs.module.fpapp.model.FamilyPlanningMethods;
import org.openmrs.module.fpapp.model.FamilyPlanningTypes;

public interface FamilyPlanningService extends OpenmrsService {
    Set<FamilyPlanningMethod> getPreviousMethods(Patient patient);
    Integer getNumberOfVisits(Patient patient);

    FamilyPlanningMethods getFamilyPlanningMethodsByConcept(Concept concept);
    FamilyPlanningTypes getFamilyPlanningTypesById(Integer id);

    List<FamilyPlanningMethods> getFamilyPlanningMethods();
    List<FamilyPlanningMethods> getFamilyPlanningMethods(List<Concept> conceptList);
    List<FamilyPlanningMethods> getFamilyPlanningMethodsByTypes(List<FamilyPlanningTypes> typeList);
}
