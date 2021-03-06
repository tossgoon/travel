package com.travel.service;


import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.travel.dao.BaseDao;
import com.travel.pojo.Portal;
import com.travel.pojo.User;


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
	

	public List<T> queryPortalByType(String portalType,int topnum)
	{
		String queryString = "from Portal p where p.type = ? and p.status='1' order by pubdate desc";
		SessionFactory sessionFactory=dao.getHibernateTemplate().getSessionFactory();
		Session session=(Session) sessionFactory.openSession();//
		Query query=session.createQuery(queryString);
		query.setString(0, portalType);
		if(topnum>0){
			query.setFirstResult(0);
			query.setMaxResults(topnum);
		}
		@SuppressWarnings("unchecked")
		List<T> result=(List<T>)query.list();
		session.close();
		//sessionFactory.close();
		return result;
	}
	public List<T> queryPortalOfPicturl(int topnum)
	{
		//
		//String queryString = "from Portal p where p.isshowpicture=1";
		//return dao.getObjects(queryString);
		
		String queryString = "from Portal p where p.type = '1' and p.isshowpicture=1 order by pubdate desc";
		SessionFactory sessionFactory=dao.getHibernateTemplate().getSessionFactory();
		Session session=(Session) sessionFactory.openSession();//
		Query query=session.createQuery(queryString);
		query.setFirstResult(0);
		query.setMaxResults(topnum);
		@SuppressWarnings("unchecked")
		List<T> result=(List<T>)query.list();
		session.close();
		//sessionFactory.close();
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<Portal> queryPortalByPage(int pagesize,int pagenum,String type){
		String queryString="from Portal p where p.type = '"+type+"' order by p.pubdate desc";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setFirstResult((pagenum-1)*pagesize);
		query.setMaxResults(pagesize);
		List<Portal>list=(List<Portal>)query.list();
		session.close();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Portal> searchPortalByPage(int pagesize,int pagenum,String keywords){
		String queryString="from Portal p where p.title like:param or p.content like:param order by p.pubdate desc";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setString("param", "%" + keywords + "%");
		query.setFirstResult((pagenum-1)*pagesize);
		query.setMaxResults(pagesize);
		List<Portal>list=(List<Portal>)query.list();
		session.close();
		return list;
	}
	
	public int getPortalCount(String type){
		String queryString="select count(*) from Portal as p where p.type='"+type+"'";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		long count=(Long)query.uniqueResult();
		int num= (int)count;
		session.close();
		return num;
	}
	
	public int getPortalSearchCount(String keywords){
		String queryString="select count(*) from Portal as p where p.title like:param or p.content like:param";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setString("param", "%" + keywords + "%");
		long count=(Long)query.uniqueResult();
		int num= (int)count;
		session.close();
		return num;
	}
	
	
	
}
