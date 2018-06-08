package kr.co.jwo.memo.dto;

import java.util.Date;

import lombok.Data;

@Data
public class NoteSendDTO {

//	NOTE_ID	NUMBER(8,0)
//	RECIEVE_ID	VARCHAR2(10 BYTE)
//	SEND_ID	VARCHAR2(10 BYTE)
//	SEND_DT	DATE
//	SEND_DEL_YN	VARCHAR2(1 BYTE)
	
	private Integer noteId 		= null;
	
	private String 	recieveId 	= null,
					sendId		= null,
					sendDelYn	= null;
					
	private Date 	sendDt		= null;
					
}
