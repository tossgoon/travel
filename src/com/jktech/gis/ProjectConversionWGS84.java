package com.jktech.gis;

public class ProjectConversionWGS84 extends ProjectConversion {

	public ProjectConversionWGS84() {
		// TODO Auto-generated constructor stub
		 this.a = 6378137;           //2000���򳤰���  
         this.b = 6356752.3142;      //2000����̰���  
         this.f = 1 / 298.257223563;     //�������f  
         this.e = 0.0818191908426215;       //��һƫ����  
         this.e2 = 6.6943799901413E-03;   //�����һƫ����ƽ�� e2  
         this.e12 = 6.7394967422764E-03;  //����ڶ�ƫ����ƽ�� e12  
         this.c = 6399593.6257584391;         //��������Ȧ���ʰ뾶 c  
         this.p = 206264.806252992;      //������=180*3600/pi  
         this.pi = 3.1415926535;  
	}
}
