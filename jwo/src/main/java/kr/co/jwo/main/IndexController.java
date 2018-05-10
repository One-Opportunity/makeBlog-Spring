package kr.co.jwo.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jwo.user.service.IUserService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class IndexController {
	
	
	@Autowired private IUserService userService = null;
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String index1() {
		return "redirect:/login.god";
		
	}
	@RequestMapping(value="/index.god", method=RequestMethod.GET)
	public String index() {
		return "redirect:/login.god";
		
	}
	// 인덱스로 들어오면 로그인으로 넘김
	@RequestMapping(value="/login.god", method=RequestMethod.GET)
	public void login() {
		
	}
}
