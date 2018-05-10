package kr.co.jwo.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jwo.board.dao.IBoardFileDAO;
import kr.co.jwo.board.dto.BoardFileDTO;
import kr.co.jwo.board.dto.BoardSearchDTO;
import kr.co.jwo.board.service.IBoardFileService;

@Service
public class BoardFileServiceImpl implements IBoardFileService {

	@Autowired private IBoardFileDAO fileDAO = null;
	
	@Override
	public List<BoardFileDTO> list(Integer docId) {
		// TODO Auto-generated method stub
		return  fileDAO.selectList(docId);
	}
	
	@Override
	public void write(BoardFileDTO fileDTO) {
		fileDAO.insert(fileDTO);
	}

	@Override
	public void remove(Integer docId) {
		fileDAO.delete(docId);
	}

	@Override
	public BoardFileDTO view(BoardFileDTO fileDTO) {
		return fileDAO.selectOne(fileDTO);
	}






}
