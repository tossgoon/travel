package com.jktech.service;

import java.util.List;

import com.jktech.dao.BaseDao;

/**
 * 勘察工程业务逻辑的实现
 * */
public class GcCommService<T> {

	private BaseDao dao;

	public List<T> queryGcComm(int gcid, String tbtype) {
		String queryString = " from GcComment u where u.tbtype='"
				+ tbtype + "' and u.gcid=" + gcid;
		return dao.getObjects(queryString);
	}

	public void addGcComm(T gccomm) throws Exception {
		dao.addObject(gccomm);
	}

	public void updateGcComm(T gccomm) throws Exception {
		dao.updateObject(gccomm);
	}

	public void deleteGcComm(int id, Class<T> clazz) throws Exception {
		T gccomm = dao.getObject(clazz, id);
		dao.deleteObject(gccomm);
	}

	public T getGcComm(Class<T> clazz, int id) {
		return dao.getObject(clazz, id);
	}

	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}
}
