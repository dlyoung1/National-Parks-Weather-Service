package com.techelevator.npgeek;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.techelevator.npgeek.model.Weather;
import com.techelevator.npgeek.model.dao.WeatherDAO;

@Controller
public class WeatherController {
	
	@Autowired
	private WeatherDAO weather;
	
//	Uses session data to retrieve forecast based on parkCode. Also converts the scale (accesses the DB again to ensure multiple conversions don't affect the accuracy of reported temperature).
	@RequestMapping(path="/weather", method=RequestMethod.GET)
	public String convertTempScale(HttpSession session) {
		List<Weather> forecast = weather.getParkForecast(session.getAttribute("parkCode").toString().toUpperCase());
		if (session.getAttribute("calcScale").equals("C")) {
			for(int i = 0; i < forecast.size(); i++) {
				forecast.get(i).setLowTemp(((forecast.get(i).getLowTemp()) - 32) * 5 / 9);
				forecast.get(i).setHighTemp(((forecast.get(i).getHighTemp()) - 32) * 5 / 9);
			}
			session.setAttribute("calcScale", "F");
			session.setAttribute("displayScale", "C");
			session.setAttribute("forecast", forecast);
			return"weather";
		}
		session.setAttribute("calcScale", "C");
		session.setAttribute("displayScale", "F");
		session.setAttribute("forecast", forecast);
		return "weather";
	}

}
