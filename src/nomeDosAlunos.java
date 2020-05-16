/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.util.List;
import javax.servlet.http.*;
import javax.*;
import model.Aluno;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import util.HibernateUtil;

/**
 *
 * @author gabri
 */
public class nomeDosAlunos {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();

        Query query = session.createQuery("FROM Aluno");
        List<Aluno> resultado = query.list();
        for (Aluno o : resultado) {
            System.out.println(o.getNome());
        }
        session.getTransaction().commit();
        session.close();

    }

}
