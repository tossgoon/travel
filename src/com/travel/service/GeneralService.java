package com.travel.service;
import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.travel.dao.BaseDao;
import com.travel.pojo.Animalsurvey;
import com.travel.pojo.Camerasurvey;
import com.travel.pojo.Chicksurvey;
import com.travel.pojo.Importinfo;
import com.travel.pojo.Plantsurvey;
import com.travel.pojo.Portal;
import com.travel.pojo.Protectrecord;

public class GeneralService<T> {

	private BaseDao dao;

	public GeneralService() {
		// TODO Auto-generated constructor stub
	}

	public void addObject(T Dept) throws Exception {
		dao.addObject(Dept);
	}

	public void updateObject(T Dept) throws Exception {
		dao.updateObject(Dept);
	}

	public void deleteObject(int id, Class<T> Dept) throws Exception {
		T dept = dao.getObject(Dept, id);
		dao.deleteObject(dept);
	}

	public T getObject(Class<T> dept, int id) {
		return dao.getObject(dept, id);
	}

	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}
	
	public List<T> getObjectList(Class<T> clazz){
		return dao.getAllObjects(clazz);
	}
	
	@SuppressWarnings("unchecked")
	public List<Animalsurvey> getAnimalListPage(Timestamp begindate,Timestamp enddate,int pagesize,int pagenum)
	{
		String queryString="from Animalsurvey p where p.tianbiaoshijian>=:paramdate1 and p.tianbiaoshijian<=:paramdate2 order by p.tianbiaoshijian desc";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setTimestamp("paramdate1", begindate);
		query.setTimestamp("paramdate2", enddate);
		query.setFirstResult((pagenum-1)*pagesize);
		query.setMaxResults(pagesize);
		List<Animalsurvey>list=(List<Animalsurvey>)query.list();
		session.close();
		return list;
	}
	public int getAnimalCount(Timestamp begindate,Timestamp enddate) {
		String queryString = "select count(*) from Animalsurvey p where p.tianbiaoshijian>=:paramdate1 and p.tianbiaoshijian<=:paramdate2";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setTimestamp("paramdate1", begindate);
		query.setTimestamp("paramdate2", enddate);
		long count = (Long) query.uniqueResult();
		int num = (int) count;
		session.close();
		return num;
	}
	public List<Animalsurvey> getAnimalList(Timestamp begindate,Timestamp enddate)
	{
		String queryString="from Animalsurvey p where p.tianbiaoshijian>=:paramdate1 and p.tianbiaoshijian<=:paramdate2 order by p.tianbiaoshijian desc";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setTimestamp("paramdate1", begindate);
		query.setTimestamp("paramdate2", enddate);
		@SuppressWarnings("unchecked")
		List<Animalsurvey>list=(List<Animalsurvey>)query.list();
		session.close();
		return list;
	}
	@SuppressWarnings("unchecked")
	public List<Camerasurvey> getCameraListPage(Timestamp begindate,Timestamp enddate,int pagesize,int pagenum)
	{
		System.out.println(begindate);
		System.out.println(enddate);
		
		String queryString="from Camerasurvey p where p.anzhuangriqi>=:paramdate1 and p.anzhuangriqi<=:paramdate2 order by p.anzhuangriqi desc";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setTimestamp("paramdate1", begindate);
		query.setTimestamp("paramdate2", enddate);
		query.setFirstResult((pagenum-1)*pagesize);
		query.setMaxResults(pagesize);
		List<Camerasurvey>list=(List<Camerasurvey>)query.list();
		session.close();
		return list;
	}
	public int getCameraCount(Timestamp begindate,Timestamp enddate) {
		String queryString = "select count(*) from Camerasurvey p where p.anzhuangriqi>=:p1 and p.anzhuangriqi<=:p2";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setTimestamp("p1", begindate);
		query.setTimestamp("p2", enddate);
		long count = (Long) query.uniqueResult();
		int num = (int) count;
		session.close();
		return num;
	}
	public List<Camerasurvey> getCameraList(Timestamp begindate,Timestamp enddate)
	{
		String queryString="from Camerasurvey p where p.anzhuangriqi>=:p1 and p.anzhuangriqi<=:p2 order by p.anzhuangriqi desc";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setTimestamp("p1", begindate);
		query.setTimestamp("p2", enddate);
		@SuppressWarnings("unchecked")
		List<Camerasurvey>list=(List<Camerasurvey>)query.list();
		session.close();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Chicksurvey> getChickListPage(Timestamp begindate,Timestamp enddate,int pagesize,int pagenum)
	{
		String queryString="from Chicksurvey p where p.tianbiaoshijian>=:paramdate1 and p.tianbiaoshijian<=:paramdate2 order by p.tianbiaoshijian desc";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setTimestamp("paramdate1", begindate);
		query.setTimestamp("paramdate2", enddate);
		query.setFirstResult((pagenum-1)*pagesize);
		query.setMaxResults(pagesize);
		List<Chicksurvey>list=(List<Chicksurvey>)query.list();
		session.close();
		return list;
	}
	public int getChickCount(Timestamp begindate,Timestamp enddate) {
		String queryString = "select count(*) from Chicksurvey p where p.tianbiaoshijian>=:paramdate1 and p.tianbiaoshijian<=:paramdate2";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setTimestamp("paramdate1", begindate);
		query.setTimestamp("paramdate2", enddate);
		long count = (Long) query.uniqueResult();
		int num = (int) count;
		session.close();
		return num;
	}
	public List<Chicksurvey> getChickList(Timestamp begindate,Timestamp enddate)
	{
		String queryString="from Chicksurvey p where p.tianbiaoshijian>=:paramdate1 and p.tianbiaoshijian<=:paramdate2 order by p.tianbiaoshijian desc";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setTimestamp("paramdate1", begindate);
		query.setTimestamp("paramdate2", enddate);
		@SuppressWarnings("unchecked")
		List<Chicksurvey>list=(List<Chicksurvey>)query.list();
		session.close();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Importinfo> getImportListPage(Timestamp begindate,Timestamp enddate,int pagesize,int pagenum)
	{
		String queryString="from Importinfo p where p.tianxieshijian>=:paramdate1 and p.tianxieshijian<=:paramdate2 order by p.tianxieshijian desc";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setTimestamp("paramdate1", begindate);
		query.setTimestamp("paramdate2", enddate);
		query.setFirstResult((pagenum-1)*pagesize);
		query.setMaxResults(pagesize);
		List<Importinfo>list=(List<Importinfo>)query.list();
		session.close();
		return list;
	}
	public int getImportCount(Timestamp begindate,Timestamp enddate) {
		String queryString = "select count(*) from Importinfo p where p.tianxieshijian>=:paramdate1 and p.tianxieshijian<=:paramdate2";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setTimestamp("paramdate1", begindate);
		query.setTimestamp("paramdate2", enddate);
		long count = (Long) query.uniqueResult();
		int num = (int) count;
		session.close();
		return num;
	}
	public List<Importinfo> getImportList(Timestamp begindate,Timestamp enddate)
	{
		String queryString="from Importinfo p where p.tianxieshijian>=:paramdate1 and p.tianxieshijian<=:paramdate2 order by p.tianxieshijian desc";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setTimestamp("paramdate1", begindate);
		query.setTimestamp("paramdate2", enddate);
		@SuppressWarnings("unchecked")
		List<Importinfo>list=(List<Importinfo>)query.list();
		session.close();
		return list;
	}
	@SuppressWarnings("unchecked")
	public List<Plantsurvey> getPlantListPage(Timestamp begindate,Timestamp enddate,int pagesize,int pagenum)
	{
		String queryString="from Plantsurvey p where p.tianbiaoshijian>=:paramdate1 and p.tianbiaoshijian<=:paramdate2 order by p.tianbiaoshijian desc";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setTimestamp("paramdate1", begindate);
		query.setTimestamp("paramdate2", enddate);
		query.setFirstResult((pagenum-1)*pagesize);
		query.setMaxResults(pagesize);
		List<Plantsurvey>list=(List<Plantsurvey>)query.list();
		session.close();
		return list;
	}
	public int getPlantCount(Timestamp begindate,Timestamp enddate) {
		String queryString = "select count(*) from Plantsurvey p where p.tianbiaoshijian>=:paramdate1 and p.tianbiaoshijian<=:paramdate2";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setTimestamp("paramdate1", begindate);
		query.setTimestamp("paramdate2", enddate);
		long count = (Long) query.uniqueResult();
		int num = (int) count;
		session.close();
		return num;
	}
	public List<Plantsurvey> getPlantList(Timestamp begindate,Timestamp enddate)
	{
		String queryString="from Plantsurvey p where p.tianbiaoshijian>=:paramdate1 and p.tianbiaoshijian<=:paramdate2 order by p.tianbiaoshijian desc";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setTimestamp("paramdate1", begindate);
		query.setTimestamp("paramdate2", enddate);
		@SuppressWarnings("unchecked")
		List<Plantsurvey>list=(List<Plantsurvey>)query.list();
		session.close();
		return list;
	}
	@SuppressWarnings("unchecked")
	public List<Protectrecord> getProtectListPage(Timestamp begindate,Timestamp enddate,int pagesize,int pagenum)
	{
		String queryString="from Protectrecord p where p.shijian>=:paramdate1 and p.shijian<=:paramdate2 order by p.shijian desc";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setTimestamp("paramdate1", begindate);
		query.setTimestamp("paramdate2", enddate);
		query.setFirstResult((pagenum-1)*pagesize);
		query.setMaxResults(pagesize);
		List<Protectrecord>list=(List<Protectrecord>)query.list();
		session.close();
		return list;
	}
	public int getProtectCount(Timestamp begindate,Timestamp enddate) {
		String queryString = "select count(*) from Protectrecord p where p.shijian>=:paramdate1 and p.shijian<=:paramdate2";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setTimestamp("paramdate1", begindate);
		query.setTimestamp("paramdate2", enddate);
		long count = (Long) query.uniqueResult();
		int num = (int) count;
		session.close();
		return num;
	}
	public List<Protectrecord> getProtectList(Timestamp begindate,Timestamp enddate)
	{
		String queryString="from Protectrecord p where p.shijian>=:paramdate1 and p.shijian<=:paramdate2 order by p.shijian desc";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setTimestamp("paramdate1", begindate);
		query.setTimestamp("paramdate2", enddate);
		@SuppressWarnings("unchecked")
		List<Protectrecord>list=(List<Protectrecord>)query.list();
		session.close();
		return list;
	}
}
