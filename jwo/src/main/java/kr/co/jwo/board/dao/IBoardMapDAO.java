package kr.co.jwo.board.dao;

import java.util.List;

import kr.co.jwo.board.dto.BoardMapDTO;

public interface IBoardMapDAO {
	public List<BoardMapDTO> selectList();
	
	public BoardMapDTO selectOne(int mapId);
}
