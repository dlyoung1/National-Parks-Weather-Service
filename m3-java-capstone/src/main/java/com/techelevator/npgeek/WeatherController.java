package com.techelevator.npgeek;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.techelevator.npgeek.model.Weather;
import com.techelevator.npgeek.model.dao.WeatherDAO;

@Controller
public class WeatherController {
	
	@Autowired
	private WeatherDAO weather;
	
	@RequestMapping(path="/weather", method=RequestMethod.GET)
	public String displayWeatherForecast(ModelMap map,
										@RequestParam String parkCode) {
		List<Weather> forecast = weather.getParkForecast(parkCode);
		map.put("forecast", forecast);
		return "weather";
	}


}
