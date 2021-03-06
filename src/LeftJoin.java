
import java.util.List;
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
public class LeftJoin {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        session.beginTransaction();

        Query query = session.createQuery(
                "SELECT p.nome, d.nome "
                + "FROM Professor p LEFT JOIN p.disciplinas d");
        List<Object[]> resultado = query.list();

        for (Object[] o : resultado) {
            System.out.print(o[0] + " - " + o[1]);
        }

        session.getTransaction().commit();
        session.close();
    }

}
