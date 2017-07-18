package com.jktech.service;
import java.util.List;

import com.jktech.dao.BaseDao;
import com.jktech.pojo.Kcgc;
import com.jktech.pojo.Kczk;
/**
 * ���칤��ҵ���߼���ʵ��
 * */
public class KcgcService<T> {
	
	private BaseDao dao;
	
	//Ϊkcgc������GCJ02����
	public void updateWGS2GCJ02(Integer id,double latGCJ02,double lngGCJ02)
	{
		Kcgc kcgc=dao.getObject(Kcgc.class, id);
		kcgc.setLatGCJ02(latGCJ02);
		kcgc.setLngGCJ02(lngGCJ02);
		dao.updateObject(kcgc);
	}
	
	public List<T> queryKcgcByName(String gcname,Class<T> clazz){
		if(gcname == null || "".equals(gcname))
			return dao.getAllObjects(clazz);
		String queryString = "from Kcgc u where u.name like '%"+gcname+"%'";
		return dao.getObjects(queryString);
	}
	
	public List<Kczk> getZkList(int gcid)
	{
		String queryString="from Kczk zk where zk.gcId="+gcid;
		return dao.getObjects(queryString);
	}
	
	public void addKcgc(T kcgc) throws Exception{
		dao.addObject(kcgc);
	}
	
	public void updateKcgc(T kcgc) throws Exception{
		dao.updateObject(kcgc);
		//����Geometry�ֶ�shape
	}
	
	public void deleteKcgc(int id,Class<T> clazz) throws Exception{
		T kcgc = dao.getObject(clazz, id);
		dao.deleteObject(kcgc);
	}
	
	public T getKcgc(Class<T> clazz, int id){
		return dao.getObject(clazz, id);
	}
	
	public BaseDao getDao() {
		return dao;
	}
	
	public void setDao(BaseDao dao) {
		this.dao = dao;
	}
	
	
}


