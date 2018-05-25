
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.ItemsBean;
import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseItemsDao;




@Repository(value = "itemsDao")
public class ItemsDao extends BaseItemsDao
{
@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate; 
	@Autowired HttpSession session;
	public List<ItemsBean> getItems(String status){  
		jdbcTemplate = custom.getJdbcTemplate();
		String branchId="all";
		LoginBean objuserBean = (LoginBean) session.getAttribute("cacheUserBean");
		if (objuserBean != null) {
			if(!objuserBean.getRoleId().equals("1")){
			branchId=objuserBean.getBranchId();
			}
		}
		 //String sql="SELECT *, DATE_FORMAT(expirydate,'%d/%m/%Y') AS expirtdate1  FROM cylindermaster";
		StringBuffer buffer= new StringBuffer();
		buffer.append("SELECT i.* ,pn.productname as productIdName,pt.producttype As productTypeName, CASE WHEN i.status IN ('0') THEN 'Deactive' WHEN i.status in ('1') THEN 'Active'  ELSE '-----' END as itemsStatus   FROM items i, productname pn,producttype pt ,`branch_products` bp where i.status='"+status+"' and i.productId=pt.id and  i.productname=pn.id AND bp.`product_id`=i.id ");
		if(!objuserBean.getRoleId().equals("1")){
			buffer.append(" AND bp.`branch_id` IN ('all','"+branchId+"') ");
		}
		buffer.append(" and i.status='1' order by pn.productId ,pt.producttype ");
		 String sql = buffer.toString();
//		 System.out.println(sql);
		List<ItemsBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
				ParameterizedBeanPropertyRowMapper.newInstance(ItemsBean.class));
		
		if (retlist.size() > 0)
			return retlist;
		return null;
		    
		}  
	
	public ItemsBean getByItemSerialNo(ItemsBean itemsBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from items where serialno = ?";
			List<ItemsBean> retlist = jdbcTemplate.query(sql,
			new Object[]{itemsBean.getSerialno()},
			ParameterizedBeanPropertyRowMapper.newInstance(ItemsBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	public  List<Map<String,Object>> getSubcategory(){
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = " SELECT id,`productname` AS subcategory,documents FROM `productname` ";
			List<Map<String,Object>> retlist = jdbcTemplate.queryForList(sql);
			if(retlist.size() > 0)
				return retlist;
			return null;
		
	}
	public  List<Map<String,Object>> getsubgategoryProductList(ItemsBean itemsBean){
		
		 jdbcTemplate = custom.getJdbcTemplate();
		 StringBuffer buffer =new StringBuffer();
		 buffer.append("SELECT i.* ,pn.productname as productIdName,pt.producttype As productTypeName, CASE WHEN i.status IN ('0') THEN 'Deactive' WHEN i.status in ('1') THEN 'Active'  ELSE '-----' END as itemsStatus   FROM items i, productname pn,producttype pt ,`branch_products` bp where i.status='1' and i.productId=pt.id and  i.productname=pn.id AND bp.`product_id`=i.id  ");
		 if(StringUtils.isNotBlank(itemsBean.getBranchId())){
				buffer.append(" AND bp.`branch_id` IN ('all','"+itemsBean.getBranchId()+"') ");
			}
			buffer.append(" and i.status='1' order by pn.productId ,pt.producttype ");
			
			String sql = buffer.toString();
			List<Map<String,Object>> retlist = jdbcTemplate.queryForList(sql,new Object[] {});
			if(retlist.size() > 0)
				return retlist;
			return null;
	}
	

}

