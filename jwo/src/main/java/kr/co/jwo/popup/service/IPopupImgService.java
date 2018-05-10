package kr.co.jwo.popup.service;

import java.util.List;

import kr.co.jwo.popup.dto.PopupImgDTO;

public interface IPopupImgService {
	public List<PopupImgDTO> list(Integer popId);
	public void write(PopupImgDTO popupImgDTO);
	public void remove(Integer popId);
}
