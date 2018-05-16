package kr.co.jwo.board.service;

import kr.co.jwo.board.dto.BoardLikeDTO;

public interface IBoardLikeService {

	public void write(BoardLikeDTO likeDTO);
	public void remove(Integer likeId);
}
