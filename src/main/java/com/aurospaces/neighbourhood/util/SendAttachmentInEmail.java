package com.aurospaces.neighbourhood.util;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class SendAttachmentInEmail {
   public static void send(String to ,final String from ,final String password,String port) {
      // Recipient's email ID needs to be mentioned.
       to = "andraju.kotaiah@gmail.com";

      // Sender's email ID needs to be mentioned
      // from = "chinta.nitun93@gmail.com";

//      username = "chinta.nitun93@gmail.com";//change accordingly
    //  password = "nitun.kittu";//change accordingly

      // Assuming you are sending email through relay.jangosmtp.net
     // String host = "relay.jangosmtp.net";

      Properties properties = new Properties();
      properties.put("mail.smtp.host","smtp.gmail.com");
      properties.put("mail.smtp.port",port);
      properties.put("mail.smtp.auth", "true");
      properties.put("mail.smtp.starttls.enable", "true");
      properties.put("mail.user",from);
      properties.put("mail.password",password);

      // creates a new session with an authenticator
      Authenticator auth = new Authenticator() {
          public PasswordAuthentication getPasswordAuthentication() {
              return new PasswordAuthentication(from,password);
          }
      };

      try {
    	  Session session = Session.getInstance(properties, auth);
         // Create a default MimeMessage object.
         Message message = new MimeMessage(session);

         // Set From: header field of the header.
         message.setFrom(new InternetAddress(from));

         // Set To: header field of the header.
         message.setRecipients(Message.RecipientType.TO,
            InternetAddress.parse(to));

         // Set Subject: header field
         message.setSubject("Backup data");

         // Create the message part
         BodyPart messageBodyPart = new MimeBodyPart();

         // Now set the actual message
         messageBodyPart.setText("Backup data");

         // Create a multipar message
         Multipart multipart = new MimeMultipart();

         // Set text message part
         multipart.addBodyPart(messageBodyPart);

         // Part two is attachment
         messageBodyPart = new MimeBodyPart();
         String filename = "D://backup1.sql";
         DataSource source = new FileDataSource(filename);
         messageBodyPart.setDataHandler(new DataHandler(source));
         messageBodyPart.setFileName(filename);
         multipart.addBodyPart(messageBodyPart);

         // Send the complete message parts
         message.setContent(multipart);

         // Send message
         Transport.send(message);

         System.out.println("Sent message successfully....");
  
      } catch (MessagingException e) {
         throw new RuntimeException(e);
      }
   }
   

   
   static int BUFFER = 10485760;      

   public static String getData(String host, String port,    String user, String password, String db) throws Exception {
	   
		
   Process run = Runtime.getRuntime().exec(
              "C:\\Program Files (x86)\\MySQL\\MySQL Server 5.5\\bin\\mysqldump --host="  + host + " --port=" + port + 
              " --user=" + user + " --password=" + password +
              " --compact --databases --add-drop-table --complete-insert --extended-insert " +
              "--skip-comments --skip-triggers "+ db);
   InputStream in = run.getInputStream(); 
   BufferedReader br = new BufferedReader(new InputStreamReader(in));
   StringBuffer temp = new StringBuffer();
   int count;
    char[] cbuf = new char[BUFFER];

   while ((count = br.read(cbuf, 0, BUFFER)) != -1)
          	 temp.append(cbuf, 0, count);

    br.close();
    in.close();

    return temp.toString();
   }

   /*public static void main(String[] args) throws Exception {
   byte[] data = SendAttachmentInEmail.getData("localhost", "3306",
   	"root", "root", "koti").getBytes();		
   File filedst = new File(" D://backup.sql");
   FileOutputStream dest = new FileOutputStream(filedst);
   dest.write(data);
   }*/
   /*after I execute it I 
   */
   
}