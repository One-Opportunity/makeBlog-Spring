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
public class MainController {
	
	
	@RequestMapping(value="/main/index.god", method=RequestMethod.GET)
	public void index() {
		
		
	}


}
