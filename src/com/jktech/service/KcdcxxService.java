package com.jktech.service;

import java.util.List;



import com.jktech.dao.BaseDao;
import com.jktech.pojo.Kcdcxx;
import com.jktech.pojo.Kctc;

public class KcdcxxService<T> {

	private BaseDao dao;

	public KcdcxxService() {
		// TODO Auto-generated constructor stub
	}

	public void addKcdcxx(T Kcdcxx) throws Exception {
		dao.addObject(Kcdcxx);
	}

	public void updateKcdcxx(T Kcdcxx) throws Exception {
		dao.updateObject(Kcdcxx);
	}

	public void deleteKcdcxx(int id, Class<T> Kcdcxx) throws Exception {
		T kcdcxx = dao.getObject(Kcdcxx, id);
		dao.deleteObject(kcdcxx);
	}

	public T getKcdcxx(Class<T> Kcdcxx, int id) {
		return dao.getObject(Kcdcxx, id);
	}

	public Kcdcxx getKcdcxxByTcid(int tcid) {
		String queryString = "From Kcdcxx dcxx where dcxx.id= (select dcId from Kctc where id="
				+ tcid + ")";
		List<Object> list = dao.getObjects(queryString);
		if (list != null && !list.isEmpty()) {
			return (Kcdcxx) list.get(0);
		}
		return null;
	}

	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

}
