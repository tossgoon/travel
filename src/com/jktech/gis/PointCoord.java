package com.jktech.gis;

public class PointCoord {

	public PointCoord() {
		// TODO Auto-generated constructor stub
	}

	public PointCoord(double x, double y) {
		this.x = x;
		this.y = y;
	}

	private double x;
	private double y;

	public double getX() {
		return x;
	}

	public void setX(double x) {
		this.x = x;
	}

	public double getY() {
		return y;
	}

	public void setY(double y) {
		this.y = y;
	}

	// 从经纬度转换为投影坐标
	public PointCoord GetBLFromXY() {
		ProjectConversionWGS84 pj = new ProjectConversionWGS84();
		PointCoord ptBL = pj.GetBLFromXY(this);
		return ptBL;
	}

	// 投影坐标转换为经纬度
	public PointCoord GetXYFromBL() {
		ProjectConversionWGS84 pj = new ProjectConversionWGS84();
		PointCoord ptXY = pj.GetXYFromBL(this);
		return ptXY;
	}
}
