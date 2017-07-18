package com.jktech.service;

import java.util.ArrayList;
import java.util.List;

import org.aspectj.weaver.ast.And;

import com.jktech.dao.BaseDao;
import com.jktech.pojo.Kctc;

public class KctcService<T> {

	private BaseDao dao;

	public KctcService() {
		// TODO Auto-generated constructor stub
	}

	public void addKctc(T Kctc) throws Exception {
		dao.addObject(Kctc);
	}

	public void updateKctc(T Kctc) throws Exception {
		dao.updateObject(Kctc);
	}

	public void deleteKctc(int id, Class<T> Kctc) throws Exception {
		T kctc = dao.getObject(Kctc, id);
		dao.deleteObject(kctc);
	}

	public T getKctc(Class<T> Kctc, int id) {
		return dao.getObject(Kctc, id);
	}

	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	public List<Kctc> queryKctcByZkid(int zkid) {
		String queryString = "select tc.id,tc.pingjunbosu,tc.pingjunzhuijianzl,tc.pingjuncebimzl,tc.pingjunbiguanrzl,tc.beizhu,tc.dcId, tc.cengdiDepth,dcxx.dicengName as tcname from Kctc tc,Kcdcxx dcxx where tc.zkId= "
				+ zkid + " and tc.dcId=dcxx.id order by tc.cengdiDepth";
		List<T> rList = dao.getObjects(queryString);
		List<Kctc> tcList = new ArrayList<Kctc>();
		for (int i = 0; i < rList.size(); i++) {
			Object[] object = (Object[]) rList.get(i);// 每行记录不在是一个对象 而是一个数组
			Integer id = 0;
			Double pingjunbosu = 0.0;
			Double pingjunzhuijianzl = 0.0;
			Double pingjuncebimzl = 0.0;
			Double pingjunbiguanrzl = 0.0;
			String beizhu = "";
			Integer dcid = 0;
			Double cddepth = 0.0;
			String tcname = "";
			if (null != object[0]) {
				id = (Integer) object[0];
			}
			if (null != object[1]) {
				pingjunbosu = (Double) object[1];
			}
			if (null != object[2]) {
				pingjunzhuijianzl = (Double) object[2];
			}
			if (null != object[3]) {
				pingjuncebimzl = (Double) object[3];
			}
			if (null != object[4]) {
				pingjunbiguanrzl = (Double) object[4];
			}
			beizhu = (String) object[5];
			if (null != object[6]) {
				dcid = (Integer) object[6];
			}
			if (null != object[7]) {
				cddepth = (Double) object[7];
			}
			tcname = (String) object[8];
			Kctc tc = new Kctc();
			tc.setId(id);
			tc.setBeizhu(beizhu);
			tc.setPingjunbiguanrzl(pingjunbiguanrzl);
			tc.setPingjunbosu(pingjunbosu);
			tc.setPingjuncebimzl(pingjuncebimzl);
			tc.setPingjunzhuijianzl(pingjunzhuijianzl);
			tc.setTcname(tcname);
			tc.setCengdiDepth(cddepth);
			tc.setDcId(dcid);
			tcList.add(tc);
		}
		return tcList;
		// return dao.getObjects(queryString);
	}

}
