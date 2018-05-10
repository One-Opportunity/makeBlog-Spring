package kr.co.jwo.board.service;

import java.util.List;

import kr.co.jwo.board.dto.BoardCommentDTO;
import kr.co.jwo.board.dto.BoardFileDTO;

public interface IBoardFileService {
	public List<BoardFileDTO> list(Integer docId);
	public void write(BoardFileDTO fileDTO);
	public void remove(Integer docId);
	public BoardFileDTO view(BoardFileDTO fileDTO);
}
