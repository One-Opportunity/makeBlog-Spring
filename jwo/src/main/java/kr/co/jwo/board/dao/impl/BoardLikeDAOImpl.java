package kr.co.jwo.board.dao.impl;

import org.springframework.stereotype.Repository;

import kr.co.jwo.board.dao.IBoardLikeDAO;
import kr.co.jwo.board.dto.BoardLikeDTO;
import kr.co.jwo.common.dao.BaseDaoSupport;

@Repository
public class BoardLikeDAOImpl extends BaseDaoSupport implements IBoardLikeDAO{

	@Override
	public void insert(BoardLikeDTO likeDTO) {
		this.getSqlSession().insert("BoardLike.insert", likeDTO);
	}

	@Override
	public void delete(Integer likeId) {
		this.getSqlSession().delete("BoardLike.delete", likeId);
	}

	
}
