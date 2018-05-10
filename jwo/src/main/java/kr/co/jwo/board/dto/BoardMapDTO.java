package kr.co.jwo.board.dto;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardMapDTO {
	
	private Integer mapId = null,		// 맵ID
					mapSort = null,		// 순번
					parMapId = null;		
	
	private String 	mapName = null,		// 맵이름
					mapType = null,		// 맵타입
					delYn = null,		// 삭제여부
					commentYn = null,	// 댓글여부
					fileYn = null;		// 첨부파일여부
	
	private Date 	regDt;				// 등록일
	
	
	
	
	
	
	
	
	

}
