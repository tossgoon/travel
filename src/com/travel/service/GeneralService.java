package com.travel.service;
import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.travel.dao.BaseDao;
import com.travel.pojo.Animalsurvey;
import com.travel.pojo.Portal;

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
}
