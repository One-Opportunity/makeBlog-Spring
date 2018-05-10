package kr.co.jwo.popup.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.jwo.common.dao.BaseDaoSupport;
import kr.co.jwo.popup.dao.IPopupImgDAO;
import kr.co.jwo.popup.dto.PopupImgDTO;

@Repository
public class PopupImgDAOImpl extends BaseDaoSupport implements IPopupImgDAO{

	@Override
	public List<PopupImgDTO> selectList(Integer popId) {
		return this.getSqlSession().selectList("PopupImg.selectList", popId);
	}

	@Override
	public void insert(PopupImgDTO popupImgDTO) {
		this.getSqlSession().insert("PopupImg.insert", popupImgDTO);
	}

	@Override
	public void delete(Integer popId) {
		this.getSqlSession().delete("PopupImg.delete", popId);
	}

}
