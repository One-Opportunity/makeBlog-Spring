package kr.co.jwo.user.dao;

import kr.co.jwo.user.dto.UserDTO;

public interface IUserDAO {

	public void insert(UserDTO userDTO);
	public void update(UserDTO userDTO);
	public UserDTO select(int userId);
	public void delete(int userId);
	public int selectCountByLoginId(String loginId);
	public int selectCountByEmail(String email);
	public int selectCountByPhone(String phone);
	public UserDTO selectOneByLoginId(String loginId);
	
	public UserDTO selectOneByEmail(String email);
	public UserDTO selectOneByLoginIdAndEmail(UserDTO _userDTO);
}
