
package kr.co.jwo.board.service;

import java.util.List;

import kr.co.jwo.board.dto.BoardMapDTO;

public interface IBoardMapService {

	public List<BoardMapDTO> list();
	public BoardMapDTO view(int mapId);
}
