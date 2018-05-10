package kr.co.jwo.popup.dao;

import java.util.List;

import kr.co.jwo.popup.dto.PopupDTO;

public interface IPopupDAO {

	public void insert(PopupDTO popupDTO);
	public List<PopupDTO> selectList();
	public PopupDTO selectOne(Integer popId);
	public void delete(Integer popId);
	
	public void update(PopupDTO popupDTO);
}
