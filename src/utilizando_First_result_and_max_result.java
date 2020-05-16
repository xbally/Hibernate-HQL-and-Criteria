
import java.util.List;
import model.Aluno;
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
public class utilizando_First_result_and_max_result {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        
        Query query = session.createQuery("FROM Aluno");
        query.setFirstResult(20);
        query.setMaxResults(10);
        List<Aluno> resultado = query.list();
        for (Aluno o : resultado) {
            System.out.println(o.getNome());
        }
        session.getTransaction().commit();
        session.close();


    }
    
}
