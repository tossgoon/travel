package com.travel.service;


import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.travel.dao.BaseDao;


public class OaReceiverService<T> {

	
	private BaseDao dao;

	public OaReceiverService() {
		// TODO Auto-generated constructor stub
	}

	public void addOaReceiver(T OaReceiver) throws Exception {
		dao.addObject(OaReceiver);
	}

	public void updateOaReceiver(T OaReceiver) throws Exception {
		dao.updateObject(OaReceiver);
	}
	
	public void setread(int id) throws Exception{
		String querystring="update Oareceiver oar set oar.isread=true where oar.id=?";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(querystring);
		query.setInteger(0, id);
		query.executeUpdate();
		session.close();
	}

	public void deleteOaReceiver(int id, Class<T> OaReceiver) throws Exception {
		T oaReceiver = dao.getObject(OaReceiver, id);
		dao.deleteObject(oaReceiver);
	}

	public T getOaReceiver(Class<T> oaReceiver, int id) {
		return dao.getObject(oaReceiver, id);
	}

	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}
	
	public List<T> queryOaReceiverByUserid(int userid, Class<T> clazz) {
		String queryString = "from Oareceiver oareceiver where oareceiver.userid =" + userid+" order by isread asc,id desc ";
		return dao.getObjects(queryString);
	}
	
	public List<T> queryOaReceiverByUseridDeal(int userid, Class<T> clazz) {
		String queryString = "from Oareceiver oareceiver where oareceiver.userid =" + userid+" and oareceiver.isread=false order by isread asc,id desc ";
		return dao.getObjects(queryString);
	}
	
	public List<T> queryOaReceiverByOaid(int oaid, Class<T> clazz) {
		String queryString = "from Oareceiver oareceiver where oareceiver.oaid =" + oaid;
		return dao.getObjects(queryString);
	}
	public void deleteReceiversByOa(int oaid,Class<T> clazz) throws Exception
	{
		String queryString = "delete from Oareceiver f where f.oaid = ? ";
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
