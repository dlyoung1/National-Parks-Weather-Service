package com.techelevator.npgeek.model.jdbc;

import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.dao.ParkDAO;

@Component
public class JDBCParkDAO implements ParkDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCParkDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Park> getAllParks() {
		List<Park> parks = new ArrayList<Park>();
		String sqlGetAllParks = "SELECT parkcode, parkname, state, parkdescription FROM park ";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllParks);
		while(results.next()) {
			Park park = new Park();
			park.setParkCode(results.getString("parkcode").toLowerCase());
			park.setParkName(results.getString("parkname"));
			park.setParkState(results.getString("state"));
			park.setParkDescription(results.getString("parkdescription"));
			parks.add(park);
		}
		return parks;
	}

	@Override
	public Park getParkDetails(String parkCode) {
		Park park = new Park();
		String sqlParkDetails = "SELECT * FROM park WHERE parkcode = ? ";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlParkDetails, parkCode.toUpperCase());
		while(results.next()) {
			
			park.setParkCode(results.getString("parkcode").toLowerCase());
			park.setParkName(results.getString("parkname"));
			park.setParkState(results.getString("state"));
			park.setAcreage(results.getString("acreage"));
			park.setElevation(results.getInt("elevationinfeet"));
			park.setMilesOfTrail(results.getString("milesoftrail"));
			park.setNumberOfCampsites(results.getInt("numberofcampsites"));
			park.setClimate(results.getString("climate"));
			park.setYearFounded(results.getInt("yearfounded"));
			park.setAnnualVisitorCount(results.getInt("annualvisitorcount"));
			park.setInspirationalQuote(results.getString("inspirationalquote"));
			park.setInspirationalQuoteSource(results.getString("inspirationalquotesource"));
			park.setParkDescription(results.getString("parkdescription"));
			park.setEntryFee(results.getInt("entryfee"));
			park.setNumberOfSpecies(results.getInt("numberofanimalspecies"));
			
		}
		return park;
	}
	
	

}
