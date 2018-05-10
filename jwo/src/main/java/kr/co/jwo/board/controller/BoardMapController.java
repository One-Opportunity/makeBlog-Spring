package kr.co.jwo.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jwo.board.dto.BoardMapDTO;
import kr.co.jwo.board.service.IBoardMapService;
import kr.co.jwo.user.dto.UserDTO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/map/")
public class BoardMapController {

	@Autowired private IBoardMapService mapService = null;
	
	@ResponseBody
	@RequestMapping(value="/list.god", method=RequestMethod.GET)
	public List<BoardMapDTO> list() {
		log.debug("리스트리스트" + mapService.list());
		return mapService.list();
	}
}
