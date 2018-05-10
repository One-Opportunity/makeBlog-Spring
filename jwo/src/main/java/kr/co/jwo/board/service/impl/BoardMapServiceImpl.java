package kr.co.jwo.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jwo.board.dao.IBoardMapDAO;
import kr.co.jwo.board.dto.BoardMapDTO;
import kr.co.jwo.board.service.IBoardMapService;

@Service
public class BoardMapServiceImpl implements IBoardMapService{

	@Autowired private IBoardMapDAO boardMapDAO = null;
	
	@Override
	public List<BoardMapDTO> list() {
		
		return boardMapDAO.selectList();
	}

	@Override
	public BoardMapDTO view(int mapId) {
		return boardMapDAO.selectOne(mapId);
	}

}
