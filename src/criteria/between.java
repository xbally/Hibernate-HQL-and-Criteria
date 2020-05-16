/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package criteria;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Professor;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import util.HibernateUtil;

/**
 *
 * @author gabri
 */
public class between {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();

        //1 between 

        /*  Criteria criteria = session.createCriteria(Professor.class);
        try {
            criteria.add( Restrictions.between("dataAdmissao",
                    new SimpleDateFormat("dd/MM/yyyy").parse("03/03/2009"),
                    new SimpleDateFormat("dd/MM/yyyy").parse("04/04/2009") ) );
        } catch (ParseException ex) {
            Logger.getLogger(between.class.getName()).log(Level.SEVERE, null, ex);
        }
        List<Professor> lista = criteria.list();

         */
        //2 between 
        /*  Criteria criteria = session.createCriteria(Professor.class);
        criteria.add(Restrictions.isNull("dataAdmissao"));
        List<Professor> lista = criteria.list();
         */
        Criteria criteria = session.createCriteria(Professor.class);
        criteria.add(Restrictions.isNotNull("dataAdmissao"));
        List<Professor> lista = criteria.list();
        
        for (Professor p : lista) {
            System.out.println(p.getNome());
        }
        session.getTransaction().commit();
        session.close();
    }

}
