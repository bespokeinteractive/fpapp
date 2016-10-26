package org.openmrs.module.fpapp.model;

import org.openmrs.Concept;
import java.io.Serializable;

/**
 * @author Dennis Henry
 *         Created on 24th Oct 2016.
 */

public class FamilyPlanningMethods implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer id;
    private Concept concept;
    private FamilyPlanningTypes type;
    private String remarks;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Concept getConcept() {
        return concept;
    }

    public void setConcept(Concept concept) {
        this.concept = concept;
    }

    public FamilyPlanningTypes getType() {
        return type;
    }

    public void setType(FamilyPlanningTypes type) {
        this.type = type;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
}
