package kr.co.jwo.popup.dto;

import java.util.Date;

import lombok.Data;

@Data
public class PopupImgDTO {
//	POP_IMG_ID	NUMBER(8,0)
//	POP_ID	NUMBER(8,0)
//	ORG_IMG_NAME	VARCHAR2(300 BYTE)
//	NEW_IMG_NAME	VARCHAR2(300 BYTE)
//	IMG_TYPE	VARCHAR2(1 BYTE)
//	IMG_SIZE	NUMBER
//	IMG_PATH	VARCHAR2(100 BYTE)
//	IMG_EXT	VARCHAR2(5 BYTE)
//	REG_DATE	DATE
	
	private Integer popImgId	= null,
					popId 		= null;
	private long	imgSize;
	
	private String 	orgImgName 	= null,
					newImgName 	= null,
					imgType 	= null,
					imgPath		= null,
					imgExt		= null;
	
	private Date 	regDt	= null;
}
