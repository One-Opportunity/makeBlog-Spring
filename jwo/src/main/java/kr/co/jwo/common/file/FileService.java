package kr.co.jwo.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.jwo.board.dto.BoardFileDTO;
import kr.co.jwo.popup.dto.PopupImgDTO;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class FileService {
	static final Logger logger = LoggerFactory.getLogger(FileService.class);
	
	private String pattenDate = new String("yyyy").concat(File.separator).concat("MM").concat(File.separator).concat("dd");
	private String pattenFile = new String("yyyyMMddHHmmss");
	
	/**
	 * 패스 생성(폴더)
	 * @param path
	 */
	private void makePath(String path) {
		File savePath = new File(path);
		if( !savePath.exists() )
			savePath.mkdirs();
	}
	
	private String encodeFileName(String filename) {
		try {
			return URLEncoder.encode(filename, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException(e);
		}
	}
	
	
	/**
	 * 단일 파일 업로드
	 * @param multipartFile
	 * @param httpSession
	 * @return
	 */
	public PopupImgDTO uploadSingleImg(MultipartFile multipartFile, HttpSession httpSession){
		PopupImgDTO fileInfo = new PopupImgDTO();
		SimpleDateFormat sfPathName = new SimpleDateFormat(pattenDate);
		SimpleDateFormat sfFileName = new SimpleDateFormat(pattenFile);
		
		logger.debug("sfPathName ===> "+sfPathName.format(new Date()));
		logger.debug("sfFileName ===> "+sfFileName.format(new Date()));
		
		// 업로드 파일이 존재하면
		if(multipartFile != null 
				&& !(multipartFile.getOriginalFilename().equals(""))) {
			// 파일크기 제한 (5MB)
			long filesize = multipartFile.getSize(); //파일크기
			long limitFileSize = 500*1024*1024; //500MB
			
			// 제한보다 파일크기가 클 경우
			if(limitFileSize < filesize){
				return fileInfo;
			}
			
			
			// 저장경로
			String defaultPath = httpSession.getServletContext().getRealPath("/"); //서버기본경로 (프로젝트 폴더 아님)
			String uriPath = "upload" + File.separator +  sfPathName.format(new Date());
			String path = defaultPath + uriPath;
			
			// 저장경로 처리
			makePath(path);
			
			logger.debug("defaultPath ===========>"+defaultPath);
			logger.debug("uriPath===========>"+uriPath);
			logger.debug("path ===========>"+path);

			// 파일 저장명 처리 (20150702091941)
			String newFileName = sfFileName.format(new Date())+"_"+((int)(Math.random()*10000));		// 새로 생성한 파일이름
			String orgFileName = multipartFile.getOriginalFilename(); // 실제 파일이름
			
			fileInfo.setOrgImgName(orgFileName);
			fileInfo.setNewImgName(newFileName);
			fileInfo.setImgPath(uriPath);
			
			// 파일 타입
			fileInfo.setImgType(multipartFile.getContentType());
			
			logger.debug("contentType ======>" + multipartFile.getContentType());
			
			// 파일 사이즈
			fileInfo.setImgSize(filesize);
			
			// 파일 확장자
			fileInfo.setImgExt(FilenameUtils.getExtension(orgFileName));
			
			// Multipart 처리
			try{
				//서버에 파일 저장 (쓰기)
				multipartFile.transferTo(new File(path + File.separator + newFileName + "." + fileInfo.getImgExt()));
				logger.debug("file name ====>"+path + File.separator+ newFileName);
			}catch(Exception e){
//				fileInfo.setErrorCode(-1);
				e.printStackTrace();
				logger.error("[ERROR]파일 업로드시에 오류가 발생하였습니다");
			}
			
//			fileInfo.setErrorCode(9);
		}
		return fileInfo;
	}
	
	/**
	 * 단일 파일 업로드
	 * @param multipartFile
	 * @param httpSession
	 * @return
	 */
	public BoardFileDTO uploadSingleFile(MultipartFile multipartFile, HttpSession httpSession){
		BoardFileDTO fileInfo = new BoardFileDTO();
		SimpleDateFormat sfPathName = new SimpleDateFormat(pattenDate);
		SimpleDateFormat sfFileName = new SimpleDateFormat(pattenFile);
		
		logger.debug("sfPathName ===> "+sfPathName.format(new Date()));
		logger.debug("sfFileName ===> "+sfFileName.format(new Date()));
		
		// 업로드 파일이 존재하면
		if(multipartFile != null 
				&& !(multipartFile.getOriginalFilename().equals(""))) {
			// 파일크기 제한 (5MB)
			long filesize = multipartFile.getSize(); //파일크기
			long limitFileSize = 500*1024*1024; //500MB
			
			// 제한보다 파일크기가 클 경우
			if(limitFileSize < filesize){
				return fileInfo;
			}
			
			
			// 저장경로
			String defaultPath = httpSession.getServletContext().getRealPath("/"); //서버기본경로 (프로젝트 폴더 아님)
			String uriPath = "upload" + File.separator +  sfPathName.format(new Date());
			String path = defaultPath + uriPath;
			
			// 저장경로 처리
			makePath(path);
			
			logger.debug("defaultPath ===========>"+defaultPath);
			logger.debug("path ===========>"+path);

			// 파일 저장명 처리 (20150702091941)
			String newFileName = sfFileName.format(new Date())+"_"+((int)(Math.random()*10000));		// 새로 생성한 파일이름
			String orgFileName = multipartFile.getOriginalFilename(); // 실제 파일이름
			
			fileInfo.setOrgFileName(orgFileName);
			fileInfo.setNewFileName(newFileName);
			fileInfo.setFilePath(uriPath);
			
			// 파일 타입
			fileInfo.setFileType(multipartFile.getContentType());
			
			logger.debug("contentType ======>" + multipartFile.getContentType());
			
			// 파일 사이즈
			fileInfo.setFileSize(filesize);
			
			// 파일 확장자
			fileInfo.setFileExt(FilenameUtils.getExtension(orgFileName));
			
			// Multipart 처리
			try{
				//서버에 파일 저장 (쓰기)
				multipartFile.transferTo(new File(path + File.separator + newFileName + "." + fileInfo.getFileExt()));
				logger.debug("file name ====>"+path + File.separator+ newFileName);
			}catch(Exception e){
//				fileInfo.setErrorCode(-1);
				e.printStackTrace();
				logger.error("[ERROR]파일 업로드시에 오류가 발생하였습니다");
			}
			
//			fileInfo.setErrorCode(9);
		}
		return fileInfo;
	}
	
	public void downloadFile(HttpServletResponse response, HttpSession httpSession, BoardFileDTO fileDTO) {
		FileInputStream fis = null;
		ServletOutputStream out = null;

		try {
			out = response.getOutputStream();

			// httpSession.getServletContext().getRealPath("/")
			File file = new File(httpSession.getServletContext().getRealPath("/") + fileDTO.getFilePath() + "/" +  fileDTO.getNewFileName() );
			log.debug("경로찍어봅시다~!!!!!!!!!!!!!!!!!1" + httpSession.getServletContext().getRealPath("/")+fileDTO.getFilePath() + "/" +  fileDTO.getNewFileName());
			
			if( !file.exists() ) {
				String str = "<script>alert('파일이 없습니다.'); history.back(-1);</script>";
				response.setContentType("text/html; charset=UTF-8");
				response.getOutputStream().write(str.getBytes());
				return;
			}

			fis = new FileInputStream(file);

			String fileName = encodeFileName( fileDTO.getOrgFileName());

			response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
			response.setHeader("Content-Disposition", "attachment; filename=\""+fileName+"\";");
			response.setHeader("Content-Transfer-Encoding", "binary;");

			response.setHeader("Pragma", "no-cache;");
			response.setHeader("Expires", "-1;");

			int byteRead = 0;
			byte[] buffer = new byte[8192];
			while( (byteRead = fis.read(buffer, 0, 8192) ) != -1 ) {
				out.write(buffer, 0, byteRead);
			}

			out.flush();
		}catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException(e);
		}finally {
			if( out != null )
				try { out.close();	}catch(IOException e) {}
			if( fis != null )
				try { fis.close();	}catch(IOException e) {}
		}
	}
}
