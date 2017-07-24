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
