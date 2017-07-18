package com.jktech.gis;

public enum EnumZone {

	Zone3(3), Zone6(6);
	private final int zone;

	public int getZone() {
		return zone;
	}

	private EnumZone(int zone) {
		this.zone = zone;
	}
}
