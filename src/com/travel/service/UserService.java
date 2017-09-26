package com.travel.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.base.MD5Util;
import com.travel.dao.BaseDao;
import com.travel.pojo.User;

public class UserService<T> {

	private BaseDao dao;

	public UserService() {
		// TODO Auto-generated constructor stub
	}

	public void addUser(T User) throws Exception {
		dao.addObject(User);
	}

	public void updateUser(T User) throws Exception {
		dao.updateObject(User);
	}

	public void updateUserNoPassword(User user)
			throws Exception {
		String queryString = "update User u set u.username=?,u.loginname=?,u.telephone=?,u.department=?,u.remark=? where u.id=?";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setString(0, user.getUsername());
		query.setString(1, user.getLoginname());
		query.setString(2, user.getTelephone());
		query.setString(3, user.getDepartment());
		query.setString(4, user.getRemark());
		query.setInteger(5, user.getId());
		query.executeUpdate();
		session.close();
	}
	
	public void updateUserPassword(User user)
			throws Exception {
		String queryString = "update User u set u.password=? where u.id=?";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setString(0, user.getPassword());
		query.setInteger(1, user.getId());
		query.executeUpdate();
		session.close();
	}

	public void deleteUser(int id, Class<T> User) throws Exception {
		T user = dao.getObject(User, id);
		dao.deleteObject(user);
	}

	public T getUser(Class<T> user, int id) {
		return dao.getObject(user, id);
	}

	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	public List<T> queryUserByName(String username, Class<T> clazz) {
		if (username == null || "".equals(username))
			return dao.getAllObjects(clazz);
		String queryString = "from User u where u.username like '%" + username
				+ "%'";
		return dao.getObjects(queryString);
	}
	
	public int getUserCount(){
		String queryString="select count(*) from User as user";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		long count=(Long)query.uniqueResult();
		int num= (int)count;
		session.close();
		return num;
	}
	
	@SuppressWarnings("unchecked")
	public List<User> queryUserByPage(Class<T> clazz,int pagesize,int pagenum){
		String queryString="from User u order by u.id";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setFirstResult((pagenum-1)*pagesize);
		query.setMaxResults(pagesize);
		List<User>list=(List<User>)query.list();
		session.close();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<User> queryUserByDeptPage(Class<T> clazz,int pagesize,int pagenum,String deptname){
		String queryString="from User u Where u.department=:param order by u.id";
		if(deptname==""){
			queryString="from User u order by u.department";
		}
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setString("param", deptname);
		query.setFirstResult((pagenum-1)*pagesize);
		query.setMaxResults(pagesize);
		List<User>list=(List<User>)query.list();
		session.close();
		return list;
	}
	
	public int getDeptUserCount(String deptname){
		if(deptname==""){
			//queryString="select count(*) from User as user";
			return getUserCount();
		}
		String queryString="select count(*) from User u Where u.department=:param";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setString("param", deptname);
		long count=(Long)query.uniqueResult();
		int num= (int)count;
		session.close();
		return num;
	}
	
	public T queryUserByName(String loginname){
		if (loginname == null )
			return null;
		String queryString = "from User u where u.loginname='" + loginname
				+ "'";
		List<T> users = dao.getObjects(queryString);
		if(users.size()==0)
		{
			return null;
		}
		else{
			return users.get(0);
		}
	}

	public T queryUserByNamePassword(String loginname, String password)
			throws Exception {
		if (loginname == null || password == null)
			return null;
		String md5pass=MD5Util.getMD5(password);//√‹¬Îµƒmd5º”√‹
		String queryString = "from User u where u.loginname='" + loginname
				+ "' AND u.password = '" + md5pass+"'";
		List<T> users = dao.getObjects(queryString);
		if(users.size()==0)
		{
			return null;
		}
		else{
			return users.get(0);
		}
	}

}
