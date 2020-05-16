
import java.util.List;
import model.Disciplina;
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
public class max {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        
        Query query = session.createQuery("SELECT max(d.cargaHoraria) as cargaHoraria FROM Disciplina d");
        
                List<Disciplina> resultado = query.list();

        for(Disciplina o : resultado){
            System.out.println(o.getCargaHoraria());
        }
        session.getTransaction().commit();
        session.close();
    }
    
}
