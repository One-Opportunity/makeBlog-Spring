package kr.co.jwo.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jwo.common.dto.ResponseDTO;
import kr.co.jwo.user.dto.UserDTO;
import kr.co.jwo.user.service.IUserService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class JoinController {

	@Autowired
	IUserService userService = null;
	int result = 0;

	// 회원가입 페이지로 이동(GET과 POST로 구분)
	@RequestMapping(value = "/join.god", method = RequestMethod.GET)
	public void gojoin() {
	}

	// 회원가입
	@ResponseBody
	@RequestMapping(value = "/join.god", method = RequestMethod.POST)
	public String dojoin(UserDTO userDTO) {
		log.debug("userDTO =========>" + userDTO);
		userService.write(userDTO);
		return "s";
	}

	/**
	 * 아이디 중복 체크
	 * 
	 * @param loginId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/check/id.god", method = RequestMethod.GET)
	public ResponseDTO checkId(String loginId) {
		log.debug("loginId =>>>>>>" + loginId);
		ResponseDTO responseDTO = new ResponseDTO();
		try {
			result = userService.viewCountByLoginId(loginId);
			responseDTO.setCode(result);
			if (result == 1) {
				responseDTO.setMsg("사용 가능한 아이디입니다.");
			} else {
				responseDTO.setMsg("중복된 아이디입니다. 다시 입력해주세요.");
			}
		} catch (Exception e) {
			responseDTO.setCode(-1);
			responseDTO.setMsg("에러가 발생했습니다. 관리자에게 문의하세요");
		}
		return responseDTO;
	}

	@ResponseBody
	@RequestMapping(value = "/check/phone.god", method = RequestMethod.GET)
	public ResponseDTO checkPhone(String phone) {
		ResponseDTO responseDTO = new ResponseDTO();

		try {
			result = userService.viewCountByPhone(phone);
			responseDTO.setCode(result);
			if (result == 1) {
				responseDTO.setMsg("당신의 휴대폰이 맞습니다.");
			} else {
				responseDTO.setMsg("중복된 휴대폰입니다. 다시 입력해주세요.");
			}
		} catch (Exception e) {
			responseDTO.setCode(-1);
			responseDTO.setMsg("에러가 발생했습니다. 관리자에게 문의하세요");
		}
		return responseDTO;
	}
	
	@ResponseBody
	@RequestMapping(value = "/check/email.god", method = RequestMethod.GET)
	public ResponseDTO checkEmail(String email) {
		ResponseDTO responseDTO = new ResponseDTO();
		try {
			result = userService.viewCountByEmail(email);
			responseDTO.setCode(result);
			if(result == 1) {
				responseDTO.setMsg("이메일을 사용할 수 있습니다.");
			} else {
				responseDTO.setMsg("중복된 이메일입니다. 다시 입력해주세요.");
			}
		} catch (Exception e) {
			responseDTO.setCode(-1);
			responseDTO.setMsg("에러가 발생했습니다 관리자에게 문의하세요");
		}
		return responseDTO;
	}
	
}
