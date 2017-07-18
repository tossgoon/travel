package com.jktech.gis;

import java.io.Console;

public class maintest {

	public maintest() {
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		PointCoord ptCoord = new PointCoord(34.5, 108.5);
		PointCoord ptproj=ptCoord.GetXYFromBL();
		System.out.println(ptproj.getX());
		System.out.println(ptproj.getY());
	}
}
