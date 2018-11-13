package com.techelevator.npgeek;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.Survey;
import com.techelevator.npgeek.model.dao.ParkDAO;
import com.techelevator.npgeek.model.dao.SurveyDAO;

@Controller
public class SurveyController {
	
	@Autowired
	private SurveyDAO survey;
	@Autowired
	private ParkDAO park;
	
	@RequestMapping(path="/surveyInput", method=RequestMethod.GET)
	public String showSurveyInput(ModelMap map) {
		List<Park> parks = park.getAllParks();
		map.put("parks", parks);
		return "surveyInput";
	}
	
	@RequestMapping(path="/surveyInput", method=RequestMethod.POST)
	public String processSurveyInput(@RequestParam String parkCode,
									@RequestParam String email,
									@RequestParam String state,
									@RequestParam String activityLevel) {
		survey.addSurvey(parkCode.toUpperCase(), email, state, activityLevel);
		return "redirect:/surveyResult";
	}
	
	@RequestMapping(path="/surveyResult", method=RequestMethod.GET)
	public String showSurveyResult(ModelMap map) {
		List<Survey> surveys = survey.getSurveyResults();
		List<Park> parks = new ArrayList<>();
		for(int i = 0; i < surveys.size(); i++) {
			Park parkDetails = park.getParkDetails(surveys.get(i).getParkCode());
			parks.add(parkDetails);
		}
		map.put("parks",  parks);
		map.put("surveys", surveys);
		return "surveyResult";
	}

}
