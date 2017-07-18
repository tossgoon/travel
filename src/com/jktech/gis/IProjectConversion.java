package com.jktech.gis;

public interface IProjectConversion {
	PointCoord GetBLFromXY(PointCoord p);  
    PointCoord GetXYFromBL(PointCoord p);  
}