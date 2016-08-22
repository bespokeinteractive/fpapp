package org.openmrs.module.fpapp.fragment.controller;

import org.openmrs.ui.framework.fragment.FragmentConfiguration;
import org.openmrs.ui.framework.fragment.FragmentModel;

/**
 * Created by franqq on 8/16/16.
 */
public class FamilyPlanningOptionsFragmentController {
    public void controller(FragmentConfiguration config, FragmentModel model) {
        config.require("queueId");
        model.addAttribute("queueId", config.get("queueId"));
    }
}
