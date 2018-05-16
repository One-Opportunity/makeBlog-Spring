package kr.co.jwo.board.dao;

import kr.co.jwo.board.dto.BoardLikeDTO;

public interface IBoardLikeDAO {
	public void insert(BoardLikeDTO likeDTO);
	public void delete(Integer likeId);
}
