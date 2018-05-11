package kr.co.jwo.board.dao;

import java.util.List;

import kr.co.jwo.board.dto.BoardFileDTO;

public interface IBoardFileDAO {
	public List<BoardFileDTO> selectList(Integer docId);
	public void insert(BoardFileDTO fileDTO);
	public void delete(Integer docId);
	public void deleteByFileSno(Integer fileSno);
	
	public BoardFileDTO selectOne(BoardFileDTO fileDTO);
}
