package kr.co.jwo.board.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.jwo.board.dao.IBoardDocDAO;
import kr.co.jwo.board.dto.BoardDocDTO;
import kr.co.jwo.board.dto.BoardFileDTO;
import kr.co.jwo.board.dto.BoardSearchDTO;
import kr.co.jwo.board.service.IBoardCommentService;
import kr.co.jwo.board.service.IBoardDocService;
import kr.co.jwo.board.service.IBoardFileService;
import kr.co.jwo.common.file.FileService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardDocServiceImpl implements IBoardDocService {

	@Autowired
	private IBoardDocDAO documentDAO = null;
	@Autowired
	private IBoardFileService boardFileServiceImpl = null;
	@Autowired
	private FileService fileService = null;
	@Autowired
	private IBoardCommentService boardCommentService = null;

	@Override
	@Transactional
	public void add(BoardDocDTO boardDocDTO, HttpSession session) {

		// 1. 게시물 insert
		documentDAO.insert(boardDocDTO);

		BoardFileDTO boardFileDTO = null;
		try {
			for (MultipartFile file : boardDocDTO.getFiles()) {
				log.debug("====@@@@@@@@@@@@@@  name  @@@@@@@@@@@@@@@@@@@@@@@@ =====>>" + file.getOriginalFilename());
				log.debug("====@@@@@@@@@@@@@@  name  @@@@@@@@@@@@@@@@@@@@@@@@ =====>>" + file.getSize());

				// 2. 첨부파일 물리적인 디스크에 저장
				boardFileDTO = fileService.uploadSingleFile(file, session);

				// 3. c첨부파일 DB에
				boardFileDTO.setDocId(boardDocDTO.getDocId());
				boardFileServiceImpl.write(boardFileDTO);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	@Override
	public void edit(BoardDocDTO documentDTO) {
		documentDAO.update(documentDTO);
	}

	@Override
	@Transactional
	public void remove(int docId) {
		boardFileServiceImpl.remove(docId);
		boardCommentService.removeByDocId(docId);
		
		// 좋아요
		
		documentDAO.delete(docId);
	}

	@Override
	@Transactional
	public BoardDocDTO view(int docId) {
		// 1. 조회수 증가
		editByCntRead(docId);
		
		// 2. 조회
		BoardDocDTO boardDocDTO = documentDAO.selectOne(docId);
		
		// 3. 첨부파일 가져오기
		List<BoardFileDTO> fileList = boardFileServiceImpl.list(docId);
		boardDocDTO.setFileList(fileList);
		log.debug("service의 view@@@@@@@@@@@@@들어오니?" + fileList);
		
		return boardDocDTO;
	}

	@Override
	public List<BoardDocDTO> listDoc(BoardSearchDTO boardSearchDTO) {
		// 1. 총 게시물 갯수 count
		boardSearchDTO.setTotal(documentDAO.selectCount(boardSearchDTO));

		
		// 2. 게시물 목록 가져오기
		List<BoardDocDTO> list =  documentDAO.selectList(boardSearchDTO);
		
		for(BoardDocDTO docDTO : list) {
			// 첨부파일 갯수가 0 이상 일 경우만 첨부파일 목록을 가져온다
			if(docDTO.getCntFile() > 0) {
				List<BoardFileDTO> fileList = boardFileServiceImpl.list(docDTO.getDocId());
				docDTO.setFileList(fileList);
			}
		}
		return list;
	}

	@Override
	public void editByCntRead(int docId) {
		documentDAO.updateByCntRead(docId);
	}

	@Override
	public List<BoardDocDTO> listByUserId(BoardSearchDTO search) {
		// 1. 총 게시물 갯수 count
		search.setTotal(documentDAO.selectCountByUserId(search));

		
		// 2. 게시물 목록 가져오기
		List<BoardDocDTO> list =  documentDAO.selectListByUserId(search);
		log.debug("service의 search 추출 :" + search );
		for(BoardDocDTO docDTO : list) {
			// 첨부파일 갯수가 0 이상 일 경우만 첨부파일 목록을 가져온다
			if(docDTO.getCntFile() > 0) {
				List<BoardFileDTO> fileList = boardFileServiceImpl.list(docDTO.getDocId());
				docDTO.setFileList(fileList);
			}
		}
		return list;
	}

	@Override
	public List<BoardDocDTO> listMyComment(Integer userId) {
		
		return documentDAO.selectListMyComment(userId);
	}

}
