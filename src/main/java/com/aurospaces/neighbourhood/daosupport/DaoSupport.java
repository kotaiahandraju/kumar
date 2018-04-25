/**
 * 
 */
package com.aurospaces.neighbourhood.daosupport;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

/**
 * @author yogi
 *
 */
public class DaoSupport extends JdbcDaoSupport {
	@Autowired
	public void setDataSourceh(DataSource dataSource)
	{
		setDataSource(dataSource);
	}
}
