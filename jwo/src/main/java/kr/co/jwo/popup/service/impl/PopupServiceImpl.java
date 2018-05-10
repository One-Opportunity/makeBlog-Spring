package kr.co.jwo.popup.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.jwo.board.dto.BoardDocDTO;
import kr.co.jwo.board.dto.BoardFileDTO;
import kr.co.jwo.common.file.FileService;
import kr.co.jwo.popup.dao.IPopupDAO;
import kr.co.jwo.popup.dto.PopupDTO;
import kr.co.jwo.popup.dto.PopupImgDTO;
import kr.co.jwo.popup.service.IPopupImgService;
import kr.co.jwo.popup.service.IPopupService;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class PopupServiceImpl implements IPopupService{

	@Autowired private IPopupDAO popupDAO = null;
	
	@Autowired private FileService fileService = null;
	@Autowired private IPopupImgService popupImgService = null;
	@Override
	public void write(PopupDTO popupDTO, HttpSession session) {
		// 1. 게시물 insert
		popupDAO.insert(popupDTO);
		

				PopupImgDTO popupImgDTO = null;
				try {
					for (MultipartFile file : popupDTO.getFiles()) {
						log.debug("====@@@@@@@@@@@@@@  name  @@@@@@@@@@@@@@@@@@@@@@@@ =====>>" + file.getOriginalFilename());
						log.debug("====@@@@@@@@@@@@@@  name  @@@@@@@@@@@@@@@@@@@@@@@@ =====>>" + file.getSize());

						// 2. 첨부파일 물리적인 디스크에 저장
						popupImgDTO = fileService.uploadSingleImg(file, session);
						
						// 3. c첨부파일 DB에
						popupImgDTO.setPopId(popupDTO.getPopId());
						log.debug("====@@@@@@@@@@@@@@  name  @@@@@@@@@@@@@@@@@@@@@@@@ =====>>" + popupDTO);
						popupImgService.write(popupImgDTO);
						log.debug("====@@@@@@@@@@@@@@  name  @@@@@@@@@@@@@@@@@@@@@@@@ =====>>" + popupImgDTO);
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
	}

	@Override
	public List<PopupDTO> list() {
		// 2. 게시물 목록 가져오기
				List<PopupDTO> list =  popupDAO.selectList();
				for(PopupDTO popupDTO : list) {
					// 첨부파일 갯수가 0 이상 일 경우만 첨부파일 목록을 가져온다
					
						List<PopupImgDTO> fileList = popupImgService.list(popupDTO.getPopId());
						popupDTO.setFileList(fileList);
					
				}
		return list;
	}

	@Override
	public PopupDTO view(Integer popId) {
		PopupDTO popupDTO = popupDAO.selectOne(popId);
		
		log.debug("service의 view@@@@@@@@@@@@@들어오니?" + popId);
		List<PopupImgDTO> fileList = popupImgService.list(popId);
		popupDTO.setFileList(fileList);
		log.debug("service의 view@@@@@@@@@@@@@들어오니?" + fileList);
		return popupDTO;
	}

	@Override
	public void remove(Integer popId) {
		popupImgService.remove(popId);
		popupDAO.delete(popId);
	}

	@Override
	public void edit(PopupDTO popupDTO) {
		popupDAO.update(popupDTO);
	}
	

}
