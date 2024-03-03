package com.el;

public class Compute {
	
	public static int sum(String x,String y) {
		return Integer.parseInt(x) + Integer.parseInt(y);
	}
	public static int sub(String x,String y) {
		return Integer.parseInt(x) - Integer.parseInt(y);
	}
	public static int mul(String x,String y) {
		return Integer.parseInt(x) * Integer.parseInt(y);
	}
	public static double div(String x,String y) {
		return Double.parseDouble(x) / Double.parseDouble(y);
	}
	
	
	
}
