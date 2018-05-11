package kr.co.jwo.popup.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.jwo.popup.dto.PopupDTO;

public interface IPopupService {

	public void write(PopupDTO popupDTO, HttpSession session);
	public List<PopupDTO> list();
	public PopupDTO view(Integer popId);
	public void remove(Integer popId);
	
	public void edit(PopupDTO popupDTO, HttpSession session);
}
