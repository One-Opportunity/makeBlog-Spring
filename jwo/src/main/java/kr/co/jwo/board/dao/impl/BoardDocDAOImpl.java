package kr.co.jwo.board.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.jwo.board.dao.IBoardDocDAO;
import kr.co.jwo.board.dto.BoardDocDTO;
import kr.co.jwo.board.dto.BoardLikeDTO;
import kr.co.jwo.board.dto.BoardSearchDTO;
import kr.co.jwo.common.dao.BaseDaoSupport;

@Repository
public class BoardDocDAOImpl extends BaseDaoSupport implements IBoardDocDAO{

	@Override
	public void insert(BoardDocDTO documentDTO) {
		this.getSqlSession().insert("BoardDoc.insertData", documentDTO);
	}

	@Override
	public void update(BoardDocDTO documentDTO) {
		this.getSqlSession().update("BoardDoc.updateData", documentDTO);
		
	}

	@Override
	public void delete(int docId) {
		this.getSqlSession().delete("BoardDoc.deleteData", docId);
		
	}

	@Override
	public BoardDocDTO selectOne(BoardDocDTO _docDTO) {
		return this.getSqlSession().selectOne("BoardDoc.selectOneData", _docDTO);
	}

	@Override
	public List<BoardDocDTO> selectList(BoardSearchDTO boardSearchDTO) {
		return this.getSqlSession().selectList("BoardDoc.selectListByMapId", boardSearchDTO);
	}

	@Override
	public Integer selectCount(BoardSearchDTO boardSearchDTO) {
		return this.getSqlSession().selectOne("BoardDoc.selectCount", boardSearchDTO);
	}

	@Override
	public void updateByCntRead(int docId) {
		this.getSqlSession().update("BoardDoc.updateByCntRead", docId);
	}

	@Override
	public List<BoardDocDTO> selectListByUserId(BoardSearchDTO search) {
		return this.getSqlSession().selectList("BoardDoc.selectListByUserId", search);
	}

	@Override
	public Integer selectCountByUserId(BoardSearchDTO boardSearchDTO) {
		return this.getSqlSession().selectOne("BoardDoc.selectCountByUserId", boardSearchDTO);
	}

	@Override
	public List<BoardDocDTO> selectListMyComment(Integer userId) {
		return this.getSqlSession().selectList("BoardDoc.selectListMyComment", userId);
	}

	@Override
	public List<BoardDocDTO> selectListMyLike(BoardLikeDTO _likeDTO) {
		return this.getSqlSession().selectList("BoardDoc.selectListMyLike", _likeDTO);
	}

	
	
}
