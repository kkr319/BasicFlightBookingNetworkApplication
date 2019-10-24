/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessions;

import hibernate.Routes;
import java.sql.Array;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateful;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Ke
 */
@Stateful
public class customerBusiness {
    
    //For searching all active routes by using "from" and "to" airports
    public List<Routes> csSearch(String fromap, String toap) {
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();

        String query = "SELECT r FROM Routes r where r.fromap = ? AND r.toap = ? AND r.activestatus = '1'";
        Query dBquery = session.createQuery(query);
        dBquery.setParameter(0, fromap);//set username variabl
        dBquery.setParameter(1, toap);
        List<Routes> list = dBquery.list();
        
        for (Routes f : list) {
            System.out.println("**********" + f.getAirline() + "*****" + f.getFromap() + "******" + f.getToap());
        }
        return list;
    }
}
