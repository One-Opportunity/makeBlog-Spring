package kr.co.jwo.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jwo.board.dto.BoardCommentDTO;
import kr.co.jwo.board.dto.BoardDocDTO;
import kr.co.jwo.board.dto.BoardSearchDTO;
import kr.co.jwo.board.service.IBoardCommentService;
import kr.co.jwo.common.dto.ResponseDTO;
import kr.co.jwo.user.dto.UserDTO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/comment")
public class BoardCommentController {
	@Autowired private IBoardCommentService commentService = null;
	
	@ResponseBody
	@RequestMapping(value="/write.god", method=RequestMethod.POST)
	public ResponseDTO doWrite(Model model, HttpSession session, BoardCommentDTO commentDTO) {
		ResponseDTO responseDTO = new ResponseDTO();
		
		
		try {
			// 1. 사용자 ID 구하기
			UserDTO userDTO = (UserDTO) session.getAttribute("_user");
			commentDTO.setUserId(userDTO.getUserId());
			log.debug("=========>" +  userDTO);
			// 2. 댓글 저장
			commentService.write(commentDTO);
			
		} catch (Exception e) {
			responseDTO.setCode(-1);
			responseDTO.setMsg("에러가 발생했습니다. 관리자에게 문의하세요");
		}
		return responseDTO;
	}
	@RequestMapping(value="/list.god", method=RequestMethod.GET)
	public void list(Model model, Integer docId, BoardCommentDTO commentDTO) {
		// 댓글 목록 가져오기
		List<BoardCommentDTO> list = commentService.list(docId);
		model.addAttribute("list", list);
		log.debug("list 나와라!!!!!!!!!!!!!!!!!>>>" + list);
	}
	
	@ResponseBody
	@RequestMapping(value="/list.god", method=RequestMethod.POST)
	public void delete(Model model, @ModelAttribute("commentId") Integer commentId ) {
		log.debug("commentId 가져오기" + commentId);
		commentService.remove(commentId);
	}
	
}
