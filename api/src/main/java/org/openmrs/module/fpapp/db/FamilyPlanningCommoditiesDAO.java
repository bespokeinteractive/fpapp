package org.openmrs.module.fpapp.db;

import org.openmrs.module.fpapp.model.FamilyPlanningMethods;
import org.openmrs.Concept;
import java.util.List;

/**
 * @author Dennis Henry
 *         Created on 19th Oct 2016.
 *         Interface that declares the functionalities to be implemented by the implementing class that enters into a contract with it
 */
public interface FamilyPlanningCommoditiesDAO {
    FamilyPlanningMethods getFamilyPlanningMethodsByConcept(Concept concept);
    List<FamilyPlanningMethods> getFamilyPlanningMethods();
}
