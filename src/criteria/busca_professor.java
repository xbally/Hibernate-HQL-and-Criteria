/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package criteria;

import java.util.List;
import model.Professor;
import org.hibernate.Criteria;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author gabri
 */
public class busca_professor {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        
        
        Criteria criteria = session.createCriteria(Professor.class);
        List<Professor> lista = criteria.list();
        
        for(Professor p :lista){
            
            System.out.print(p.getNome());
        }
        
        session.getTransaction().commit();
        session.close();
    }
    
}
