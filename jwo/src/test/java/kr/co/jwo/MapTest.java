package kr.co.jwo;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.ui.Model;

import kr.co.jwo.board.dto.BoardMapDTO;
import kr.co.jwo.board.service.IBoardMapService;
import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration(locations={
"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Slf4j
public class MapTest {
	@Autowired IBoardMapService mapService = null;
	@Test
	public void list() {
		BoardMapDTO mapDTO = new BoardMapDTO();
		System.out.println("List 출력하기  " + mapService.list());
	}
	public void view() {
		
		System.out.println("mapDTO 출력" + mapService.view(8));
		log.debug("mapController view!!!!!!!!!!! mapDTO!!!!" + mapService.view(8));
	}
}