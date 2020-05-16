/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author razer
 */
@Entity
@Table(name="tb_disciplina")
@SequenceGenerator(name="sequence", sequenceName="tb_disciplina_disc_id_seq")
public class Disciplina implements Serializable {
    private int id;
    private String codigo;
    private String nome;
    private int cargaHoraria;
    private Professor professor;
    private List<Aluno> alunos;

    @Id
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="sequence")
    @Column (name="disc_id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name="disc_cod", length=5, nullable=false)
    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    @Column(name="disc_nm", length=50, nullable=false)
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    @Column(name="disc_carga", nullable=false)
    public int getCargaHoraria() {
        return cargaHoraria;
    }

    public void setCargaHoraria(int cargaHoraria) {
        this.cargaHoraria = cargaHoraria;
    }

    @ManyToOne
    @JoinColumn(name="prof_id")
    public Professor getProfessor() {
        return professor;
    }

    public void setProfessor(Professor professor) {
        this.professor = professor;
    }

    @ManyToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY)
    @JoinTable( name="tb_disciplina_aluno", 
                joinColumns={@JoinColumn(name="disc_id")},
                inverseJoinColumns={@JoinColumn(name="aluno_id")})
    public List<Aluno> getAlunos() {
        return alunos;
    }

    public void setAlunos(List<Aluno> alunos) {
        this.alunos = alunos;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 11 * hash + Objects.hashCode(this.codigo);
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
        final Disciplina other = (Disciplina) obj;
        if (!Objects.equals(this.codigo, other.codigo)) {
            return false;
        }
        return true;
    }

    public static Disciplina buscarPorCodigo(String cod) {
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        
        org.hibernate.Query q = session.createQuery("FROM Disciplina WHERE codigo=:codigo");
        q.setString("codigo", cod);
        Disciplina d = (Disciplina)q.uniqueResult();
        
        session.getTransaction().commit();
        session.close(); 

        return d;
    }

}
