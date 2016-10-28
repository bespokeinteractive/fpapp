package org.openmrs.module.fpapp.db.hibernate;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.openmrs.Concept;
import org.openmrs.api.db.DAOException;
import org.openmrs.module.fpapp.db.FamilyPlanningCommoditiesDAO;
import org.openmrs.module.fpapp.model.FamilyPlanningMethods;
import org.openmrs.module.fpapp.model.FamilyPlanningTypes;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * @author Dennis Henry
 *         Created on 19th Oct 2016.
 */

public class HibernateFamilyPlanningCommoditiesDAO implements FamilyPlanningCommoditiesDAO {
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    SimpleDateFormat formatterExt = new SimpleDateFormat("dd/MM/yyyy");
    protected final Log log = LogFactory.getLog(getClass());

    /**
     * Hibernate session factory
     */
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) throws DAOException {
        this.sessionFactory = sessionFactory;
    }

    /**
     * @return the sessionFactory
     */
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public FamilyPlanningMethods getFamilyPlanningMethodsByConcept(Concept concept) {
        Criteria criteria = getSession().createCriteria(FamilyPlanningMethods.class);
        criteria.add(Restrictions.eq("concept", concept));

        FamilyPlanningMethods fpMethods = (FamilyPlanningMethods) criteria.uniqueResult();
        return fpMethods;
    }

    @Override
    public FamilyPlanningTypes getFamilyPlanningTypesById(Integer id) {
        Criteria criteria = getSession().createCriteria(FamilyPlanningTypes.class);
        criteria.add(Restrictions.eq("id", id));
        return (FamilyPlanningTypes) criteria.uniqueResult();
    }

    @Override
    public List<FamilyPlanningMethods> getFamilyPlanningMethods() {
        Criteria criteria = getSession().createCriteria(FamilyPlanningMethods.class);
        List list = criteria.list();
        return list;
    }

    @Override
    public List<FamilyPlanningMethods> getFamilyPlanningMethods(List<Concept> conceptList) {
        Criteria criteria = getSession().createCriteria(FamilyPlanningMethods.class);
        criteria.add(Restrictions.in("concept", conceptList));
        List list = criteria.list();
        return list;
    }

    @Override
    public List<FamilyPlanningMethods> getFamilyPlanningMethodsByTypes(List<FamilyPlanningTypes> typeList) {
        Criteria criteria = getSession().createCriteria(FamilyPlanningMethods.class);
        criteria.add(Restrictions.in("type", typeList));
        List list = criteria.list();
        return list;
    }
}
