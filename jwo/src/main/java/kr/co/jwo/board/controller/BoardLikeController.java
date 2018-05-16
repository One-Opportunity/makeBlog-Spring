package kr.co.jwo.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jwo.board.dao.IBoardLikeDAO;
import kr.co.jwo.board.dto.BoardDocDTO;
import kr.co.jwo.board.dto.BoardLikeDTO;
import kr.co.jwo.board.dto.BoardSearchDTO;
import kr.co.jwo.board.service.IBoardLikeService;
import kr.co.jwo.common.dto.ResponseDTO;
import kr.co.jwo.user.dto.UserDTO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/like")
public class BoardLikeController {

	@Autowired private IBoardLikeService likeService = null;
	
	@ResponseBody
	@RequestMapping(value = "/like.god", method = RequestMethod.POST)
	public ResponseDTO like(Model model, HttpSession session, BoardLikeDTO likeDTO) {
		ResponseDTO responseDTO = new ResponseDTO(); 
		
//	 	try {
	 		UserDTO userDTO = (UserDTO) session.getAttribute("_user");
	 		likeDTO.setUserId(userDTO.getUserId());
	 		log.debug("===========>"+userDTO);
	 		log.debug("===========>"+likeDTO);

	 		// 좋아요 실행
	 		likeService.write(likeDTO);
	 		
//		} catch (Exception e) {
//			responseDTO.setCode(-1);
//			responseDTO.setMsg("에러가 발생했습니다. 관리자에게 문의하세요ㅣ.");
//		}
	
	 	return responseDTO;
		
	}
}
