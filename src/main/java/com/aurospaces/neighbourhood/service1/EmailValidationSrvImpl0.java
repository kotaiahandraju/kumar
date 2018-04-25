package com.aurospaces.neighbourhood.service1;
import java.io.*;
import java.net.*;
import java.util.*;
import javax.naming.*;
import javax.naming.directory.*;

public class EmailValidationSrvImpl0 implements  EmailValidationSrv {
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

	public boolean isAddressValid(String address) {
     // Find the separator for the domain name
     int pos = address.indexOf( '@' );

     // If the address does not contain an '@', it's not valid
     if ( pos == -1 ) return false;

     
     String domain = address.substring( ++pos );
     ArrayList mxList = null;
     try {
        mxList = getMX( domain );
     }
     catch (NamingException ex) {
        return false;
     }

   
     if ( mxList.size() == 0 ) return false;

    
     for ( int mx = 0 ; mx < mxList.size() ; mx++ ) {
         boolean valid = false;
//         if(mx>3) return true;
         try {
             int res;
             //
             Socket skt = new Socket( (String) mxList.get( mx ), 25 );
             BufferedReader rdr = new BufferedReader
                ( new InputStreamReader( skt.getInputStream() ) );
             BufferedWriter wtr = new BufferedWriter
                ( new OutputStreamWriter( skt.getOutputStream() ) );

             res = hear( rdr );
             if ( res != 220 ) throw new Exception( "Invalid header" );
             say( wtr, "EHLO gmail.com" );

             res = hear( rdr );
             if ( res != 250 ) throw new Exception( "Not ESMTP" );

             // validate the sender address              
             say( wtr, "MAIL FROM: <amaljoy91.com>" );
             res = hear( rdr );
             if ( res != 250 ) throw new Exception( "Sender rejected" );

             say( wtr, "RCPT TO: <" + address + ">" );
             res = hear( rdr );

             
             say( wtr, "RSET" ); hear( rdr );
             say( wtr, "QUIT" ); hear( rdr );
             if ( res != 250 )
                throw new Exception( "Address is not valid!" );

             valid = true;
             rdr.close();
             wtr.close();
             skt.close();
         }
         catch (Exception ex) {
           // Do nothing but try next host
          
         }
         finally {
           if ( valid ) return true;
         }
     }
     return false;
     }

 /**  public static void main( String args[] ) {
     String testData[] = {
         "real@rgagnon.com",
         "you@acquisto.net",
         "fail.me@nowhere.spam", // Invalid domain name
         "nosuchaddress@yahoo.com", // Failure of this method,
         "amaljoy91@gmail.com",
         "abc@def.com",
         "blisdcasdcasdc@googlemail.com",//bad				
			"info@bilderbuch-stoff.de",//ok
			"blah@bilderbuch-stoff.de", // invalid
			"s.muncke@tarent.de", //invalid
			"fail.me@nowhere.spam" ,// Invalid domain name,
			"abc@def.com" ,
			"suman@aurospaces.com",
			"raj@aurospaces.com"
         };

     for ( int ctr = 0 ; ctr < testData.length ; ctr++ ) {
    	 long start_time = System.nanoTime();
    	 
    	
        System.out.println( testData[ ctr ] + " is valid? " +
              isAddressValid( testData[ ctr ] ) );
        long end_time = System.nanoTime();
   	 double difference = (end_time - start_time)/1e6;
   	 System.out.println("diff is "+difference);
     }
     return;
     }*/
} 
