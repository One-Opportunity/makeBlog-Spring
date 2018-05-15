package kr.co.jwo.board.dto;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.co.jwo.user.dto.UserDTO;
import lombok.Data;

@Data
public class BoardDocDTO extends UserDTO{

	
	private Integer docId = null,				// 게시물ID
					userId = null,				// 사용자ID
					mapId = null,				// 맵ID
					cntRead = null;				// 조회수
	
	private Integer cntFile = null;
	private Integer cntComment = null;
	
	private String 	title = null,				// 제목
					boardContents = null,		// 내용
					mapName = null,
					secretWriteYn = null,		// 비밀글 여부
					secretWritePw = null;		// 비밀글 비밀번호
	
	private List<MultipartFile> files = null;	// 첨부파일
	
	private List<BoardFileDTO> fileList = null;	// 첨부파일
	
	private List<Integer> delFiles = null;		// 삭제할 첨부파일 sno
	
	private Date regDt = null;					// 등록일
	
	
	
	
	
	
	
	
	
}
