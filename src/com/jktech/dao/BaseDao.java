package com.jktech.dao;
import java.io.Serializable;
import java.util.List;

import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

/**
 * 数据库io操作
 */
public class BaseDao extends HibernateDaoSupport {
	
	/**查询*/
	@SuppressWarnings("unchecked")
	public <T> List<T> getObjects(String queryString){
		return (List<T>)this.getHibernateTemplate().find(queryString);
	}
	
	/**查询所有*/
	public <T> List<T> getAllObjects(Class<T> clazz){
		return this.getHibernateTemplate().loadAll(clazz);
	}
	
	/**添加一个*/
	
	public <T> void addObject(T clazz){
		this.getHibernateTemplate().save(clazz);
		//this.getSessionFactory().openSession().save(clazz);
	}
	
	/**更新指定的*/
	public <T> void updateObject(T clazz){
		this.getHibernateTemplate().update(clazz);
	}

	/**删除指定的*/
	public <T> void deleteObject(T clazz){
		this.getHibernateTemplate().delete(clazz);
	}
	
	/**通过id获取*/
	public <T> T getObject(Class<T> clazz,Serializable id){
		return this.getHibernateTemplate().get(clazz, id);
	}
}
