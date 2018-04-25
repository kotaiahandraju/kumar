package com.aurospaces.neighbourhood.util;

import org.springframework.stereotype.Repository;


public interface MessageSender {
	public void sendMessage(String destination , String message);
}
