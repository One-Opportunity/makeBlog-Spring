package kr.co.jwo.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.jwo.popup.dto.PopupDTO;
import kr.co.jwo.popup.dto.PopupImgDTO;
import kr.co.jwo.popup.service.IPopupService;
import kr.co.jwo.user.dto.UserDTO;
import kr.co.jwo.user.service.IUserService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/dialog")
public class DialogController {

	@Autowired private IUserService userService = null;
	@Autowired private IPopupService popupService = null;
	
	@RequestMapping(value="/userinfo.god", method=RequestMethod.GET)
	public void userInfo(Model model, Integer userId) {
		UserDTO userDTO = userService.view(userId);
		log.debug("DialogController에 있는 userInfo의 userDTO 정보 : " + userDTO);
		
		model.addAttribute("userDTO", userDTO);
	}
	
	@RequestMapping(value="/popupdialog.god", method=RequestMethod.GET)
	public void popupDialog(Model model) {
		
		
		List<PopupDTO> list =popupService.list();
		log.debug("DialogController에 있는 popupDialog의 list 정보 : " + list);
		
		model.addAttribute("list", list);
	}
}
