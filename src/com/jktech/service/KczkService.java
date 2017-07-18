package com.jktech.service;

import java.util.List;

import com.jktech.dao.BaseDao;

public class KczkService<T> {

	private BaseDao dao;

	public KczkService() {
		// TODO Auto-generated constructor stub
	}

	public void addKczk(T Kczk) throws Exception {
		dao.addObject(Kczk);
	}

	public void updateKczk(T kczk) throws Exception {
		dao.updateObject(kczk);
	}

	public void deleteKczk(int id, Class<T> Kczk) throws Exception {
		T kczk = dao.getObject(Kczk, id);
		dao.deleteObject(kczk);
	}

	public T getKczk(Class<T> kczk, int id) {
		return dao.getObject(kczk, id);
	}

	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	public String getGCName(int gcid) {
		String gcname = "";
		String hqlString = "select name from Kcgc where id=" + gcid;
		List<String> gcnameList = dao.getObjects(hqlString);
		if (null != gcnameList && !gcnameList.isEmpty()) {
			gcname = gcnameList.get(0);
		}
		return gcname;
	}
}
