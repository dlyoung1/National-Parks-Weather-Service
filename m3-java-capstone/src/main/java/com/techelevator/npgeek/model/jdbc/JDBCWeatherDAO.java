package com.techelevator.npgeek.model.jdbc;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import com.techelevator.npgeek.model.Weather;
import com.techelevator.npgeek.model.dao.WeatherDAO;

@Component
public class JDBCWeatherDAO implements WeatherDAO{

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCWeatherDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Weather> getParkForecast(String parkCode) {
		List<Weather> forecast = new ArrayList<>();
		String sqlGetForecast = "SELECT * FROM weather WHERE parkcode = ? ";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetForecast, parkCode.toUpperCase());
		while(results.next()) {
			Weather parkForecast = new Weather();
			parkForecast.setParkCode(results.getString("parkcode").toLowerCase());
			parkForecast.setFiveDayForecast(results.getString("fivedayforecastvalue"));
			parkForecast.setLowTemp(results.getInt("low"));
			parkForecast.setHighTemp(results.getInt("high"));
			parkForecast.setForecast(results.getString("forecast"));
			forecast.add(parkForecast);
		}
		return forecast;
	}
}
