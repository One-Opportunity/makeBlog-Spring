package kr.co.jwo.common.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.jwo.board.dto.BoardFileDTO;
import kr.co.jwo.board.service.IBoardFileService;
import kr.co.jwo.common.file.FileService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/file")
public class FileController {
	@Autowired private FileService fileService = null;
	@Autowired private IBoardFileService boardFileService = null;
	
	@RequestMapping(value="/downloadFile.god", method=RequestMethod.GET)
	public void downloadFile(Model model, HttpServletResponse response, HttpSession httpSession, BoardFileDTO _fileDTO) {
		log.debug("controller file222222222222222 " + _fileDTO);
		BoardFileDTO fileDTO =  boardFileService.view(_fileDTO);
		log.debug("controller file " + fileDTO);
		fileService.downloadFile(response, httpSession, fileDTO);
		
	}
}
