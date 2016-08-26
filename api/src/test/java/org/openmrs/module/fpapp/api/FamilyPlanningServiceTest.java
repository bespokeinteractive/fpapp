package org.openmrs.module.fpapp.api;

import java.util.Set;

import org.hamcrest.Matchers;
import org.junit.Assert;
import org.junit.Test;
import org.openmrs.Patient;
import org.openmrs.api.context.Context;
import org.openmrs.test.BaseModuleContextSensitiveTest;

public class FamilyPlanningServiceTest extends BaseModuleContextSensitiveTest {

    @Test public void getPreviousMethods_shouldReturnPreviouslyAdministeredFPMethodsForGivenPatient() throws Exception {
        executeDataSet("fp-test-data.xml");
        Patient patient = Context.getPatientService().getPatient(2);

        Set<FamilyPlanningMethod> administeredMethods = Context.getService(FamilyPlanningService.class).getPreviousMethods(patient);
        
        Assert.assertThat(administeredMethods, Matchers.hasSize(2));
    }
}
