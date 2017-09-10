package com.travel.service;
import com.travel.dao.BaseDao;

public class AnimalsurveyService<T> {

	private BaseDao dao;

	public AnimalsurveyService() {
		// TODO Auto-generated constructor stub
	}

	public void addAnimalsur(T Dept) throws Exception {
		dao.addObject(Dept);
	}

	public void updateAnimalsur(T Dept) throws Exception {
		dao.updateObject(Dept);
	}

	public void deleteAnimalsur(int id, Class<T> Dept) throws Exception {
		T dept = dao.getObject(Dept, id);
		dao.deleteObject(dept);
	}

	public T getAnimalsur(Class<T> dept, int id) {
		return dao.getObject(dept, id);
	}

	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}
}
