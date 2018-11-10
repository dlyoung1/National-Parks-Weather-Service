package com.techelevator.npgeek.model;

public class Weather {

	private String parkCode;
	private String fiveDayForecast;
	private int lowTemp;
	private int highTemp;
	private String forecast;
	
	public String getParkCode() {
		return parkCode;
	}
	public void setParkCode(String parkCode) {
		this.parkCode = parkCode;
	}
	public String getFiveDayForecast() {
		return fiveDayForecast;
	}
	public void setFiveDayForecast(String fiveDayForecast) {
		this.fiveDayForecast = fiveDayForecast;
	}
	public int getLowTemp() {
		return lowTemp;
	}
	public void setLowTemp(int lowTemp) {
		this.lowTemp = lowTemp;
	}
	public int getHighTemp() {
		return highTemp;
	}
	public void setHighTemp(int highTemp) {
		this.highTemp = highTemp;
	}
	public String getForecast() {
		return forecast;
	}
	public void setForecast(String forecast) {
		this.forecast = forecast;
	}
	
}
