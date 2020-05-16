/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package criteria;

import model.Disciplina;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import util.HibernateUtil;

/**
 *
 * @author gabri
 */
public class Projecao2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();   
    
        Criteria criteria = session.createCriteria(Disciplina.class);
        
        ProjectionList proj = Projections.projectionList();
       
        
        proj.add(Projections.min("cargaHoraria"));
        proj.add(Projections.max("cargaHoraria"));
        
        criteria.setProjection(proj);
        
        Object[] dados = (Object[])criteria.uniqueResult();
        
        System.out.println( dados[0] + " - " + dados[1] );
        
        session.getTransaction().commit();
        session.close();
    }
    
    
    
    
}
