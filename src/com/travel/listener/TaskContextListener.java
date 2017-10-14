package com.travel.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import com.travel.task.AddWeatherTimer;

//������
public class TaskContextListener implements ServletContextListener {

	//PingTimer pingTimer = null;
	private AddWeatherTimer weathertimer;
	

	public TaskContextListener() {
		// TODO Auto-generated constructor stub
		super();
	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		// TODO Auto-generated method stub
		System.out.println("----��ʼִ��---");
		/*weathertimer=new AddWeatherTimer();
		weathertimer.ExecutePingTimer();//������ʱ��
       */		
		WebApplicationContext springContext = WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());  
		weathertimer= (AddWeatherTimer) springContext.getBean("weatherTimer");  
		weathertimer.ExecutePingTimer();
	}
}
