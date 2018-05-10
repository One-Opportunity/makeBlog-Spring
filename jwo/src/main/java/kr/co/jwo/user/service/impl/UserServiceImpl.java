package kr.co.jwo.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jwo.user.dao.IUserDAO;
import kr.co.jwo.user.dto.UserDTO;
import kr.co.jwo.user.service.IUserService;

@Service
public class UserServiceImpl implements IUserService {
	@Autowired
	IUserDAO userDAO = null;
	int cnt = 0;

	@Override
	public void write(UserDTO userDTO) {
		userDAO.insert(userDTO);
	}

	@Override
	public void edit(UserDTO userDTO) {
		userDAO.update(userDTO);
	}

	@Override
	public UserDTO view(int userId) {
		return userDAO.select(userId);
	}

	@Override
	public void remove(int userId) {
		userDAO.delete(userId);
	}

	@Override
	public int viewCountByLoginId(String loginId) {
		cnt = userDAO.selectCountByLoginId(loginId);
		if (cnt == 0) {
			return 1;
		} else {
			return 0;
		}
	}

	@Override
	public int viewCountByEmail(String email) {
		cnt = userDAO.selectCountByEmail(email);
		if (cnt == 0) {
			return 1;
		} else {
			return 0;
		}
	}

	@Override
	public int viewCountByPhone(String phone) {
		cnt = userDAO.selectCountByPhone(phone);
		if (cnt == 0) {
			return 1;
		} else {
			return 0;
		}
	}

	@Override
	public UserDTO viewByLoginId(String loginId) {
		
		return userDAO.selectOneByLoginId(loginId);
	}

	@Override
	public UserDTO viewByEmail(String email) {
		return userDAO.selectOneByEmail(email);
	}

	@Override
	public UserDTO viewByLoginIdAndEmail(UserDTO _userDTO) {
		return userDAO.selectOneByLoginIdAndEmail(_userDTO);
	}

}
