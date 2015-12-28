package board;

import java.util.Collection;

import db.DBAction;

public class BoardServiceimpl implements BoardService {

	private int rowCount, PageCount, confirm;
	private boolean insert_confirm, information;
	private DBAction db;
	private BoardData bd;

	@Override
	public String login(String id, String pw) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getPageCount(String tableName) {
		// TODO Auto-generated method stub
		
		return 0;
	}

	@Override
	public boolean insertBoardData(String tableName, BoardData bd) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateBoardData(String tableName, BoardData bd) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteBoardData(String tableName, int no) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean reinsertBoardData(String tableName, BoardData bd) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public BoardData[] selectedBoardDataList(String tableName, int reqPageNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardData selectedBoardData(String tableName, int no, boolean inc) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardData findById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<BoardData> userList() {
		// TODO Auto-generated method stub
		return null;
	}

}
