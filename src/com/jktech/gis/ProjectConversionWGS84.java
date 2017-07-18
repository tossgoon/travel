package com.jktech.gis;

public class ProjectConversionWGS84 extends ProjectConversion {

	public ProjectConversionWGS84() {
		// TODO Auto-generated constructor stub
		 this.a = 6378137;           //2000椭球长半轴  
         this.b = 6356752.3142;      //2000椭球短半轴  
         this.f = 1 / 298.257223563;     //椭球扁率f  
         this.e = 0.0818191908426215;       //第一偏心率  
         this.e2 = 6.6943799901413E-03;   //椭球第一偏心率平方 e2  
         this.e12 = 6.7394967422764E-03;  //椭球第二偏心率平方 e12  
         this.c = 6399593.6257584391;         //极点子午圈曲率半径 c  
         this.p = 206264.806252992;      //弧度秒=180*3600/pi  
         this.pi = 3.1415926535;  
	}
}
