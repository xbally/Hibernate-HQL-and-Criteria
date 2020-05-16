/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author razer
 */
@Entity
@Table(name="tb_sala")
@SequenceGenerator(name="sequence", sequenceName="tb_sala_sala_id_seq")
public class Sala implements Serializable {
    private int id;
    private int numero;
    private boolean arCondicionado;
    private Professor professor;

    @Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="sequence")
    @Column (name="sala_id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name="sala_nr", nullable=false)
    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    @Column(name="sala_ar", nullable=false)
    public boolean isArCondicionado() {
        return arCondicionado;
    }

    public void setArCondicionado(boolean arCondicionado) {
        this.arCondicionado = arCondicionado;
    }

    @OneToOne(  mappedBy="sala", 
                fetch=FetchType.LAZY, 
                cascade=CascadeType.ALL)
    public Professor getProfessor() {
        return professor;
    }

    public void setProfessor(Professor professor) {
        this.professor = professor;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 37 * hash + this.numero;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Sala other = (Sala) obj;
        if (this.numero != other.numero) {
            return false;
        }
        return true;
    }

    public static Sala buscarPorNumero(int n) {
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        
        org.hibernate.Query q = session.createQuery("FROM Sala WHERE numero=:numero");
        q.setInteger("numero", n);
        Sala s = (Sala)q.uniqueResult();
        
        session.getTransaction().commit();
        session.close(); 

        return s;
    }
    
}
