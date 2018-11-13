package com.techelevator.npgeek.model.dao;

import java.util.List;
import com.techelevator.npgeek.model.Survey;

public interface SurveyDAO {

	public List<Survey> getSurveyResults();
	public void addSurvey(String parkCode, String email, String state, String activityLevel);
	
}
