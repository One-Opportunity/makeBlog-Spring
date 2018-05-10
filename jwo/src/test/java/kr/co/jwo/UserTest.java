package kr.co.jwo;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.jwo.user.dto.UserDTO;
import kr.co.jwo.user.service.IUserService;

@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration(locations={
"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class UserTest {
	@Autowired IUserService userService = null;
	@Test
	public void write() {
		UserDTO userDTO = new UserDTO();
		
		userDTO.setUserId(1000);
		userDTO.setEmail("ffd@aaa.s22");
		userDTO.setLoginId("atset124");
		userDTO.setLoginPw("12345");
		userDTO.setName("메롱");
		userDTO.setPhone("010-7654-7654");
		userService.write(userDTO);
	}
	
	@Test
	public void edit() {
		UserDTO userDTO = new UserDTO();
		userDTO.setUserId(69);
		userDTO.setEmail("sdfs@ffff.ff");
		userDTO.setLoginId("dfsd");
		userDTO.setLoginPw("6462");
		userDTO.setName("나수정");
		userDTO.setPhone("010-5674-7654");

		userService.edit(userDTO);
	}
	
	@Test
	public void view() {
		System.out.println(userService.view(15));
		
	}
	@Test
	public void remove() {
		userService.remove(955);
	}
}
