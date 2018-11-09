package com.techelevator.npgeek;

import java.util.List;

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
	
	@RequestMapping("/")
	public String displayParks(ModelMap map) {
		List<Park> parks = park.getAllParks();
		map.put("parks", parks);
		return "parkHome";
	}
	
	@RequestMapping(path="/parkDetails", method=RequestMethod.GET)
	public String displayParkDetails(ModelMap map,
									@RequestParam String parkCode) {
		Park parkDetails = park.getParkDetails(parkCode);
		map.put("parkDetails", parkDetails);
		return "parkDetails";
	}

}
