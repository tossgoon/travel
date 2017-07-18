package com.travel.service;


import java.util.List;

import com.travel.dao.BaseDao;


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
	
	public List<T> queryUserByName(String username,Class<T> clazz){
		if(username == null || "".equals(username))
			return dao.getAllObjects(clazz);
		String queryString = "from User u where u.username like '%"+username+"%'";
		return dao.getObjects(queryString);
	}
	
}
