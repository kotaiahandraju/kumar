package com.aurospaces.neighbourhood.db.basedao;
import java.io.Serializable;
import java.util.Random;

import org.hibernate.HibernateException;
import org.hibernate.engine.SessionImplementor;
import org.hibernate.id.IdentifierGenerator;

public class OrderIdGenerator implements IdentifierGenerator{

	@Override
	public Serializable generate(SessionImplementor session, Object object) throws HibernateException {
		
		String prefix = "Kumar";
		
		// create instance of Random class
        Random rand = new Random();
                        
        // Generate random integers in range 0 to 999
        int rand_int = rand.nextInt(10000);
		
        System.out.println(" Custom generated Sequence value " + prefix.concat(new Integer(rand_int).toString()));
		return  prefix.concat(new Integer(rand_int).toString());
	}

}
