package com.aurospaces.neighbourhood.service1;

import org.springframework.stereotype.Repository;


@Repository(value="emailService")
public interface EmailValidationSrv {
	public boolean isAddressValid(String email) ;
} 
