package kr.co.jwo.board.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.jwo.board.dao.IBoardDocDAO;
import kr.co.jwo.board.dao.IBoardFileDAO;
import kr.co.jwo.board.dto.BoardDocDTO;
import kr.co.jwo.board.dto.BoardFileDTO;
import kr.co.jwo.board.dto.BoardSearchDTO;
import kr.co.jwo.common.dao.BaseDaoSupport;

@Repository
public class BoardFileDAOImpl extends BaseDaoSupport implements IBoardFileDAO{

	@Override
	public List<BoardFileDTO> selectList(Integer docId) {
		return this.getSqlSession().selectList("BoardFile.selectList", docId);
	}

	@Override
	public void insert(BoardFileDTO fileDTO) {
		this.getSqlSession().insert("BoardFile.insert", fileDTO);
	}

	@Override
	public void delete(Integer docId) {
		this.getSqlSession().delete("BoardFile.delete", docId);
	}

	@Override
	public BoardFileDTO selectOne(BoardFileDTO fileDTO) {
		return this.getSqlSession().selectOne("BoardFile.selectOne", fileDTO);
	}
	
}
