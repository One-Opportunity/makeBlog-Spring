package kr.co.jwo.popup.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jwo.popup.dao.IPopupImgDAO;
import kr.co.jwo.popup.dto.PopupImgDTO;
import kr.co.jwo.popup.service.IPopupImgService;

@Service
public class PopupImgServiceImpl implements IPopupImgService{

	@Autowired IPopupImgDAO popupImgDAO = null;
	
	@Override
	public List<PopupImgDTO> list(Integer popId) {
		return popupImgDAO.selectList(popId);
	}

	@Override
	public void write(PopupImgDTO popupImgDTO) {
		popupImgDAO.insert(popupImgDTO);
	}

	@Override
	public void remove(Integer popId) {
		popupImgDAO.delete(popId);
	}

}
