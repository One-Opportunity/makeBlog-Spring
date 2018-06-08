package kr.co.jwo.common.dto;

import lombok.Data;

@Data
public class PageDTO {

	private String path = "/";
	protected int page = 1; 			// 첫페이지 수
	protected int rows = 10; 			// 한 페이지에 나타내는 게시판 개수
	protected int total = 0; 			// 총 게시판 갯수
	protected int navi = 5;			// 한 화면에 나타나는 페이지 갯수
	protected int totalPageSize = 0;
	
	public void setTotal(int total) {
		this.total = total;
		totalPageSize = (int)Math.ceil( (double)total / getRows() );
	}

}

