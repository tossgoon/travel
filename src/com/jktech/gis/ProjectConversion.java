package com.jktech.gis;

public abstract class ProjectConversion implements IProjectConversion {

	protected double a = 6378137; // 2000椭球长半轴
	protected double b = 6356752.3141; // 2000椭球短半轴
	protected double f = 1 / 298.257222101; // 椭球扁率f
	protected double e = 0.0818191910428; // 第一偏心率
	protected double e2 = 6.693421622966E-03; // 椭球第一偏心率平方 e2
	protected double e12 = 6.738525414683E-03; // 椭球第二偏心率平方 e12
	protected double c = 6399593.62586; // 极点子午圈曲率半径 c
	protected double p = 206264.806252992; // 弧度秒=180*3600/pi
	protected double pi = 3.1415926535;

	private boolean mIsBigNumber = true;
	private EnumZone mZone = EnumZone.Zone3;
	private double mL0 = 108;

	public EnumZone getmZone() {
		return mZone;
	}

	public void setmZone(EnumZone mZone) {
		this.mZone = mZone;
	}

	public double getmL0() {
		return mL0;
	}

	public void setmL0(double mL0) {
		this.mL0 = mL0;
	}

	public boolean ismIsBigNumber() {
		return mIsBigNumber;
	}

	public void setmIsBigNumber(boolean mIsBigNumber) {
		this.mIsBigNumber = mIsBigNumber;
	}

	public ProjectConversion() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public PointCoord GetBLFromXY(PointCoord pt) {
		// TODO Auto-generated method stub
		// 去掉大数和东移500公里
		double x = pt.getX();
		double y = pt.getY();
		double B, L;
		double y1 = y - 500000.0;
		if (this.ismIsBigNumber()) {
			y1 = y1 - (this.getmL0() / (int) this.getmZone().getZone() * 1000000);
		}
		y = y1;
		double l0 = this.getmL0() * 3600;
		double e4 = Math.pow(e2, 2); // e2 * e2;
		double e6 = Math.pow(e2, 3); // e4 * e2;
		double e8 = Math.pow(e2, 4); // e6 * e2;
		double e10 = Math.pow(e2, 5); // e8 * e2;
		double e_12 = Math.pow(e2, 6); // e10 * e2;

		double A1 = 1 + 3 * e2 / 4 + 45 * e4 / 64 + 175 * e6 / 256 + 11025 * e8 / 16384 + 43659 * e10 / 65536 + 693693 * e_12 / 1048576;  
		double B1 = 3 * e2 / 8 + 15 * e4 / 32 + 525 * e6 / 1024 + 2205 * e8 / 4096 + 72765 * e10 / 131072 + 297297 * e_12 / 524288;  
		double C1 = 15 * e4 / 256 + 105 * e6 / 1024 + 2205 * e8 / 16384 + 10395 * e10 / 65536 + 1486485 * e_12 / 8388608;  
		double D1 = 35 * e6 / 3072 + 105 * e8 / 4096 + 10395 * e10 / 262144 + 55055 * e_12 / 1048576;  
		double E1 = 315 * e8 / 131072 + 3465 * e10 / 524288 + 99099 * e_12 / 8388608;  
		double F1 = 693 * e10 / 1310720 + 9009 * e_12 / 5242880;  
		double G1 = 1001 * e_12 / 8388608;  
		 //求底点纬度值Bf  
        double B0 = x / (a * (1 - e2) * A1);  
        double Bf = 0.0;  
        double FB = 0.0;  
        double FB1 = 0.0;  
        double a0 = a * (1 - e2);  
        double delta = Math.abs(Bf - B0);  
        while (delta > 4.8E-11)   //0.000000000048M  
        {  
            Bf = B0;  
            FB = a0 * (A1 * Bf - B1 * Math.sin(2 * Bf) + C1 * Math.sin(4 * Bf) - D1 * Math.sin(6 * Bf) + E1 * Math.sin(8 * Bf) - F1 * Math.sin(10 * Bf) + G1 * Math.sin(12 * Bf));  
            FB1 = a0 * (A1 - 2 * B1 * Math.cos(2 * Bf) + 4 * C1 * Math.cos(4 * Bf) - 6 * D1 * Math.cos(6 * Bf) + 8 * E1 * Math.cos(8 * Bf) - 10 * F1 * Math.cos(10 * Bf) + 12 * G1 * Math.cos(12 * Bf));  
            B0 = Bf + (x - FB) / FB1;  
            //  
            delta = Math.abs(Bf - B0);  
        }  
        //  
        double sinBf = Math.sin(Bf);  
        double sinBf2 = sinBf * sinBf;  
        double W = Math.sqrt(1 - e2 * sinBf2);  
        double W3 = W * W * W;  
        double N = a / W;  
        double t = Math.tan(Bf);  
        double t2 = t * t;  
        double t4 = t2 * t2;  
        double cosBf = Math.cos(Bf);  
        double cosBf2 = cosBf * cosBf;  
        double yy = e12 * cosBf2;   //η2  
        double Mf = a0 / W3;  
        //  
        double y_N = y / N;  
        double y_N2 = y_N * y_N;  
        double y_N4 = y_N2 * y_N2;  
        //  
        //计算经伟度值B,L  
        double t_B = Bf*p  - (p * t / (2 * Mf) * y * y_N) * (1 - (5 + 3 * t2 + yy - 9 * yy * t2) * y_N2 + (61 + 90 * t2 + 45 * t4) * y_N4 / 360);  
        double t_L = (p / cosBf) * y_N * (1 - (1 + 2 * t2 + yy) * y_N2 / 6 + (5 + 28 * t2 + 24 * t4 + 6 * yy + 8 * yy * t2) * y_N4 / 120);  
        //  
        L = t_L + l0;  
        //  
        B = t_B / 3600;   //转为度  
        L = L / 3600;   //转为度 
		
		return new PointCoord(B,L);
	}

	@Override
	public PointCoord GetXYFromBL(PointCoord pt) {
		// TODO Auto-generated method stub
		//计算临时值  
		double B=pt.getX();
		double L=pt.getY();
		double x,y;
	
        double e4 = Math.pow(e2, 2); // e2 * e2;  
        double e6 = Math.pow(e2, 3); //e4 * e2;  
        double e8 = Math.pow(e2, 4); //e6 * e2;  
        double e10 = Math.pow(e2, 5); //e8 * e2;  
        double e_12 = Math.pow(e2, 6); //e10 * e2;  
        //  
        double A1 = 1 + 3 * e2 / 4 + 45 * e4 / 64 + 175 * e6 / 256 + 11025 * e8 / 16384 + 43659 * e10 / 65536 + 693693 * e_12 / 1048576;  
        double B1 = 3 * e2 / 8 + 15 * e4 / 32 + 525 * e6 / 1024 + 2205 * e8 / 4096 + 72765 * e10 / 131072 + 297297 * e_12 / 524288;  
        double C1 = 15 * e4 / 256 + 105 * e6 / 1024 + 2205 * e8 / 16384 + 10395 * e10 / 65536 + 1486485 * e_12 / 8388608;  
        double D1 = 35 * e6 / 3072 + 105 * e8 / 4096 + 10395 * e10 / 262144 + 55055 * e_12 / 1048576;  
        double E1 = 315 * e8 / 131072 + 3465 * e10 / 524288 + 99099 * e_12 / 8388608;  
        double F1 = 693 * e10 / 1310720 + 9009 * e_12 / 5242880;  
        double G1 = 1001 * e_12 / 8388608;  
        //  
        double l0 = this.getmL0() * 3600;  //中央子午线 度转为秒值 如=105*3600  
        double LL = L * 3600;                   //转为秒值  
        //  
        double t_B = B * this.pi / 180;     //转为弧度值  b  
        double t_L = (LL - l0) / p;          //转为秒值    l  
        double L2 = Math.pow(t_L, 2);// t_L * t_L;  
        double L4 = Math.pow(t_L, 4);// L2 * L2;  
        //  
        double sinB = Math.sin(t_B);  
        double sinB2 = sinB * sinB;  
        double W = Math.sqrt(1 - e2 * sinB2);  
        //double W3 = pow(W, 3);// W * W * W;  
        double N = a / W;  
        double t = Math.tan(t_B);  
        double t2 = t * t;  
        double t4 = t2 * t2;  
        double cosB = Math.cos(t_B);  
        double cosB2 = cosB * cosB;  
        double cosB4 = cosB2 * cosB2;  
        double y2 = e12 * cosB2;   //η2  
        double y4 = y2 * y2;  
        //  
        double l_p = t_L;  //t_L/p;  //上面t_L已经除了p值,这里就不再除p值  
        double l2_p2 = L2;   //l2/(p*p);  
        double l4_p4 = L4;   //l4/(p*p*p*p);  
        //  
        double a0 = a * (1 - e2);  
        //计算子午弧长公式xx  
        double xx = a0 * (A1 * t_B - B1 * Math.sin(2 * t_B) + C1 * Math.sin(4 * t_B) - D1 * Math.sin(6 * t_B) + E1 * Math.sin(8 * t_B) - F1 * Math.sin(10 * t_B) + G1 * Math.sin(12 * t_B));  
        //计度平面坐标值x,y  
        x = xx + N * t * cosB2 * l2_p2 * (0.5 + (5 - t2 + 9 * y2 + 4 * y4) * cosB2 * l2_p2 / 24 + (61 - 58 * t2 + t4) * cosB4 * l4_p4 / 720);  
        y = N * cosB * l_p * (1 + (1 - t2 + y2) * cosB2 * l2_p2 / 6 + (5 - 18 * t2 + t4 + 14 * y2 - 58 * y2 * t2) * cosB4 * l4_p4 / 120);  
        //  
        if (this.ismIsBigNumber() == true)  //转为高斯投影是大数投影吗？即Zone 35带数  （小数投影为CM_105E)  
        {  
            y = y + (this.getmL0() / this.getmZone().getZone()) * 1000000;  
        }  
        y = y + 500000.0;  
        return new PointCoord(x,y);
	}

}
