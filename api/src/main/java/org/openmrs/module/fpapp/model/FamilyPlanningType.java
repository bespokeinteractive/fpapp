package org.openmrs.module.fpapp.model;

/**
 * @author Dennis Henry
 *         Created on 10/26/2016.
 */
public enum FamilyPlanningType {
    BARRIER_METHODS(1),
    CONTRACEPTIVES(2),
    INJECTABLES(3),
    INSERTIONS(4),
    PROCEDURES(5),
    NATURAL_METHODS(6),
    OTHER_METHODS(7);

    private int value;

    private FamilyPlanningType(int value) {
        this.value = value;
    }

    public int getValue() {
        return this.value;
    }

}