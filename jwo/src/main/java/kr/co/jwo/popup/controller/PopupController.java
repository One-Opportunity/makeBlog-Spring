 package kr.co.jwo.popup.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.jwo.board.dto.BoardDocDTO;
import kr.co.jwo.board.dto.BoardMapDTO;
import kr.co.jwo.board.dto.BoardSearchDTO;
import kr.co.jwo.popup.dto.PopupDTO;
import kr.co.jwo.popup.service.IPopupService;
import kr.co.jwo.user.dto.UserDTO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/popup/doc")
@Controller
public class PopupController {

	@Autowired private IPopupService popupService = null;
	
	@RequestMapping(value="/list.god", method=RequestMethod.GET)
	public void list(Model model) {
		List<PopupDTO> list = popupService.list();
		log.debug("popupController의 list에서 list 뽑기 : " + list);
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="/view.god", method=RequestMethod.GET)
	public void goView(Model model, Integer popId) {
		PopupDTO popupDTO = popupService.view(popId);
		log.debug("PopupController에서 view의 popupDTO  >>>>>" + popupDTO);

		model.addAttribute("popupDTO", popupDTO);
	}
	
	@RequestMapping(value="/write.god", method=RequestMethod.GET)
	public void goWrite(Model model) {
		
	}
	
	@RequestMapping(value="/write.god", method=RequestMethod.POST)
	public String doWrite(Model model , PopupDTO popupDTO, HttpSession session) {
		log.debug("PopupController의 doWrite에서 popupDTO 출력 : " + popupDTO);
		popupService.write(popupDTO, session);
		
		return "redirect:./view.god?popId=" + popupDTO.getPopId();
	}
	
	@RequestMapping(value = "/remove.god", method=RequestMethod.GET)
	public String remove(Integer popId) {
		log.debug("삭제 popId : " + popId);
		popupService.remove(popId);
		return "redirect:./list.god";
	}
	
	@RequestMapping(value = "/update.god", method = RequestMethod.GET)
	public void goEdit(Model model, Integer popId) {
		PopupDTO popupDTO = popupService.view(popId);
		model.addAttribute("popupDTO", popupDTO);
	}
	
	@RequestMapping(value = "/update.god", method = RequestMethod.POST)
	public String doEdit(Model model, PopupDTO popupDTO, HttpSession session) {
		popupService.edit(popupDTO, session);
		return "redirect:./view.god?popId=" + popupDTO.getPopId(); 
	}
}
