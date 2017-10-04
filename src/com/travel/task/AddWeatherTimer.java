package com.travel.task;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;


public class AddWeatherTimer {

	// 时间间隔
	private ScheduledExecutorService scheduler = Executors
			.newScheduledThreadPool(1);
	private AddWeatherTask addweather = new AddWeatherTask();

	public AddWeatherTimer() {
		// TODO Auto-generated constructor stub

	}

	public void ExecutePingTimer() {
		Runnable task = new Runnable() {
			@Override
			public void run() {
				// TODO Auto-generated method stub
				try {
					// 执行增加天气的操作
					addweather.ExeAddWeather();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		};
		// 执行后检查一下设置的时间间隔
		int exeInterval = 7200;
		/*try {
			// 从数据库中取得时间
			// ISettingDAO settingDAO = DAOFactory.getSettingDAOInstance();
			// Setting setting = settingDAO.queryByItem("interval");
			// exeInterval=setting.getValue();//分钟
			// exeInterval=exeInterval*60;//换算成秒
			// 从配置文件中取得时间
			String path = AddWeatherTask.class.getResource("setting.properties").getFile().toString();
			InputStream in;
			in = new FileInputStream(new File(path));
			Properties property = new Properties();
			property.load(in);
			String interval = property.getProperty("interval");
			exeInterval = Integer.parseInt(interval);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}*/
		// 获取设置的时间（秒）
		if (scheduler.isShutdown()) {
			scheduler = Executors.newScheduledThreadPool(1);
			scheduler.scheduleAtFixedRate(task, 10, exeInterval,
					TimeUnit.SECONDS);
		} else {
			scheduler.scheduleAtFixedRate(task, 10, exeInterval,
					TimeUnit.SECONDS);
		}
	}

	public void stop() {
		scheduler.shutdown();
	}
}
