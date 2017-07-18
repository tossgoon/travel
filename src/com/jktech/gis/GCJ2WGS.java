package com.jktech.gis;

public class GCJ2WGS {

	public GCJ2WGS() {
		// TODO Auto-generated constructor stub
	}

	/*
	 * WGS-84：是国际标准，GPS坐标（Google Earth使用、或者GPS模块） GCJ-02：中国坐标偏移标准，Google
	 * Map、高德、腾讯使用 BD-09：百度坐标偏移标准，Baidu Map使用 WGS-84 to GCJ-02
	 * GPS.gcj_encrypt(); GCJ-02 to WGS-84 粗略 GPS.gcj_decrypt(); GCJ-02 to
	 * WGS-84 精确(二分极限法) var threshold = 0.000000001;
	 * 目前设置的是精确到小数点后9位，这个值越小，越精确，但是javascript中，浮点运算本身就不太精确，九位在GPS里也偏差不大了
	 * GSP.gcj_decrypt_exact(); GCJ-02 to BD-09 GPS.bd_encrypt(); BD-09 to
	 * GCJ-02 GPS.bd_decrypt(); 求距离 GPS.distance();
	 */
	private double PI = 3.14159265358979324;
	private double x_pi = 3.14159265358979324 * 3000.0 / 180.0;

	private LatLng Delta(double lat, double lon) {
		double a = 6378245.0; // a: 卫星椭球坐标投影到平面地图坐标系的投影因子。
		double ee = 0.00669342162296594323; // ee: 椭球的偏心率。
		double dLat = this.transformLat(lon - 105.0, lat - 35.0);
		double dLon = this.transformLon(lon - 105.0, lat - 35.0);
		double radLat = lat / 180.0 * this.PI;
		double magic = Math.sin(radLat);
		magic = 1 - ee * magic * magic;
		double sqrtMagic = Math.sqrt(magic);
		dLat = (dLat * 180.0)
				/ ((a * (1 - ee)) / (magic * sqrtMagic) * this.PI);
		dLon = (dLon * 180.0) / (a / sqrtMagic * Math.cos(radLat) * this.PI);
		return new LatLng(dLat, dLon);
	}

	// WGS-84 to GCJ-02
	public LatLng Gcj_encrypt(double wgsLat, double wgsLon) {
		if (this.OutOfChina(wgsLat, wgsLon)) {
			return new LatLng(wgsLat, wgsLon);
		}
		LatLng d = this.Delta(wgsLat, wgsLon);
		return new LatLng(wgsLat + d.getLat(), wgsLon + d.getLng());
	}

	// GCJ-02 to WGS-84
	public LatLng Gcj_decrypt(double gcjLat, double gcjLon) {
		if (this.OutOfChina(gcjLat, gcjLon)) {
			return new LatLng(gcjLat, gcjLon);
		}
		LatLng d = this.Delta(gcjLat, gcjLon);
		return new LatLng(gcjLat - d.getLat(), gcjLon - d.getLng());
	}

	// GCJ-02 to WGS-84 exactly
	public LatLng		Gcj_decrypt_exact (double gcjLat,double gcjLon) {
				double initDelta = 0.01;
				double threshold = 0.000000001;
				double dLat = initDelta, dLon = initDelta;
				double mLat = gcjLat - dLat, mLon = gcjLon - dLon;
				double pLat = gcjLat + dLat, pLon = gcjLon + dLon;
				double wgsLat, wgsLon, i = 0;
				while (true) {
					wgsLat = (mLat + pLat) / 2;
					wgsLon = (mLon + pLon) / 2;
					LatLng tmp = this.Gcj_encrypt(wgsLat, wgsLon);
					dLat = tmp.getLat() - gcjLat;
					dLon = tmp.getLng() - gcjLon;
					if ((Math.abs(dLat) < threshold) && (Math.abs(dLon) < threshold))
						break;

					if (dLat > 0)
						pLat = wgsLat;
					else
						mLat = wgsLat;
					if (dLon > 0)
						pLon = wgsLon;
					else
						mLon = wgsLon;

					if (++i > 10000)
						break;
				}
				// console.log(i);
				return new LatLng(wgsLat,wgsLon);
			}

	// GCJ-02 to BD-09
	public LatLng Bd_encrypt(double gcjLat, double gcjLon) {
		double x = gcjLon, y = gcjLat;
		double z = Math.sqrt(x * x + y * y) + 0.00002 * Math.sin(y * this.x_pi);
		double theta = Math.atan2(y, x) + 0.000003 * Math.cos(x * this.x_pi);
		double bdLon = z * Math.cos(theta) + 0.0065;
		double bdLat = z * Math.sin(theta) + 0.006;
		return new LatLng(bdLat, bdLon);

	}

	// BD-09 to GCJ-02
	public LatLng bd_decrypt(double bdLat, double bdLon) {
		double x = bdLon - 0.0065, y = bdLat - 0.006;
		double z = Math.sqrt(x * x + y * y) - 0.00002 * Math.sin(y * this.x_pi);
		double theta = Math.atan2(y, x) - 0.000003 * Math.cos(x * this.x_pi);
		double gcjLon = z * Math.cos(theta);
		double gcjLat = z * Math.sin(theta);
		return new LatLng(gcjLat, gcjLon);

	}

	// mercatorLat -> y mercatorLon -> x
	public LatLng mercator_encrypt(double wgsLat, double wgsLon) {
		double x = wgsLon * 20037508.34 / 180.;
		double y = Math.log(Math.tan((90. + wgsLat) * this.PI / 360.))
				/ (this.PI / 180.);
		y = y * 20037508.34 / 180.;
		return new LatLng(y, x);
		/*
		 * if ((Math.abs(wgsLon) > 180 || Math.abs(wgsLat) > 90)) return null;
		 * var x = 6378137.0 * wgsLon * 0.017453292519943295; var a = wgsLat *
		 * 0.017453292519943295; var y = 3189068.5 * Math.log((1.0 +
		 * Math.sin(a)) / (1.0 - Math.sin(a))); return {'lat' : y, 'lon' : x};
		 * //
		 */
	}

	// Web mercator to WGS-84
	// mercatorLat -> y mercatorLon -> x
	public LatLng Mercator_decrypt(double mercatorLat, double mercatorLon) {
		double x = mercatorLon / 20037508.34 * 180.;
		double y = mercatorLat / 20037508.34 * 180.;
		y = 180 / this.PI
				* (2 * Math.atan(Math.exp(y * this.PI / 180.)) - this.PI / 2);
		return new LatLng(y, x);

		/*
		 * if (Math.abs(mercatorLon) < 180 && Math.abs(mercatorLat) < 90) return
		 * null; if ((Math.abs(mercatorLon) > 20037508.3427892) ||
		 * (Math.abs(mercatorLat) > 20037508.3427892)) return null; var a =
		 * mercatorLon / 6378137.0 * 57.295779513082323; var x = a -
		 * (Math.floor(((a + 180.0) / 360.0)) * 360.0); var y =
		 * (1.5707963267948966 - (2.0 * Math.atan(Math.exp((-1.0 * mercatorLat)
		 * / 6378137.0)))) * 57.295779513082323; return {'lat' : y, 'lon' : x};
		 * //
		 */
	}

	// two point's distance
	public double Distance(double latA, double lonA, double latB, double lonB) {
		double earthR = 6371000.;
		double x = Math.cos(latA * this.PI / 180.)
				* Math.cos(latB * this.PI / 180.)
				* Math.cos((lonA - lonB) * this.PI / 180);
		double y = Math.sin(latA * this.PI / 180.)
				* Math.sin(latB * this.PI / 180.);
		double s = x + y;
		if (s > 1)
			s = 1;
		if (s < -1)
			s = -1;
		double alpha = Math.acos(s);
		double distance = alpha * earthR;
		return distance;
	}

	private boolean OutOfChina(double lat, double lon) {
		if (lon < 72.004 || lon > 137.8347)
			return true;
		if (lat < 0.8293 || lat > 55.8271)
			return true;
		return false;
	}

	private double transformLat(double x, double y) {
		double ret = -100.0 + 2.0 * x + 3.0 * y + 0.2 * y * y + 0.1 * x * y
				+ 0.2 * Math.sqrt(Math.abs(x));
		ret += (20.0 * Math.sin(6.0 * x * this.PI) + 20.0 * Math.sin(2.0 * x
				* this.PI)) * 2.0 / 3.0;
		ret += (20.0 * Math.sin(y * this.PI) + 40.0 * Math.sin(y / 3.0
				* this.PI)) * 2.0 / 3.0;
		ret += (160.0 * Math.sin(y / 12.0 * this.PI) + 320 * Math.sin(y
				* this.PI / 30.0)) * 2.0 / 3.0;
		return ret;
	}

	private double transformLon(double x, double y) {
		double ret = 300.0 + x + 2.0 * y + 0.1 * x * x + 0.1 * x * y + 0.1
				* Math.sqrt(Math.abs(x));
		ret += (20.0 * Math.sin(6.0 * x * this.PI) + 20.0 * Math.sin(2.0 * x
				* this.PI)) * 2.0 / 3.0;
		ret += (20.0 * Math.sin(x * this.PI) + 40.0 * Math.sin(x / 3.0
				* this.PI)) * 2.0 / 3.0;
		ret += (150.0 * Math.sin(x / 12.0 * this.PI) + 300.0 * Math.sin(x
				/ 30.0 * this.PI)) * 2.0 / 3.0;
		return ret;
	}
}
