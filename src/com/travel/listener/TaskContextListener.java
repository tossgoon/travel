package com.travel.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

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
	public void contextInitialized(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		System.out.println("----��ʼִ��---");
		weathertimer=new AddWeatherTimer();
		weathertimer.ExecutePingTimer();//������ʱ��
	}

}
