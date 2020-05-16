
import model.Disciplina;
import org.hibernate.Query;
import org.hibernate.Session;
import util.HibernateUtil;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author gabri
 */
public class causula_where_com_parametro_nomeado {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        session.beginTransaction();
        
        Query query = session.createQuery("FROM Disciplina WHERE nome = :nnn");
        query.setString("nnn", "Linguagem Java II");
        Disciplina resultado = (Disciplina) query.uniqueResult();
        System.out.print(resultado.getNome());
        session.getTransaction().commit();
        session.close();
        
    }
    
}
