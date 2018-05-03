package tdi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import tdi.dao.LuasDao;


public class Volume implements VolService{
	@Autowired
	private LuasDao luas;
	
	public double hitungLuasTinggi(double panjang, double lebar,double tinggi) {
		System.out.println(" luas  = "+luas.hitungLuas(panjang, lebar));
		return luas.hitungLuas(panjang, lebar)*tinggi;
	}
	

}
