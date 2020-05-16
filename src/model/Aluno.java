/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author razer
 */
@Entity
@Table(name="tb_aluno")
@SequenceGenerator(name="sequence", sequenceName="tb_aluno_aluno_id_seq")
public class Aluno implements Serializable {
    private int id;
    private String cpf;
    private String nome;
    private List<Disciplina> disciplinas;

    @Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="sequence")
    @Column (name="aluno_id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name="aluno_cpf", length=11, nullable=false)
    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    
    @Column(name="aluno_nm", length=50, nullable=false)
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    @ManyToMany(mappedBy="alunos")
    public List<Disciplina> getDisciplinas() {
        return disciplinas;
    }

    public void setDisciplinas(List<Disciplina> disciplinas) {
        this.disciplinas = disciplinas;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 71 * hash + Objects.hashCode(this.cpf);
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
        final Aluno other = (Aluno) obj;
        if (!Objects.equals(this.cpf, other.cpf)) {
            return false;
        }
        return true;
    }
   
    public static Aluno buscarPorCPF(String cpf) {
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        
        org.hibernate.Query q = session.createQuery("FROM Aluno WHERE cpf=:cpf");
        q.setString("cpf", cpf);
        Aluno a = (Aluno)q.uniqueResult();
        
        session.getTransaction().commit();
        session.close(); 

        return a;
    }
    

}
