/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package criteria;

import java.util.List;
import model.Aluno;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import util.HibernateUtil;

/**
 *
 * @author gabri
 */
public class ordenacao {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();

        Criteria criteria = session.createCriteria(Aluno.class);
        criteria.addOrder(Order.asc("nome"));
        List<Aluno> aluno = criteria.list();
        for (Aluno p : aluno) {

            System.out.println(p.getNome());
        }

        session.getTransaction().commit();
        session.close();

    }

}
