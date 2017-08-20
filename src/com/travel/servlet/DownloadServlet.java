package com.travel.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

public class DownloadServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5473500076397270202L;
	/**
	 * 
	 */
	public DownloadServlet() {
		// TODO Auto-generated constructor stub
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 处理请求
		// 读取要下载的文件
		//String rootpath=ServletActionContext.getServletContext().getRealPath("\\");
		String rootpath=ServletActionContext.getServletContext().getRealPath("\\").replace("\\webapps\\travel","");
		//InputStream ist=ServletActionContext.getServletContext().getResourceAsStream(realpath);
		//InputStream ist=new FileInputStream(realpath);
		//InputStream	ist=ServletActionContext.getServletContext().getResourceAsStream("uploadFiles/20170729162413408.jpg");
		//return ist;
		String filename=request.getParameter("filename");//实际存储文件名
		File f = new File(rootpath+"\\"+filename);
		if (f.exists()) {
			FileInputStream fis = new FileInputStream(f);
			String filename2 =URLEncoder.encode( request.getParameter("filename2"), "utf-8");
			//打开指定文件的流信息    
			/*OutputStream outputStream = response.getOutputStream();
			InputStream inputStream = new FileInputStream(filepath+filename);
			byte[] buffer = new byte[1024];
			int i = -1;
			while ((i = inputStream.read(buffer)) != -1) {
			    outputStream.write(buffer, 0, i);
			}*/
			//fis.read(b);
			response.setCharacterEncoding("utf-8");
			response.setHeader("Content-Disposition", "attachment; filename="
					+ filename2 + "");
			// 获取响应报文输出流对象
			ServletOutputStream out = response.getOutputStream();
			// 输出
			//out.write(b);
			
			byte[] buffer = new byte[1024];
			int i = -1;
			while ((i = fis.read(buffer)) != -1) {
			    out.write(buffer, 0, i);
			}
			out.flush();
			out.close();
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}
	
}
