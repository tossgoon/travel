package com.travel.service;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.travel.dao.BaseDao;
import com.travel.pojo.Portal;

public class DiskfileService<T> {

	private BaseDao dao;

	public DiskfileService() {
		// TODO Auto-generated constructor stub
	}

	public void addDiskfile(T Dept) throws Exception {
		dao.addObject(Dept);
	}

	public void updateDiskfile(T Dept) throws Exception {
		dao.updateObject(Dept);
	}

	public void deleteDiskfile(int id, Class<T> Dept) throws Exception {
		T dept = dao.getObject(Dept, id);
		dao.deleteObject(dept);
	}

	public T getDiskfile(Class<T> dept, int id) {
		return dao.getObject(dept, id);
	}
	
	public List<T> getDiskfileList(Class<T> clazz){
		return dao.getAllObjects(clazz);
	}
	
	@SuppressWarnings("unchecked")
	public List<T> searchDiskfileByPage(int pagesize,int pagenum,int folderid){
		String queryString="from Diskfile p where p.folderid=:param  order by p.uploaddate desc";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setInteger("param", folderid);
		query.setFirstResult((pagenum-1)*pagesize);
		query.setMaxResults(pagesize);
		List<T>list=(List<T>)query.list();
		session.close();
		return list;
	}
	
	public int getDiskfileCount(int folderid){
		String queryString="select count(*) from Diskfile as p where p.folderid=:param";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setInteger("param", folderid);
		long count=(Long)query.uniqueResult();
		int num= (int)count;
		session.close();
		return num;
	}
	
	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}
}