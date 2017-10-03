package com.travel.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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

	public List<T> getObjectList(Class<T> clazz) {
		return dao.getAllObjects(clazz);
	}

	@SuppressWarnings("unchecked")
	public List<T> queryWeatherByPage(int pagesize, int pagenum) {
		String queryString = "from Weather p order by p.weatherdate desc";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setFirstResult((pagenum - 1) * pagesize);
		query.setMaxResults(pagesize);
		List<T> list = (List<T>) query.list();
		session.close();
		return list;
	}

	public int getWeatherCount() {
		String queryString = "select count(*) from Weather ";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		long count = (Long) query.uniqueResult();
		int num = (int) count;
		session.close();
		return num;
	}

	@SuppressWarnings("unchecked")
	public List<WeatherView> queryWeatherViewByPage(int pagesize, int pagenum) {
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
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();
		Query query = session.createQuery(queryString);
		query.setFirstResult((pagenum - 1) * pagesize);
		query.setMaxResults(pagesize);
		List<Object[]> list = query.list();
		List<WeatherView> wlist = new ArrayList<WeatherView>();
		for (Object[] weatherview : list) {
			WeatherView w = new WeatherView();
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
			//得到日期格式，而不是时间
			if(weatherview[0]!=null)
			{
				Date s1 = (Date) weatherview[0];
				DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");   
				w.setWeatherday(sdf.format(s1));
			}
			wlist.add(w);
		}
		session.close();
		return wlist;
	}

	public int getWeatherViewCount() {
		String queryString = "select count(distinct weatherdate) from Weather";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		long count = (Long) query.uniqueResult();
		int num = (int) count;
		session.close();
		return num;
	}

	// 获取最高气温 datestr格式为 2013-01-12 cast("23333.3333" as decimal(9,2))
	public double getWeatherTemprature(String datestr) {
		String queryString = "select max(evalue) as tempra  from Weather w where w.ename='空气温度' and Date(weatherdate)=:paramdate";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setString("paramdate", datestr);
		// String tempr=(String) query.uniqueResult();
		Object ovalue = query.uniqueResult();
		double temprd = 0;
		if (ovalue == null) {
			temprd = -9999;
		} else {
			temprd = (Double) ovalue;
		}
		session.close();
		return temprd;
	}

	// 获取8天之内的最近的一次降水量 2013-01-12
	public String getWeatherWater(String datestr) throws ParseException {
		// 计算出8天前
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse(datestr);
		Calendar begindate = Calendar.getInstance();
		begindate.setTime(date);
		begindate.add(Calendar.DATE, -8);

		Calendar enddate = Calendar.getInstance();
		enddate.setTime(date);
		enddate.add(Calendar.DATE, 1);
		// System.out.println(datestr);
		// System.out.println(calendar.getTime());

		String queryString = "select w.weatherdate,w.evalue from Weather w where  w.ename='降雨量' and w.weatherdate=(select max(p.weatherdate) from Weather p where p.ename='降雨量' and p.evalue>0 and  p.weatherdate>=:paramdate1 and p.weatherdate<=:paramdate2)";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setTimestamp("paramdate1", begindate.getTime());
		query.setTimestamp("paramdate2", enddate.getTime());
		String result = "";// 天数,降水量
		List<Object[]> list = query.list();
		if (list.isEmpty()) {
			result = "0,0";
		} else {
			Object[] ov = list.get(0);
			Date s1 = (Date) ov[0];
			Double s2 = (Double) ov[1];
			long waterday = 0;
			long watertime = date.getTime() - s1.getTime();

			if (watertime > 0) {
				waterday = watertime / (24 * 60 * 60 * 1000) + 1;
			} else {
				waterday = 0;
			}
			result = String.valueOf(waterday) + "," + String.valueOf(s2);
		}
		session.close();
		return result;
	}

	// 获取最小相对湿度 datestr格式为 2013-01-12
	public double getWeatherHumidity(String datestr) {
		String queryString = "select min(w.evalue)  from Weather w where w.ename='空气湿度' and Date(weatherdate)=:paramdate";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setString("paramdate", datestr);
		Object ovalue = query.uniqueResult();
		double temprd = 0;
		if (ovalue == null) {
			temprd = -9999;
		} else {
			temprd = (Double) ovalue;
		}
		session.close();
		return temprd;
	}

	// 获取最小相对湿度 datestr格式为 2013-01-12
	public double getWeatherWind(String datestr) {
		String queryString = "select max(w.evalue)  from Weather w where w.ename='风速' and Date(weatherdate)=:paramdate";
		SessionFactory sessionFactory = dao.getHibernateTemplate()
				.getSessionFactory();
		Session session = (Session) sessionFactory.openSession();//
		Query query = session.createQuery(queryString);
		query.setString("paramdate", datestr);
		Object ovalue = query.uniqueResult();
		double temprd = 0;
		if (ovalue == null) {
			temprd = -9999;
		} else {
			temprd = (Double) ovalue;
		}
		session.close();
		return temprd;
	}
}
