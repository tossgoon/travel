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

	// �Ӿ�γ��ת��ΪͶӰ����
	public PointCoord GetBLFromXY() {
		ProjectConversionWGS84 pj = new ProjectConversionWGS84();
		PointCoord ptBL = pj.GetBLFromXY(this);
		return ptBL;
	}

	// ͶӰ����ת��Ϊ��γ��
	public PointCoord GetXYFromBL() {
		ProjectConversionWGS84 pj = new ProjectConversionWGS84();
		PointCoord ptXY = pj.GetXYFromBL(this);
		return ptXY;
	}
}
