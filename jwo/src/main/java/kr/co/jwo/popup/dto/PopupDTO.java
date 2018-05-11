package kr.co.jwo.popup.dto;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class PopupDTO {
//	POP_ID	NUMBER(8,0)
//	POP_TITLE	VARCHAR2(10 BYTE)
//	REG_DT	DATE
//	POPUP_YN	VARCHAR2(1 BYTE)
	
	public Integer popId 	= null;
	
	public String 	popTitle 	= null,
					popupYn		= null;
	
	public Date	regDt	= null;
	
	private List<MultipartFile> files = null;	// 첨부파일
	
	private List<PopupImgDTO> fileList = null;	// 첨부파일

	private List<Integer> delFiles = null;		// 삭제할 첨부파일 sno

}
