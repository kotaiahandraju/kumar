package com.aurospaces.neighbourhood.db.callback;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import java.lang.reflect.InvocationTargetException;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.jdbc.core.RowCallbackHandler;


/* Create an emtpy object and pass this to create the objects
*/
public class BeanUtilsCallbackHandler implements RowCallbackHandler
{
	String[] columns;
	Class inputClass;
	List<Object> retList;
	public BeanUtilsCallbackHandler(String inputType, String[] incolumns) throws Exception
	{
		columns = incolumns;
		retList = new ArrayList<Object>();
		inputClass =  Class.forName(inputType);
	}
	


	public void processRow(ResultSet rs) throws SQLException {
	try
	{
		Object inputObject = inputClass.newInstance();

		for(String colname : columns)
		{
			try
			{
				BeanUtils.setProperty(inputObject, colname,  rs.getString(colname));
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
//			catch(InvocationTargetException ex)
//			{
//				ex.printStackTrace();
//			}
//			catch(InvocationTargetException ex)
//			{
//				ex.printStackTrace();
//			}
//			catch(InvocationTargetException ex)
//			{
//				ex.printStackTrace();
//			}
			
		}
		retList.add(inputObject);
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}

	}
		
  public List<Object>  getResult()
  {
    return retList;
  }

	
}
// GenericDao
