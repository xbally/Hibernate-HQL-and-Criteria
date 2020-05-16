/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package criteria;

import java.util.List;
import model.Sala;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Restrictions;
import util.HibernateUtil;

/**
 *
 * @author gabri
 */
public class OR {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();

        Criteria criteria = session.createCriteria(Sala.class);
        
        //Restrictions.gt : verifica se um campo é maior a um valor
        Criterion restrNr = Restrictions.gt("numero", 202);
        
        //Restrictions.eq : verifica se um campo é igual a um valor
        Criterion restrAr = Restrictions.eq(
                "arCondicionado", false);

        LogicalExpression restr = Restrictions.or(
                restrNr,
                restrAr);

        criteria.add(restr);
        List<Sala> resultado = criteria.list();

        for (Sala p : resultado) {
            System.out.println(p.getNumero());
        }
        session.getTransaction().commit();
        session.close();

    }

}
