
package com.dkosko.services;

import com.dkosko.entities.Trainer;
import java.util.List;


public interface TrainerService {

    public List<Trainer> getAllTrainers();

    public void createOrUpdateTrainer(Trainer t);

    public void deleteTrainer(int id);

    public Trainer findTrainerById(Integer id);

    public List<Trainer> findTrainersByName(String search);

    
    
}
