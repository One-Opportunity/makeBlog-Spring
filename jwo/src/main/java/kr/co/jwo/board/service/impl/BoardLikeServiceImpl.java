package kr.co.jwo.board.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jwo.board.dao.IBoardLikeDAO;
import kr.co.jwo.board.dto.BoardLikeDTO;
import kr.co.jwo.board.service.IBoardLikeService;

@Service
public class BoardLikeServiceImpl implements IBoardLikeService{

	@Autowired private IBoardLikeDAO likeDAO = null;
	
	/**
	 * 등록(좋아요, 싫어요)
	 */
	@Override
	public void write(BoardLikeDTO likeDTO) {
		// likeYn ==> Y, N
		
		if(likeDTO.getLikeYn() == null || likeDTO.getLikeYn().equals("")) {
			this.remove(likeDTO.getLikeId());
		} else{
		likeDAO.insert(likeDTO);
		}
	}
	
	/**
	 * 무관심(데이터 삭제)
	 */
	@Override
	public void remove(Integer likeId) {
		likeDAO.delete(likeId);
	}

}
