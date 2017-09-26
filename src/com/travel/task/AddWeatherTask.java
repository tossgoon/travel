package com.travel.task;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;
//import org.hibernate.mapping.Map;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import java.util.Map;

import com.travel.action.WeatherAction;
import com.travel.pojo.Weather;

public class AddWeatherTask {
	public AddWeatherTask() {
		// TODO Auto-generated constructor stub

	}

	public void ExeAddWeather() throws Exception {
		try {
			// 获取ip列表名单
			/*IIpDAO ipProxy = DAOFactory.getIipDAOInstance();
			List<Ip> ipList = ipProxy.queryAll();
			List<Ping> pingList = new ArrayList<Ping>();
			// 针对每一个 ip进行ping操作，并记录结果
			for (Ip ip : ipList) {
				int timeout = 5000;// 5秒
				boolean status = InetAddress.getByName(ip.getIp()).isReachable(
						timeout);
				int active = (status == true ? 1 : 0);
				Ping ping = new Ping();
				ping.setActive(active);
				ping.setIpid(ip.getId());
				ping.setIpaddress(ip.getIp());
				pingList.add(ping);
			}
			IPingDAO pingProxy = DAOFactory.getPingDAOInstance();
			pingProxy.insertList(pingList);
			*/
			//插入天气信息
			String weinanaurl="http://xsdz.veinasa.cn/intfa/queryData/16053404.json";
			StringBuffer sb = new StringBuffer();
			try {
				java.net.URL url = new java.net.URL(weinanaurl);
				Timestamp currenttime=new Timestamp(new Date().getTime());
				BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream(),"utf-8"));
				String line;
				while ((line = in.readLine()) != null) {
					sb.append(line);
				}
				//System.out.println(sb.toString());
				in.close();
				String weatherdata=sb.toString();//天气信息
				//SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				//获取WeatherAction的bean实例
				String xmlpath = this.getClass().getClassLoader().getResource("").getPath();
		        String filepath = xmlpath + "/applicationContext.xml";
				ApplicationContext apt= new FileSystemXmlApplicationContext(filepath);
				WeatherAction weatherAction=(WeatherAction)apt.getBean("weatherAct");
				//读取JSON数据
				ObjectMapper mapper=new ObjectMapper();
				Map<String,Object> weatherJson=(Map<String, Object>) mapper.readValue(weatherdata, Map.class);
				String status=(String)weatherJson.get("statusCode");
				if(status.equals("200")){
					//200表示下载成功
					List<Map<String, Object>> entity= (List<Map<String, Object>>) weatherJson.get("entity");
					for(int i=0;i<entity.size();i++)
					{
						Map<String,Object> obj=entity.get(i);
						Weather weather=new Weather();
						weather.setEunit((String)obj.get("eUnit"));
						weather.setEname((String)obj.get("eName"));
						weather.setEnum_((String)obj.get("eNum"));
						weather.setEkey((String)obj.get("eKey"));
						weather.setEvalue((String)obj.get("eValue"));
						weather.setWeatherdate(currenttime);
						weatherAction.setWeather(weather);
						weatherAction.add();
					}
				}
			} catch (Exception e) { // Report any errors that arise
				sb.append(e.toString());
				System.err.println(e);
				System.err.println("Usage:   java   HttpClient   <URL>   [<filename>]");
				//setErrormsg(e.getMessage());
				//setWeatherdata(sb.toString());
				//return ERROR;
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
