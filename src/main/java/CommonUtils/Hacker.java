package CommonUtils;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;
public class Hacker {

    public static void main(String[] args) throws IOException {


            Scanner in = new Scanner(System.in);
            int t=in.nextInt();
            for(int i=0;i<t;i++){
                int a = in.nextInt();
                int b = in.nextInt();
                int n = in.nextInt();
                for (int j = 0; j < n; j++) { a += b; System.out.print(a + " "); b *= 2; } System.out.println();
            }
            in.close();

        
    }
}