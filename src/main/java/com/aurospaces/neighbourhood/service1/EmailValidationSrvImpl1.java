package com.aurospaces.neighbourhood.service1;
import java.io.*;
import java.net.*;
import java.util.*;
import javax.naming.*;
import javax.naming.directory.*;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.AddressException;

public class EmailValidationSrvImpl1 implements  EmailValidationSrv {
   private static int hear( BufferedReader in ) throws IOException {
     String line = null;
     int res = 0;

     while ( (line = in.readLine()) != null ) {
         String pfx = line.substring( 0, 3 );
         try {
            res = Integer.parseInt( pfx );
         }
         catch (Exception ex) {
            res = -1;
         }
         if ( line.charAt( 3 ) != '-' ) break;
     }

     return res;
     }

   private static void say( BufferedWriter wr, String text )
      throws IOException {
     wr.write( text + "\r\n" );
     wr.flush();

     return;
     }
     private static ArrayList getMX( String hostName )
         throws NamingException {
     // Perform a DNS lookup for MX records in the domain
     Hashtable env = new Hashtable();
     env.put("java.naming.factory.initial",
             "com.sun.jndi.dns.DnsContextFactory");
     DirContext ictx = new InitialDirContext( env );
     Attributes attrs = ictx.getAttributes
                           ( hostName, new String[] { "MX" });
     Attribute attr = attrs.get( "MX" );
     	System.out.println("the size"+attr.size());
     ArrayList res = new ArrayList();
     if (( attr == null ) || ( attr.size() == 0 )) {
       attrs = ictx.getAttributes( hostName, new String[] { "A" });
       attr = attrs.get( "A" );
       if( attr == null )
            throw new NamingException
                     ( "No match for name '" + hostName + "'" );
       return res;
     }
       
     
     NamingEnumeration en = attr.getAll();

     while ( en.hasMore() ) {
        String mailhost;
        String x = (String) en.next();
        String f[] = x.split( " " );
       
        if (f.length == 1)
            mailhost = f[0];
        else if ( f[1].endsWith( "." ) )
            mailhost = f[1].substring( 0, (f[1].length() - 1));
        else
            mailhost = f[1];
                   
        res.add( mailhost );
     }
     return res;
     }
public boolean isAddressValid(String email) {
   boolean result = true;
   try {
      InternetAddress emailAddr = new InternetAddress(email);
      emailAddr.validate();
   } catch (AddressException ex) {
      result = false;
   }
   return result;
}

} 
