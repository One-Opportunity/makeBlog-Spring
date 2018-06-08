package kr.co.jwo.memo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jwo.memo.dao.impl.INoteSendDAO;
import kr.co.jwo.memo.dto.NoteSendDTO;
import kr.co.jwo.memo.service.impl.INoteSendService;

@Service
public class NoteSendServiceImpl implements INoteSendService{
	@Autowired private INoteSendDAO sendDAO = null;

	@Override
	public void write(NoteSendDTO sendDTO) {
		sendDAO.insert(sendDTO);
	}

}
