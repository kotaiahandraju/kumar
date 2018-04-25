package com.aurospaces.neighbourhood.main;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class MainApp {
   public static void main(String[] args) {

      ApplicationContext context = new FileSystemXmlApplicationContext(args[0]);

// ("C:/Users/ZARA/workspace/HelloSpring/src/Beans.xml");

//      HelloWorld obj = (HelloWorld) context.getBean("helloWorld");
 //     obj.getMessage();
   }
}

