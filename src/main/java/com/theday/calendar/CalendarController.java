package com.theday.calendar;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/calendar")
public class CalendarController {

	@RequestMapping("/calendar_view")
	public String calendarView(Model model) {
		model.addAttribute("viewName","calendar/calendar");
		
		return "template/layout";
	}
}
