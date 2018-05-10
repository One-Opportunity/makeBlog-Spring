package kr.co.jwo;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.jwo.board.dto.BoardCommentDTO;
import kr.co.jwo.board.dto.BoardMapDTO;
import kr.co.jwo.board.service.IBoardCommentService;
import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration(locations={
"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Slf4j
public class CommentTest {
	@Autowired IBoardCommentService commentService = null;
	
	
	BoardCommentDTO commentDTO = null;
	@Test
	public void list() {
		System.out.println("List 출력하기  " + commentService.list(96));
	}
	@Test
	public void write() {
		commentDTO = new BoardCommentDTO();
		commentDTO.setUserId(10000022);
		commentDTO.setDocId(96);
		commentDTO.setComments("메롱");
		
		commentService.write(commentDTO);
	}
	@Test
	public void delete() {
		commentService.remove(7);
	}
}