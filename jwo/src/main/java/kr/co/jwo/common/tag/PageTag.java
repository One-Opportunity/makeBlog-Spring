package kr.co.jwo.common.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import kr.co.jwo.common.dto.PageDTO;


public class PageTag extends TagSupport {

	private static final long serialVersionUID = -240249619261555015L;
	private String script = "goPage";
	private PageDTO page;
	
	@Override
	public int doStartTag() throws JspException {
		
        if (page == null) {
            return SKIP_BODY;
        }
        
        String content = paging(page.getPath(), page.getTotal(), page.getRows(), page.getNavi(), page.getPage() , script);
        try {
			pageContext.getOut().println(content);
		} catch (IOException e) {
			e.printStackTrace();
		}
        return SKIP_BODY;
	}
    

	public String getScript() {
		return script;
	}

	public void setScript(String script) {
		this.script = script;
	}

	public PageDTO getPage() {
		return page;
	}

	public void setPage(PageDTO page) {
		this.page = page;
	}
	
	// 수정해야할 소스
	private String paging(String path, int totalCnt, int rowRange, int pageRange, int curPage, String script) {
		
		if( script.isEmpty() )
			script = "goPage";

		if( path.equals("/") )
			path = "";

		StringBuffer sb = new StringBuffer();

		if( totalCnt == 0 )	return "";

		long pageCnt = totalCnt % rowRange;

		if( pageCnt == 0 )
			pageCnt = totalCnt / rowRange;
		else
			pageCnt = totalCnt / rowRange + 1L;

		long totalPage = pageCnt; 
		
		long rangeCnt = curPage / pageRange;
		if( curPage % pageRange == 0 )
			rangeCnt = curPage / pageRange -1L;
		
		sb.append("<div id=\"paging\">\n<p>\n");
		
		// 맨처음 (짝대기 2개 '<<')
		long firstPage = curPage - pageRange;
		if( firstPage > 0 ) {
			sb.append("<span class=\"numPN\">");
			sb.append("<a href=\"javascript:"+script+"('1');\" val='1'>&#171;</a></span>");
		}
		
		// 이전 (짝대기 1개 '<')
		if( curPage > 1 ) {
			sb.append("<span class=\"numPN over left\">");
			sb.append("<a href=\"javascript:"+script+"('").append(curPage-1).append("');\" val='1'>&#60;</a></span>");
		}
		
		// 페이징 (1,2,3,4....)
		for( long i = rangeCnt * pageRange + 1L ; i < (rangeCnt + 1L) * pageRange + 1L ; i++) {
			
			if( i == curPage )
				sb.append("<span class=\"Present\"><a class=\"hand\">").append(i).append("</a></span>");
			else if( i > 10)
				sb.append("<span class=\"dubble\"><a href=\"javascript:"+script+"('").append(i).append("');\" val='").append(i).append("'>").append(i).append("</a></span>");
			else
				sb.append("<span><a href=\"javascript:"+script+"('").append(i).append("');\" val='").append(i).append("'>").append(i).append("</a></span>");
			if( i == pageCnt )
				break;
		}
		
		long page = (rangeCnt+1L) * pageRange + 1L;
		if( page > pageCnt )	page = pageCnt;
		
		// 다음 ('>')
		if( curPage >= 1 && totalCnt > 1 && curPage != pageCnt ) {
			sb.append("<span class=\"numPN over right\">");
			sb.append("<a href=\"javascript:"+script+"('").append(curPage+1).append("');\" val='1'>&#62;</a></span>");
		}
		
		// 맨뒤 ('>>')
		if( totalPage < pageCnt ) {
			sb.append("<span class=\"numPN\">");
			sb.append("<a href=\"javascript:"+script+"('").append(totalPage).append("');\" val='1'>&#171;</a></span>");
		}
		
		sb.append("\n</p>\n</div>");
		return sb.toString();
	}
}

