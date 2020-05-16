/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author razer
 */
@Entity
@Table(name="tb_professor")
@SequenceGenerator(name="sequence", sequenceName="tb_professor_prof_id_seq")
public class Professor implements Serializable {
    private int id;
    private String cpf;
    private String nome;
    private double salario;
    private Date dataAdmissao;
    private Sala sala;
    private List<Disciplina> disciplinas;

    @Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="sequence")
    @Column (name="prof_id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name="prof_cpf", length=11, nullable=false)
    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    @Column(name="prof_nm", length=50, nullable=false)
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    @Column(name="prof_salario", nullable=false)
    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="prof_dt")
    public Date getDataAdmissao() {
        return dataAdmissao;
    }

    public void setDataAdmissao(Date dataAdmissao) {
        this.dataAdmissao = dataAdmissao;
    }

    @OneToOne(fetch=FetchType.LAZY, cascade=CascadeType.ALL)
    @JoinColumn(name="sala_id")
    public Sala getSala() {
        return sala;
    }

    public void setSala(Sala sala) {
        this.sala = sala;
    }

    @OneToMany( mappedBy="professor", 
                cascade=CascadeType.ALL, 
                fetch=FetchType.LAZY)
    public List<Disciplina> getDisciplinas() {
        return disciplinas;
    }

    public void setDisciplinas(List<Disciplina> disciplinas) {
        this.disciplinas = disciplinas;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 97 * hash + Objects.hashCode(this.cpf);
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
        final Professor other = (Professor) obj;
        if (!Objects.equals(this.cpf, other.cpf)) {
            return false;
        }
        return true;
    }
        
    public static Professor buscarPorCPF(String cpf) {
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        
        org.hibernate.Query q = session.createQuery("FROM Professor WHERE cpf=:cpf");
        q.setString("cpf", cpf);
        Professor p = (Professor)q.uniqueResult();
        
        session.getTransaction().commit();
        session.close(); 

        return p;
    }
    
    
}
