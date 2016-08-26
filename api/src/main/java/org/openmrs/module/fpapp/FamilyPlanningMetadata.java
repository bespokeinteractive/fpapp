package org.openmrs.module.fpapp;

import static org.openmrs.module.metadatadeploy.bundle.CoreConstructors.encounterType;

import org.openmrs.module.metadatadeploy.bundle.AbstractMetadataBundle;
import org.springframework.stereotype.Component;

@Component
public class FamilyPlanningMetadata extends AbstractMetadataBundle {

    public static final class _FamilyPlanningEncounterType {
        public static final String FP_NEW_ENCOUNTER_TYPE = "e566627f-6333-4ad4-bd53-82abbd9eb22a";
        public static final String FP_REVISIT_ENCOUNTER_TYPE = "e5bfd413-491e-422c-bf7c-2e1e17319ecd";
    }

    public static final class _FamilyPlanningConcept {
	    public static final String FP_METHODS_CONCEPT = "374AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
	}

    @Override
    public void install() throws Exception {
        install(encounterType("FP New", "FP New Visit", _FamilyPlanningEncounterType.FP_NEW_ENCOUNTER_TYPE));
        install(encounterType("FP Revisit", "FP Revisit", _FamilyPlanningEncounterType.FP_NEW_ENCOUNTER_TYPE));
    }

}
