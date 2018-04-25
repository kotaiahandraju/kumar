package com.aurospaces.neighbourhood.util;

import org.springframework.stereotype.Repository;


@Repository(value = "messageSender")
public class ConsoleMessageSender implements MessageSender {
	public void sendMessage(String destination, String message)
	{
		System.out.println("CONSOLE : " + destination + ",MESSAGE:" + message);
	}
}
