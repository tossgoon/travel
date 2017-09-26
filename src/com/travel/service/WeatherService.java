package com.travel.service;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.travel.dao.BaseDao;
import com.travel.pojo.Portal;
import com.travel.pojo.WeatherView;

public class WeatherService<T> {

	private BaseDao dao;

	public WeatherService() {
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
	public List<T> queryWeatherByPage(int pagesize,int pagenum){
		String queryString="from Weather p order by p.weatherdate desc";
		SessionFactory sessionFactory = dao.getHibernateTemplate().getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setFirstResult((pagenum-1)*pagesize);
		query.setMaxResults(pagesize);
		List<T>list=(List<T>)query.list();
		session.close();
		return list;
	}
	public int getWeatherCount(){
		String queryString="select count(*) from Weather ";
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
	public List<WeatherView> queryWeatherViewByPage(int pagesize,int pagenum){
		String queryString = "select p.weatherdate,"
				+ "MAX(  CASE  WHEN  ename='降雨量' THEN   evalue  END ) AS jiangyuliang,"
				+ "MAX(  CASE  WHEN ename='空气温度' THEN  evalue  END ) AS kongqiwendu, "
				+ "MAX(  CASE  WHEN ename='空气湿度' THEN  evalue  END ) AS kongqishidu,"
				+ "MAX(  CASE  WHEN  ename='大气压力' THEN   evalue  END  ) AS daqiyali,"
				+ "MAX(  CASE  WHEN ename='光合有效' THEN  evalue  END   ) AS guangheyouxiao, "
				+ "MAX(  CASE  WHEN ename='风向' THEN  evalue  END    ) AS fengxiang,"
				+ "MAX(  CASE  WHEN  ename='紫外辐射' THEN   evalue  END   ) AS ziwaifushe,"
				+ "MAX(  CASE  WHEN ename='土壤酸碱' THEN  evalue  END    ) AS turangsuanjian, "
				+ "MAX(  CASE  WHEN ename='PM25' THEN  evalue  END    ) AS pm25"
				+ " FROM "
				+ " Weather p group by p.weatherdate order by p.weatherdate desc";
		SessionFactory sessionFactory = dao.getHibernateTemplate().getSessionFactory();
		Session session = (Session) sessionFactory.openSession();
		Query query = session.createQuery(queryString);
		query.setFirstResult((pagenum-1)*pagesize);
		query.setMaxResults(pagesize);
		List<Object[]>list=query.list();
		List<WeatherView> wlist=new ArrayList<WeatherView>();
		for (Object[] weatherview : list) {
			WeatherView w=new WeatherView();
			w.setWeatherdatestr(weatherview[0].toString());
			w.setJiangyuliang(weatherview[1].toString());
			w.setKongqiwendu(weatherview[2].toString());
            w.setKongqishidu(weatherview[3].toString());
            w.setDaqiyali(weatherview[4].toString());
            w.setGuangheyouxiao(weatherview[5].toString());
            w.setFengxiang(weatherview[6].toString());
            w.setZiwaifushe(weatherview[7].toString());
            w.setTurangsuanjian(weatherview[8].toString());
            w.setPm25(weatherview[9].toString());
            wlist.add(w);
        }  
		session.close();
		return wlist;
	}
	
	public int getWeatherViewCount(){
		String queryString="select count(distinct weatherdate) from Weather";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		long count=(Long)query.uniqueResult();
		int num= (int)count;
		session.close();
		return num;
	}
	
}
