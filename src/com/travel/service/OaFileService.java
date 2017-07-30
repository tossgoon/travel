package com.travel.service;


import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.travel.dao.BaseDao;


public class OaFileService<T> {

	
	private BaseDao dao;

	public OaFileService() {
		// TODO Auto-generated constructor stub
	}

	public void addOafile(T Oafile) throws Exception {
		dao.addObject(Oafile);
	}

	public void updateOafile(T Oafile) throws Exception {
		dao.updateObject(Oafile);
	}

	public void deleteOafile(int id, Class<T> Oafile) throws Exception {
		T oafile = dao.getObject(Oafile, id);
		dao.deleteObject(oafile);
	}
	
	

	public T getOafile(Class<T> oafile, int id) {
		return dao.getObject(oafile, id);
	}

	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}
	
	public List<T> queryOafileByOaid(int oaid, Class<T> clazz) {
		String queryString = "from Oafile oafile where oafile.oaid =" + oaid;
		return dao.getObjects(queryString);
	}
	
	public void deleteOafileByOaid(int oaid, Class<T> Oafile) throws Exception {
		String queryString = "delete from Oafile f where f.oaid = ? ";
		SessionFactory sessionFactory=dao.getHibernateTemplate().getSessionFactory();
		Session session=(Session) sessionFactory.openSession();//
		Query query=session.createQuery(queryString);
		query.setInteger(0, oaid);
		query.executeUpdate();
		session.close();
	}
	/*public List<T> queryPortalByType(String portalType,int topnum)
	{
		String queryString = "from Portal p where p.type = ? and p.status='1' order by pubdate desc";
		SessionFactory sessionFactory=dao.getHibernateTemplate().getSessionFactory();
		Session session=(Session) sessionFactory.openSession();//
		Query query=session.createQuery(queryString);
		query.setString(0, portalType);
		query.setFirstResult(0);
		query.setMaxResults(topnum);
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
	}*/
	
}
