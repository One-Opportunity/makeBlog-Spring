package kr.co.jwo.common.dto;

import lombok.Data;

@Data
public class ResponseDTO {

	// id 체크
	public int code = 9; // 9 : 성공
	public String msg = "정상적으로 성공하였습니다.";

}
