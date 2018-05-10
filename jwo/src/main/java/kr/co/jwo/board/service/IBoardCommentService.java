package kr.co.jwo.board.service;

import java.util.List;

import kr.co.jwo.board.dto.BoardCommentDTO;
import kr.co.jwo.board.dto.BoardSearchDTO;

public interface IBoardCommentService {
	public List<BoardCommentDTO>list(Integer docId);
	public void write(BoardCommentDTO commentDTO);
	public void remove(Integer commentId);
	public void removeByDocId(Integer docId);
}
