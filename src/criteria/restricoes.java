/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package criteria;

import java.util.List;
import model.Aluno;
import model.Disciplina;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import util.HibernateUtil;

/**
 *
 * @author gabri
 */
public class restricoes {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        
        
        Criteria criteria = session.createCriteria(Disciplina.class);
        criteria.add(Restrictions.gt("cargaHoraria", 40));
        List<Disciplina> lista = criteria.list();
        
        
        for (Disciplina p : lista) {
            System.out.println(p.getNome());
        }
        session.getTransaction().commit();
        session.close();
    }
    
}
