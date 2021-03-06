package kr.co.jwo.board.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.jwo.board.dto.BoardDocDTO;
import kr.co.jwo.board.dto.BoardLikeDTO;
import kr.co.jwo.board.dto.BoardSearchDTO;

public interface IBoardDocService {
	public void add(BoardDocDTO documentDTO, HttpSession session);
	public void edit(BoardDocDTO documentDTO, HttpSession session);
	public void remove(int docId);

	
	public void editByCntRead(int docId);
	public BoardDocDTO view(BoardDocDTO _docDTO);
	public List<BoardDocDTO> listDoc(BoardSearchDTO boardSearchDTO);
	public List<BoardDocDTO> listByUserId(BoardSearchDTO search);
	public List<BoardDocDTO> listMyComment(Integer userId);
	public List<BoardDocDTO> listMyLikeY(BoardLikeDTO _likeDTO);
	public List<BoardDocDTO> listMyLikeN(BoardLikeDTO _likeDTO);
}
