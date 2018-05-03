package tdi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import tdi.dao.LuasDao;

@Component("volService")
public class VolumeDua implements VolService{
	@Autowired
	private LuasDao luas;
	
	public double hitungLuasTinggi(double panjang, double lebar,double tinggi) {
		System.out.println(" luas dua  = "+luas.hitungLuas(panjang, lebar));
		return luas.hitungLuas(panjang, lebar)*tinggi*0.5;
	}
	
}
