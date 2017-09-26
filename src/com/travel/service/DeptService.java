package com.travel.service;
import java.util.List;
import com.travel.dao.BaseDao;

public class DeptService<T> {

	private BaseDao dao;

	public DeptService() {
		// TODO Auto-generated constructor stub
	}

	public void addDept(T Dept) throws Exception {
		dao.addObject(Dept);
	}

	public void updateDept(T Dept) throws Exception {
		dao.updateObject(Dept);
	}

	public void deleteDept(int id, Class<T> Dept) throws Exception {
		T dept = dao.getObject(Dept, id);
		dao.deleteObject(dept);
	}

	public T getDept(Class<T> dept, int id) {
		return dao.getObject(dept, id);
	}

	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}
	
	public List<T> getDeptList(Class<T> clazz){
		return dao.getAllObjects(clazz);
	}
}
