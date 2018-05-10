package kr.co.jwo.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.jwo.user.service.IUserService;

@Controller
public class UserController {
	@Autowired IUserService userService = null;
	
	@RequestMapping(value="find.god", method=RequestMethod.GET)
	public void goFind() {
		
	}
	
	
}
