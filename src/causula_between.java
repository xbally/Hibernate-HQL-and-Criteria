
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import model.Professor;
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
public class causula_between {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws ParseException {
        
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        session.beginTransaction();
        
        Query query = session.createQuery(
        "SELECT DISTINCT p " +
        "FROM Professor p " +
        "WHERE p.dataAdmissao BETWEEN :data1 AND :data2");
        query.setDate("data1",

        new SimpleDateFormat("dd/MM/yyyy"). parse("03/03/2009"));

        query.setDate("data2",new SimpleDateFormat("dd/MM/yyyy").parse("06/06/2009"));

        List<Professor> resultado = query.list();
                
        for(Professor p : resultado){
            System.out.print("Nome do professor = " + p.getNome());
        }
        
        session.getTransaction().commit();
        session.close();
        
    }
    
}
