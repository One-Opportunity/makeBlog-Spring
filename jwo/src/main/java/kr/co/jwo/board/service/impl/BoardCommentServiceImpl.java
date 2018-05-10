package kr.co.jwo.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jwo.board.dao.IBoardCommentDAO;
import kr.co.jwo.board.dto.BoardCommentDTO;
import kr.co.jwo.board.dto.BoardDocDTO;
import kr.co.jwo.board.dto.BoardFileDTO;
import kr.co.jwo.board.dto.BoardSearchDTO;
import kr.co.jwo.board.service.IBoardCommentService;

@Service
public class BoardCommentServiceImpl implements IBoardCommentService {

	@Autowired private IBoardCommentDAO commentDAO = null;
	
	@Override
	public List<BoardCommentDTO> list(Integer docId) {
		return commentDAO.selectList(docId);
	}

	@Override
	public void write(BoardCommentDTO commentDTO) {
		commentDAO.insert(commentDTO);
	}

	@Override
	public void remove(Integer commentId) {
		commentDAO.delete(commentId);
	}

	@Override
	public void removeByDocId(Integer docId) {
		commentDAO.deleteByDocId(docId);

	}

}
