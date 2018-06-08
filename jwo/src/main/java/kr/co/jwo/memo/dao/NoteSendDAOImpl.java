package kr.co.jwo.memo.dao;

import org.springframework.stereotype.Repository;

import kr.co.jwo.common.dao.BaseDaoSupport;
import kr.co.jwo.memo.dao.impl.INoteSendDAO;
import kr.co.jwo.memo.dto.NoteSendDTO;

@Repository
public class NoteSendDAOImpl extends BaseDaoSupport implements INoteSendDAO {

	@Override
	public void insert(NoteSendDTO sendDTO) {
		this.getSqlSession().insert("insert", sendDTO );
	}

	
}
