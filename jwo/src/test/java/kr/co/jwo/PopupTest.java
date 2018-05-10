package kr.co.jwo;

import java.util.Arrays;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.jwo.popup.dto.PopupDTO;
import kr.co.jwo.popup.service.IPopupService;
import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration(locations={
"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Slf4j
public class PopupTest {
	@Autowired private IPopupService popupService = null;

	@Test
	public void list() {
		List<PopupDTO> list = popupService.list();
		log.debug("list " + list);
		
	}

}
