package kr.co.jwo.board.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.jwo.board.dao.IBoardCommentDAO;
import kr.co.jwo.board.dto.BoardCommentDTO;
import kr.co.jwo.board.dto.BoardSearchDTO;
import kr.co.jwo.common.dao.BaseDaoSupport;

@Repository
public class BoardCommentDAOImpl extends BaseDaoSupport implements IBoardCommentDAO{

	@Override
	public List<BoardCommentDTO> selectList(Integer docId) {
		return this.getSqlSession().selectList("BoardComment.selectList", docId);
	}

	@Override
	public void insert(BoardCommentDTO commentDTO) {
		this.getSqlSession().insert("BoardComment.insert", commentDTO);
	}

	@Override
	public void delete(Integer commentId) {
		this.getSqlSession().delete("BoardComment.delete", commentId);
	}

	@Override
	public void deleteByDocId(Integer docId) {
		this.getSqlSession().delete("BoardComment.deleteByDocId", docId);
	}

}
