package kr.co.jwo.user.service;

import kr.co.jwo.user.dto.UserDTO;

public interface IUserService {
	
	public void write(UserDTO userDTO);
	public void edit(UserDTO userDTO);
	public UserDTO view(int userId);
	public void remove(int userId);
	public int viewCountByLoginId(String loginId);
	public int viewCountByEmail(String email);
	public int viewCountByPhone(String phone);
	public UserDTO viewByLoginId(String loginId);
	public UserDTO viewByEmail(String email);
	public UserDTO viewByLoginIdAndEmail(UserDTO _userDTO);
}
