package board;

import java.util.Collection;

import board.BoardData;

public interface BoardService {

	// private String id, name, title, content, wdate;

	String login(String id, String pw);

	int getPageCount(String tableName);

	boolean insertBoardData(String tableName, BoardData bd);

	boolean updateBoardData(String tableName, BoardData bd);

	boolean deleteBoardData(String tableName, int no);

	boolean reinsertBoardData(String tableName, BoardData bd);

	BoardData[] selectedBoardDataList(String tableName, int reqPageNo);

	BoardData selectedBoardData(String tableName, int no, boolean inc);

	BoardData findById(String id);

	Collection<BoardData> userList();
}
