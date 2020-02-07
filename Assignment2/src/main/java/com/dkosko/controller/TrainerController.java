
package com.dkosko.controller;

import com.dkosko.entities.Trainer;
import com.dkosko.services.TrainerService;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/trainer")
public class TrainerController {
    
    @Autowired
    TrainerService service;
    
    @GetMapping("/list")
    public String showTrainers(Model m){
        List<Trainer> list = service.getAllTrainers();
        m.addAttribute("listOfTrainer", list);
        return "listTrainer";
    }
    
    @RequestMapping(value = "/create" , method = RequestMethod.GET)
    public String showForm(@ModelAttribute("trainer") Trainer t){
        return "formTrainer";
    }
    
    @PostMapping("/create")
    public String createOrUpdateProduct(@Valid Trainer t, BindingResult result){
        if(result.hasErrors()){
            return "formTrainer";
        }
        service.createOrUpdateTrainer(t);
        return "redirect:/trainer/list";
    }
    
    @GetMapping("/delete")
    public String deleteTrainer(@RequestParam("trainerId") int id){
        service.deleteTrainer(id);
        return "redirect:/trainer/list";
    }
    
    @GetMapping("/update")
    public String showUpdateForm (@RequestParam("trainerId") Integer id, Model model){
        Trainer t = service.findTrainerById(id);
        model.addAttribute("trainer", t);
        return "formTrainer";
    }
    
    @GetMapping("/search")
    public String showTrainersByName(@RequestParam("search")String search, Model model){
        List<Trainer> list = service.findTrainersByName(search);
        model.addAttribute("listOfTrainer", list);
        return "listTrainer";
        
    }
}
