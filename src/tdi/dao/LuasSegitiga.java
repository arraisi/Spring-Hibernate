package tdi.dao;

import org.springframework.stereotype.Component;


public class LuasSegitiga implements LuasDao {
	public double hitungLuas(double panjang, double lebar) {
		return (panjang * lebar) / 3;
	}
}
