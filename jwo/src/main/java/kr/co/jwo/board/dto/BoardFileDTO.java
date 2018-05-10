package kr.co.jwo.board.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BoardFileDTO {
//	DOC_ID	NUMBER(8,0)
//	FILE_SNO	NUMBER(2,0)
//	ORG_FILE_NAME	VARCHAR2(100 BYTE)
//	NEW_FILE_NAME	VARCHAR2(100 BYTE)
//	FILE_TYPE	VARCHAR2(10 BYTE)
//	FILE_SIZE	NUMBER
//	FILE_PATH	VARCHAR2(100 BYTE)
//	FILE_EXT	VARCHAR2(10 BYTE)
//	REG_DT	DATE
	
	private Integer	docId 		= null,
					fileSno		= null;
	
	private long	fileSize	= 0;
	
	private String	orgFileName	= null,
					newFileName	= null,
					fileType	= null,
					filePath	= null,
					fileExt		= null;
	
	private Date 	regDt		= null;
}
