package kr.co.jwo.board.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BoardLikeDTO {
//	LIKE_ID	NUMBER(8,0)
//	DOC_ID	NUMBER(8,0)
//	USER_ID	NUMBER(8,0)
//	LIKE_YN	VARCHAR2(1 BYTE)
//	REG_DT	DATE
	private Integer likeId 	= null, 
					docId	= null,
					userId	= null;
	
	private String	likeYn	= null;
	
	private Date	regDt	= null;
}
