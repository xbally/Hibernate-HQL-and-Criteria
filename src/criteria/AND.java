/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package criteria;

import java.util.List;
import model.Disciplina;
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
public class AND {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();

        Criteria criteria = session.createCriteria(
                Disciplina.class);

        Criterion restrNome = Restrictions.like(
                "nome", "Linguagem Java%");
        Criterion restrCarga = Restrictions.eq("cargaHoraria", 60);
        LogicalExpression restr = Restrictions.and(
                restrNome,
                restrCarga);

        criteria.add(restr);
        List<Disciplina> resultado = criteria.list();

        for (Disciplina p : resultado) {
            System.out.println(p.getNome());
        }
        session.getTransaction().commit();
        session.close();
    }

}
