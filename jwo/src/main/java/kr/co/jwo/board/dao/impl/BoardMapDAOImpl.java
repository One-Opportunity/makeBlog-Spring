package kr.co.jwo.board.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.jwo.board.dao.IBoardMapDAO;
import kr.co.jwo.board.dto.BoardMapDTO;
import kr.co.jwo.common.dao.BaseDaoSupport;

@Repository
public class BoardMapDAOImpl extends BaseDaoSupport implements IBoardMapDAO{

	@Override
	public List<BoardMapDTO> selectList() {
		return this.getSqlSession().selectList("BoardMap.selectList");
	}

	@Override
	public BoardMapDTO selectOne(int mapId) {
		return this.getSqlSession().selectOne("BoardMap.selectOne", mapId);
	}

}
