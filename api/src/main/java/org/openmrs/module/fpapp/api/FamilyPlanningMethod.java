package org.openmrs.module.fpapp.api;

import org.openmrs.Obs;

public class FamilyPlanningMethod {

    public FamilyPlanningMethod(Obs obs) {
        method = obs.getValueCoded().getDisplayString();
        comment = obs.getComment() == null ? "--" : obs.getComment();
    }

    private String method;
    private String comment;

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this) return true;
        if (!(o instanceof FamilyPlanningMethod)) {
            return false;
        }
        
        FamilyPlanningMethod fpMethod = (FamilyPlanningMethod) o;
        return fpMethod.method.equalsIgnoreCase(method);
    }

    @Override
    public int hashCode() {
        int result = 17;
        result = 31 * result + method.hashCode();
        return result;
    }
}
