/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessions;

import hibernate.Traveller;
import java.io.IOException;
import static java.lang.ProcessBuilder.Redirect.to;
import java.util.List;
import java.util.Properties;
import javax.ejb.Stateful;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.*;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import static jdk.nashorn.internal.objects.NativeJava.to;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Ke
 */
@Stateful

public class cusInfo {

    private static String USER_NAME = "lab3hotel321";  // GMail user name (just the part before "@gmail.com")
    private static String PASSWORD = "FRSPayment123"; // GMail password

    //Filling traverller table with data
    public String cusInfoAdd(String name, String passnum, String email, String phonenum, String aline, String fcity, String tcity, String date, int routeid, int children, int infant) {
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();
        Transaction tr = session.beginTransaction();
        Traveller traveller = new Traveller(name, passnum, email, phonenum, aline, fcity, tcity, date, routeid, children, infant);
        session.save(traveller);
        tr.commit();
        session.close();
        return "yes";
    }

    public String sendemail(String toemail, String body) {

        String subject = "FRS Ticket Booking";
        String[] to = {toemail};
        Properties props = System.getProperties();
        String host = "smtp.gmail.com";
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", "lab3hotel321@gmail.com");
        props.put("mail.smtp.password", toemail);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        javax.mail.Session mailSession = javax.mail.Session.getDefaultInstance(props, null);
        MimeMessage mailMessage = new MimeMessage(mailSession);

        try {
            mailMessage.setFrom(new InternetAddress("lab3hotel321@gmail.com"));
            InternetAddress[] toAddress = new InternetAddress[to.length];

            // To get the array of addresses
            for (int i = 0; i < to.length; i++) {
                toAddress[i] = new InternetAddress(to[i]);
            }

            for (int i = 0; i < toAddress.length; i++) {
                mailMessage.addRecipient(Message.RecipientType.TO, toAddress[i]);
            }

            mailMessage.setSubject(subject);
            mailMessage.setText(body);
            Transport transport = mailSession.getTransport("smtp");
            transport.connect(host, "lab3hotel321@gmail.com", PASSWORD);
            transport.sendMessage(mailMessage, mailMessage.getAllRecipients());
            transport.close();
        } catch (AddressException ae) {
            ae.printStackTrace();
        } catch (MessagingException me) {
            me.printStackTrace();
        }
        return "yes";

    }
}
