package kr.co.jwo.user.dto;

import java.util.Date;

import lombok.Data; //getter setter 를 자동으로 만들어줌.

@Data
public class UserDTO {
	
	private Integer userId = null,	// 사용자ID
					status = null;	//	STATUS(상태)
									//	0 : 대기
									//	3 : IP차단
									//	4 : 탈퇴
									//	5 : 정지
									//	9 : 정상
	
	private String 	loginId = null,	// 로그인ID
					loginPw = null,	// 로그인PW
					name = null,	// 이름
					phone = null,	// 핸드폰
					email = null,	// 이메일
					role = "USER";	// ROLE(롤)
									// USER : 사용자
									// MANAGER : 매니저
									// ADMIN : 관리자
									// SUPER_ADMIN : 최고 관리자
			
	private Date regDt = null;		// 등록일

}
