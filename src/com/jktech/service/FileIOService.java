package com.jktech.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.util.Date;

import org.apache.struts2.ServletActionContext;

import com.jktech.pojo.GcAttach;
import com.jktech.pojo.Kcgc;

public class FileIOService {

	private int attid;
	private GcAttachService<GcAttach> gcAttachService;
	private KcgcService<Kcgc> kcgcService;

	public int getAttid() {
		return attid;
	}

	public void setAttid(int attid) {
		this.attid = attid;
	}

	public KcgcService<Kcgc> getKcgcService() {
		return kcgcService;
	}

	public void setKcgcService(KcgcService<Kcgc> kcgcService) {
		this.kcgcService = kcgcService;
	}

	public GcAttachService<GcAttach> getGcAttachService() {
		return gcAttachService;
	}

	public void setGcAttachService(GcAttachService<GcAttach> gcAttachService) {
		this.gcAttachService = gcAttachService;
	}

	public FileIOService() {
		// TODO Auto-generated constructor stub
	}

	public InputStream getFileInput() throws FileNotFoundException {
		GcAttach gcAttach = gcAttachService.getGcAttach(GcAttach.class, attid);
		int gcid = gcAttach.getGcid();
		String gctype = gcAttach.getTbtype().toLowerCase();
		boolean isAllowDown = false;
		if (gctype.equals("kc")) {
			Kcgc kcgc = kcgcService.getKcgc(Kcgc.class, gcid);
			isAllowDown = kcgc.getYunxuxiazai() == 1 ? true : false;
		}
		// �����������
		if (isAllowDown) {
			return ServletActionContext.getServletContext()
					.getResourceAsStream(
							"attachFiles/" + gcAttach.getFilesavename());
		} else {
			return null;
		}
	}

	public GcAttach uploadFile(String fileName, String tbtype, int gcid,
			File fileData) throws Exception {
		// 0.�ж��û��Ƿ���Ȩ���ϴ�
		// 1.���渽�����ݵ����ݿ�
		GcAttach gcAttach = new GcAttach();
		gcAttach.setFilename(fileName);
		gcAttach.setTbtype(tbtype);
		gcAttach.setGcid(gcid);
		gcAttach.setShangchuandate(new Timestamp(new Date().getTime()));
		gcAttachService.addGcAttach(gcAttach);// ��������
		// 2.�ϴ��ļ�
		String path = ServletActionContext.getServletContext().getRealPath(
				"/attachFiles");
		InputStream is = new FileInputStream(fileData);
		String filetype = fileName.substring(fileName.lastIndexOf("."));
		OutputStream os = new FileOutputStream(new File(path, gcAttach.getId()
				.toString() + filetype));
		// ��Ϊfile�Ǵ������ʱ�ļ��е��ļ������ǿ��Խ����ļ������ļ�·����ӡ����������֮ǰ��fileFileName�Ƿ���ͬ
		byte[] buffer = new byte[1024 * 1024];
		int length = 0;
		while (-1 != (length = is.read(buffer, 0, buffer.length))) {
			os.write(buffer);
		}
		os.close();
		is.close();
		return gcAttach;
	}
}
