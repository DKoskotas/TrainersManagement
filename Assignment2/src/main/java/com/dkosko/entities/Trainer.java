
package com.dkosko.entities;

import java.io.Serializable;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;


@Entity(name = "Trainer")
@Table(name = "trainer")
@NamedQueries(
@NamedQuery(name = "Trainer.findLikeName", query = "SELECT t FROM Trainer t WHERE t.lastName LIKE :name")
)
public class Trainer implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "trainerid")
    private int trainerid;
    @Column(name = "firstname")
    @NotEmpty(message = "First name must be filled")
    private String firstName;
    @Column(name = "lastname")
    @NotEmpty(message = "Last name must be filled")
    private String lastName;
    @Column(name = "tsubject")
    @NotEmpty(message = "Subject must be filled")
    private String tSubject;

    public Trainer() {
    }

    public Trainer(int trainerid, String fistName, String lastName, String tSubject) {
        this.trainerid = trainerid;
        this.firstName = fistName;
        this.lastName = lastName;
        this.tSubject = tSubject;
    }

    public Trainer(String fistName, String lastName, String tSubject) {
        this.firstName = fistName;
        this.lastName = lastName;
        this.tSubject = tSubject;
    }

    public int getTrainerid() {
        return trainerid;
    }

    public void setTrainerid(int trainerid) {
        this.trainerid = trainerid;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String gettSubject() {
        return tSubject;
    }

    public void settSubject(String tSubject) {
        this.tSubject = tSubject;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 67 * hash + this.trainerid;
        hash = 67 * hash + Objects.hashCode(this.firstName);
        hash = 67 * hash + Objects.hashCode(this.lastName);
        hash = 67 * hash + Objects.hashCode(this.tSubject);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Trainer other = (Trainer) obj;
        if (this.trainerid != other.trainerid) {
            return false;
        }
        if (!Objects.equals(this.firstName, other.firstName)) {
            return false;
        }
        if (!Objects.equals(this.lastName, other.lastName)) {
            return false;
        }
        if (!Objects.equals(this.tSubject, other.tSubject)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Trainer{" + "trainerid=" + trainerid + ", firstName=" + firstName + ", lastName=" + lastName + ", tSubject=" + tSubject + '}';
    }

    
    
}
