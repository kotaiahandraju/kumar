package com.aurospaces.neighbourhood.db.callback;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.RowCallbackHandler;

public class RowValueCallbackHandler implements RowCallbackHandler
{
	List<Map<String,String>>  retList;
	String[] columns;
	public RowValueCallbackHandler(String[] incolumns)
	{
		columns = incolumns;
		retList = new ArrayList<Map<String,String> > ();
	}
	

	public List<Map<String,String>>  getResult()
	{
		return retList;
	}


	public void processRow(ResultSet rs) throws SQLException {
		Map<String , String> eachrow = new HashMap<String,String>();
		for(String colname : columns)
		{
			eachrow.put(colname,  rs.getString(colname));
		}
		retList.add(eachrow);
	}
		

	
}
// GenericDao
