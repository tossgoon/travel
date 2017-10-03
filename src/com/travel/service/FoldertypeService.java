package com.travel.service;
import java.util.List;

import com.travel.dao.BaseDao;

public class FoldertypeService<T> {

	private BaseDao dao;

	public FoldertypeService() {
		// TODO Auto-generated constructor stub
	}

	public void addFoldertype(T Dept) throws Exception {
		dao.addObject(Dept);
	}

	public void updateFoldertype(T Dept) throws Exception {
		dao.updateObject(Dept);
	}

	public void deleteFoldertype(int id, Class<T> Dept) throws Exception {
		T dept = dao.getObject(Dept, id);
		dao.deleteObject(dept);
	}

	public T getFoldertype(Class<T> dept, int id) {
		return dao.getObject(dept, id);
	}
	
	public List<T> getFolderList(Class<T> clazz,int ptype){
		String queryString = "from Foldertype f where f.ptype="+ptype;
		return dao.getObjects(queryString);
	}

	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}
}
