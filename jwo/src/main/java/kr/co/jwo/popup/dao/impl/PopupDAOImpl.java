package kr.co.jwo.popup.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.jwo.common.dao.BaseDaoSupport;
import kr.co.jwo.popup.dao.IPopupDAO;
import kr.co.jwo.popup.dto.PopupDTO;

@Repository
public class PopupDAOImpl extends BaseDaoSupport implements IPopupDAO{

	@Override
	public void insert(PopupDTO popupDTO) {
		this.getSqlSession().insert("Popup.insert", popupDTO);
	}

	@Override
	public List<PopupDTO> selectList() {
		return this.getSqlSession().selectList("Popup.selectList");
	}

	@Override
	public PopupDTO selectOne(Integer popId) {
		return this.getSqlSession().selectOne("Popup.selectOne", popId);
	}

	@Override
	public void delete(Integer popId) {
		this.getSqlSession().delete("Popup.delete", popId);
	}

	@Override
	public void update(PopupDTO popupDTO) {
		this.getSqlSession().update("Popup.update", popupDTO);
	}

}
