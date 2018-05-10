package kr.co.jwo.board.dao;

import java.util.List;

import kr.co.jwo.board.dto.BoardDocDTO;
import kr.co.jwo.board.dto.BoardSearchDTO;

public interface IBoardDocDAO {
	
	public void insert(BoardDocDTO documentDTO);
	public void update(BoardDocDTO documentDTO);
	public void delete(int docId);
	public BoardDocDTO selectOne(int docId);
	public List<BoardDocDTO> selectList(BoardSearchDTO boardSearchDTO);
	public Integer selectCount(BoardSearchDTO boardSearchDTO);
	public Integer selectCountByUserId(BoardSearchDTO boardSearchDTO);
	public void updateByCntRead(int docId);
	public List<BoardDocDTO> selectListByUserId(BoardSearchDTO search);
	public List<BoardDocDTO> selectListMyComment(Integer userId);
}
