package com.techelevator.npgeek;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
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
	
	//get instance of surveyDAO and parkDAO
	@Autowired
	private SurveyDAO survey;
	@Autowired
	private ParkDAO park;
	
	//surveyInput has access to the park database for form input
	@RequestMapping(path="/surveyInput", method=RequestMethod.GET)
	public String showSurveyInput(ModelMap map) {
		List<Park> parks = park.getAllParks();
		map.put("parks", parks);
		return "surveyInput";
	}
	
	//email post of surveyInput is validated before inserting the form into database
	@RequestMapping(path="/surveyInput", method=RequestMethod.POST)
	public String processSurveyInput(RedirectAttributes redirAttribs,
									@RequestParam String parkCode,
									@RequestParam String email,
									@RequestParam String state,
									@RequestParam String activityLevel) {
		
		List<String> errorMessages = new ArrayList<String>();
		boolean isValid = true;
		Matcher matcher = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE).matcher(email);
		if(matcher.find()) {
			isValid = true;
		} else {
			isValid = false;
			errorMessages.add("Please enter a valid email address");
		}
		if(!isValid) {
			redirAttribs.addFlashAttribute("errorMessages", errorMessages);
			return "redirect:/surveyInput";
		}
		
		survey.addSurvey(parkCode.toUpperCase(), email, state, activityLevel);
		return "redirect:/surveyResult";
	}
	
	//surveyResult references park DB to obtain name and survey DB for the ranking
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
