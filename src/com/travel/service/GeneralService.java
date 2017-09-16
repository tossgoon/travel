package com.travel.service;
import java.util.List;

import com.travel.dao.BaseDao;

public class GeneralService<T> {

	private BaseDao dao;

	public GeneralService() {
		// TODO Auto-generated constructor stub
	}

	public void addObject(T Dept) throws Exception {
		dao.addObject(Dept);
	}

	public void updateObject(T Dept) throws Exception {
		dao.updateObject(Dept);
	}

	public void deleteObject(int id, Class<T> Dept) throws Exception {
		T dept = dao.getObject(Dept, id);
		dao.deleteObject(dept);
	}

	public T getObject(Class<T> dept, int id) {
		return dao.getObject(dept, id);
	}

	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}
	
	public List<T> getObjectList(Class<T> clazz){
		return dao.getAllObjects(clazz);
	}
}
