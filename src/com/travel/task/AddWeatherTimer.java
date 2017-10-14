package com.travel.task;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
public class AddWeatherTimer {

	// ʱ����
	private ScheduledExecutorService scheduler = Executors
			.newScheduledThreadPool(1);
	
	private AddWeatherTask weatherTask;
	
	public AddWeatherTimer() {
		// TODO Auto-generated constructor stub

	}

	public void ExecutePingTimer() {
		Runnable task = new Runnable() {
			@Override
			public void run() {
				// TODO Auto-generated method stub
				try {
					// ִ�����������Ĳ���
					weatherTask.ExeAddWeather();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		};
		// ִ�к���һ�����õ�ʱ����
		int exeInterval = 10800;
		/*try {
			// �����ݿ���ȡ��ʱ��
			// ISettingDAO settingDAO = DAOFactory.getSettingDAOInstance();
			// Setting setting = settingDAO.queryByItem("interval");
			// exeInterval=setting.getValue();//����
			// exeInterval=exeInterval*60;//�������
			// �������ļ���ȡ��ʱ��
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
		// ��ȡ���õ�ʱ�䣨�룩
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

	public AddWeatherTask getWeatherTask() {
		return weatherTask;
	}

	public void setWeatherTask(AddWeatherTask weatherTask) {
		this.weatherTask = weatherTask;
	}
}
