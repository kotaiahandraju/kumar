package com.aurospaces.neighbourhood.db.callback;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.LinkedHashMap;

import org.springframework.jdbc.core.RowCallbackHandler;

public class KeyValueCallbackHandler implements RowCallbackHandler
{
	Map<String,String>  retList;
	String keyColumn;
	String valueColumn;
	public KeyValueCallbackHandler(String keyColumn, String valueColumn)
	{
		this.keyColumn = keyColumn;
		this.valueColumn = valueColumn;
		retList = new LinkedHashMap<String,String>(); 
	}

	public Map<String,String> getResult()
	{
		return retList;
	}
	
	
	public void processRow(ResultSet rs) throws SQLException {
		String jobid  = rs.getString(keyColumn);
		String locid  = rs.getString(valueColumn);
		retList.put(jobid,locid);
	
	}
		

	
}
