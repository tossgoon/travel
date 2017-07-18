package com.travel.service;


import java.util.List;

import com.travel.dao.BaseDao;


public class PortalService<T> {

	
	private BaseDao dao;

	public PortalService() {
		// TODO Auto-generated constructor stub
	}

	public void addPortal(T Portal) throws Exception {
		dao.addObject(Portal);
	}

	public void updatePortal(T Portal) throws Exception {
		dao.updateObject(Portal);
	}

	public void deletePortal(int id, Class<T> Portal) throws Exception {
		T portal = dao.getObject(Portal, id);
		dao.deleteObject(portal);
	}

	public T getPortal(Class<T> portal, int id) {
		return dao.getObject(portal, id);
	}

	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}
	
	public List<T> queryPortalByName(String portalname,Class<T> clazz){
		if(portalname == null || "".equals(portalname))
			return dao.getAllObjects(clazz);
		String queryString = "from Portal p where p.title like '%"+portalname+"%'";
		return dao.getObjects(queryString);
	}
	
}
