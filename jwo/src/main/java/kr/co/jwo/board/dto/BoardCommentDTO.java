package kr.co.jwo.board.dto;

import java.util.Date;

import kr.co.jwo.user.dto.UserDTO;
import lombok.Data;

@Data
public class BoardCommentDTO extends UserDTO{
	
	private Integer commentId	= null,		// 댓글ID
					docId 		= null,		// 게시물ID
					userId 		= null;		// 사용자ID
	
	private String 	comments	= null,		// 댓글내용
					mapName		= null,
					name		= null;
	
	private Date 	regDt		= null;		// 등록일
}
