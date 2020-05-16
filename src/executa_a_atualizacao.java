
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
public class executa_a_atualizacao {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();

        Query query = session.createQuery(
                "UPDATE Disciplina d "
                + "SET d.cargaHoraria = 100 "
                + "WHERE d.cargaHoraria = 60 ");

        int rows = query.executeUpdate();

        System.out.print(rows);

        session.getTransaction().commit();
        session.close();

    }

}
