package CommonUtils;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;
public class Hacker {

    public static void main(String[] args) throws IOException {
    	BufferedReader br=new BufferedReader(new InputStreamReader(System.in));
        Scanner scan = new Scanner(System.in);
        
        System.out.println("Please enter integer: ");
        int i = scan.nextInt();
        double d = scan.nextDouble();
        String s = br.readLine();
        System.out.println("String: " + s);
        System.out.println("Double: " + d);
        System.out.println("Int: " + i);
        
        
    }
}