package com.travel.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.travel.dao.BaseDao;
import com.travel.pojo.Oa;
import com.travel.pojo.Portal;

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
	

	
	public void updateOaWithoutUser(Oa oa) throws Exception{
		String queryString = "update Oa oa set oa.content=?,oa.pubdate=?,oa.status=?,oa.title=? where oa.id=?";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setString(0, oa.getContent());
		query.setDate(1, oa.getPubdate());
		query.setBoolean(2, oa.getStatus());
		query.setString(3, oa.getTitle());
		query.setInteger(4, oa.getId());
		query.executeUpdate();
		session.close();
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
		String queryString = "from Oa oa where oa.creater =" + userid+" and type=1";
		return dao.getObjects(queryString);
	}

	public List<T> queryOaByName(int userid, Class<T> clazz, String username) {
		String queryString = "from Oa oa where oa.title like '%" + username	+ "%' and type=1 and  oa.creater =" + userid;
		return dao.getObjects(queryString);
	}
	
	public List<T> queryAllNotify() {
		String queryString = "from Oa oa where oa.type=2";
		return dao.getObjects(queryString);
	}
	public List<T> querySendNotify() {
		String queryString = "from Oa oa where oa.type=2 and oa.status=true";
		return dao.getObjects(queryString);
	}
	
	@SuppressWarnings("unchecked")
	public List<Oa> queryNotifyByPage(int pagesize,int pagenum){
		String queryString="from Oa oa where oa.type=2  order by oa.pubdate desc";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		//query.setInteger("param", type);
		query.setFirstResult((pagenum-1)*pagesize);
		query.setMaxResults(pagesize);
		List<Oa>list=(List<Oa>)query.list();
		session.close();
		return list;
	}
	public int getNotifyCount(){
		String queryString="select count(*) from Oa as p where p.type=2";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		long count=(Long)query.uniqueResult();
		int num= (int)count;
		session.close();
		return num;
	}
	@SuppressWarnings("unchecked")
	public List<Oa> queryNotifySendByPage(int pagesize,int pagenum){
		String queryString="from Oa oa where oa.type=2 and oa.status=true  order by oa.pubdate desc";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		//query.setInteger("param", type);
		query.setFirstResult((pagenum-1)*pagesize);
		query.setMaxResults(pagesize);
		List<Oa>list=(List<Oa>)query.list();
		session.close();
		return list;
	}
	public int getNotifySendCount(){
		String queryString="select count(*) from Oa as p where p.type=2 and p.status=true";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		long count=(Long)query.uniqueResult();
		int num= (int)count;
		session.close();
		return num;
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
