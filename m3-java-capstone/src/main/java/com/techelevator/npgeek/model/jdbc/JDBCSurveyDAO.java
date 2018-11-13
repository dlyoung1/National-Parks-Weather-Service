package com.techelevator.npgeek.model.jdbc;

import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import com.techelevator.npgeek.model.Survey;
import com.techelevator.npgeek.model.dao.SurveyDAO;

@Component
public class JDBCSurveyDAO implements SurveyDAO{
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCSurveyDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<Survey> getSurveyResults() {
		List<Survey> surveys = new ArrayList<Survey>();
		String sqlGetSurveyResults = "SELECT COUNT(survey_result.parkcode), park.parkname, survey_result.parkcode FROM survey_result JOIN park ON park.parkcode = survey_result.parkcode " 
									+ "GROUP BY park.parkname, survey_result.parkcode ORDER BY count DESC, park.parkname ";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetSurveyResults);
		while(results.next()) {
			Survey survey = new Survey();
			survey.setCount(results.getInt("count"));
			survey.setParkCode(results.getString("parkcode"));
			surveys.add(survey);
		}
		return surveys;
	}

	@Override
	public void addSurvey(String parkCode, String email, String state, String activityLevel) {
		String sqlAddSurvey = "INSERT INTO survey_result (parkcode, emailaddress, state, activitylevel) "
							+ "VALUES(?, ?, ?, ?) ";
		this.jdbcTemplate.update(sqlAddSurvey, parkCode, email, state, activityLevel);
	}
	

}
