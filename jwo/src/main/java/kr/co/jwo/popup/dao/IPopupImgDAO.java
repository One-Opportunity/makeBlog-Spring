package kr.co.jwo.popup.dao;

import java.util.List;

import kr.co.jwo.popup.dto.PopupImgDTO;

public interface IPopupImgDAO {

	public List<PopupImgDTO> selectList(Integer popId);
	public void insert(PopupImgDTO popupImgDTO);
	public void delete(Integer popId);
}
