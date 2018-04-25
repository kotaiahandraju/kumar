/**
 * 
 */
package com.aurospaces.neighbourhood.daosupport;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

/**
 * 
 */
public class CustomConnection extends JdbcDaoSupport {
	public JdbcTemplate getTemplateConnection() {
		return getJdbcTemplate();
	}

}
