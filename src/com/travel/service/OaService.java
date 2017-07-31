package com.travel.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.travel.dao.BaseDao;

public class OaService<T> {

	private BaseDao dao;

	public OaService() {
		// TODO Auto-generated constructor stub
	}

	public void addOa(T Oa) throws Exception {
		dao.addObject(Oa);
	}

	public void updateOa(T Oa) throws Exception {
		dao.updateObject(Oa);
	}

	public void deleteOa(int id, Class<T> Oa) throws Exception {
		T oa = dao.getObject(Oa, id);
		dao.deleteObject(oa);
	}

	public T getOa(Class<T> oa, int id) {
		return dao.getObject(oa, id);
	}

	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	public List<T> queryOaByCreater(int userid, Class<T> clazz) {
		String queryString = "from Oa oa where oa.creater =" + userid;
		return dao.getObjects(queryString);
	}

	public List<T> queryOaByName(int userid, Class<T> clazz, String username) {
		String queryString = "from Oa oa where oa.title like '%" + username	+ "%' and  oa.creater =" + userid;
		return dao.getObjects(queryString);
	}

	/*
	 * public List<T> queryPortalByType(String portalType,int topnum) { String
	 * queryString =
	 * "from Portal p where p.type = ? and p.status='1' order by pubdate desc";
	 * SessionFactory
	 * sessionFactory=dao.getHibernateTemplate().getSessionFactory(); Session
	 * session=(Session) sessionFactory.openSession();// Query
	 * query=session.createQuery(queryString); query.setString(0, portalType);
	 * query.setFirstResult(0); query.setMaxResults(topnum);
	 * 
	 * @SuppressWarnings("unchecked") List<T> result=(List<T>)query.list();
	 * session.close(); //sessionFactory.close(); return result; } public
	 * List<T> queryPortalOfPicturl(int topnum) { // //String queryString =
	 * "from Portal p where p.isshowpicture=1"; //return
	 * dao.getObjects(queryString);
	 * 
	 * String queryString =
	 * "from Portal p where p.type = '1' and p.isshowpicture=1 order by pubdate desc"
	 * ; SessionFactory
	 * sessionFactory=dao.getHibernateTemplate().getSessionFactory(); Session
	 * session=(Session) sessionFactory.openSession();// Query
	 * query=session.createQuery(queryString); query.setFirstResult(0);
	 * query.setMaxResults(topnum);
	 * 
	 * @SuppressWarnings("unchecked") List<T> result=(List<T>)query.list();
	 * session.close(); //sessionFactory.close(); return result; }
	 */

}
