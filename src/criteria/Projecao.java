/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package criteria;

import model.Aluno;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;
import util.HibernateUtil;

/**
 *
 * @author gabri
 */
public class Projecao {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        
        Criteria criteria = session.createCriteria(Aluno.class);
        
        criteria.setProjection(Projections.rowCount());
        
        Long r = (Long) criteria.uniqueResult();
        
        System.out.print(r);
        
        session.getTransaction().commit();
        session.clear();

    }
    
}
