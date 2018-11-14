package com.techelevator.npgeek;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.dao.ParkDAO;

@Controller
public class ParkController {
	
	@Autowired
	private ParkDAO park;
	
//	Accesses park DB and returns general park info on the home page
	@RequestMapping("/")
	public String displayParks(ModelMap map) {
		List<Park> parks = park.getAllParks();
		map.put("parks", parks);
		return "parkHome";
	}
	
//	Returns detailed information for the selected park. Stores the information in session variables.
	@RequestMapping(path="/parkDetails", method=RequestMethod.GET)
	public String displayParkDetails(HttpSession session,
									@RequestParam String parkCode) {
		Park parkDetails = park.getParkDetails(parkCode);
		session.setAttribute("parkDetails", parkDetails);
		session.setAttribute("parkCode", parkCode);
		return "parkDetails";
	}

	
}
