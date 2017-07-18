package com.jktech.service;

import java.util.List;

import com.jktech.dao.BaseDao;

/**
 * ���칤��ҵ���߼���ʵ��
 * */
public class GcAttachService<T> {

	private BaseDao dao;

	public List<T> queryGcAttach(int gcid, String tbtype) {
		String queryString = " from GcAttach u where u.tbtype='"
				+ tbtype + "' and u.gcid=" + gcid;
		return dao.getObjects(queryString);
	}

	public void addGcAttach(T gcatt) throws Exception {
		dao.addObject(gcatt);
	}

	public void updateGcAttach(T gcatt) throws Exception {
		dao.updateObject(gcatt);
	}

	public void deleteAttach(int id, Class<T> clazz) throws Exception {
		// 0.�ж��û��Ƿ���Ȩ���ϴ�
		T gcatt = dao.getObject(clazz, id);
		dao.deleteObject(gcatt);
	}

	public T getGcAttach(Class<T> clazz, int id) {
		return dao.getObject(clazz, id);
	}

	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}
}
