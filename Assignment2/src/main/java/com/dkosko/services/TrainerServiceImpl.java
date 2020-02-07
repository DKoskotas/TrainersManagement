
package com.dkosko.services;

import com.dkosko.dao.TrainerDao;
import com.dkosko.entities.Trainer;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class TrainerServiceImpl implements TrainerService{
    
    @Autowired
    TrainerDao tdao;

    @Override
    public List<Trainer> getAllTrainers() {
       return tdao.findAll(); 
    }

    @Override
    public void createOrUpdateTrainer(Trainer t) {
        tdao.createOrUpdate(t);
    }

    @Override
    public void deleteTrainer(int id) {
        tdao.delete(id);
    }

    @Override
    public Trainer findTrainerById(Integer id) {
        return tdao.findById(id);
    }

    @Override
    public List<Trainer> findTrainersByName(String search) {
       List<Trainer> list = tdao.findTrainerByName(search);
        return list; 
    }

    
    
}
