
package com.dkosko.dao;

import com.dkosko.entities.Trainer;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class TrainerDaoImpl implements TrainerDao{
    
    @Autowired
    private SessionFactory sessionFactory;

    private Session getSession(){
        return sessionFactory.getCurrentSession();
    }
    
    @Override
    public List<Trainer> findAll(){
        Query q = getSession().createQuery("SELECT t FROM Trainer t");
        List<Trainer> list = q.getResultList();
        return list;
    }

    @Override
    public void createOrUpdate(Trainer t) {
        getSession().saveOrUpdate(t);
    }

    @Override
    public void delete(int id) {
        Trainer t = getSession().find(Trainer.class, id);
        getSession().delete(t);
    }

    @Override
    public Trainer findById(Integer id) {
        return (Trainer)getSession().get(Trainer.class, id);
    }

    @Override
    public List<Trainer> findTrainerByName(String search) {
        Query q = getSession().createNamedQuery("Trainer.findLikeName");
        System.out.println("OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
        q.setParameter("name","%"+ search +"%");
        List<Trainer> list = q.getResultList();
        return list;
    }
    
}
