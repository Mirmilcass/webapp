package board;

import db.DBAction;

import java.sql.*;
import java.util.ArrayList;

public class BoardMgr {

	private static BoardMgr instance = new BoardMgr();
	private String sql;
	private int rowCount, PageCount, confirm;
	private boolean insert_confirm, information;
	private DBAction db;
	private BoardData bd;

	public BoardMgr() {
		db = DBAction.getInstance();
	}

	public static BoardMgr getInstance() {
		if (instance == null)
			instance = new BoardMgr();
		return instance;
	}

	public int getPageCount(String tableName) throws SQLException {
		rowCount = 0;
		PageCount = 0;

		//		sql = "select count(*) from ?"; // 테이블 명은 값이 아니기에 변수를 쓸 수 있지만 ?는 안된다.
		sql = "select count(*) from " + tableName;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = db.getConnection().prepareStatement(sql);
			//			pstmt.setString(1, tableName);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				rowCount = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
		}

		PageCount = rowCount / 15;

		if (rowCount % 15 > 0)
			PageCount++;

		return PageCount;
	}

	public BoardData[] selectedBoardDataList(String tableName, int reqPageNo) throws Exception {

		// list 페이지로 왔을때만 infomation을 true
		information = true; // 조회 on
		BoardData[] bdList;
		BoardData data;
		ArrayList<Object> arr = new ArrayList<Object>();
		int start = 15 * (reqPageNo - 1);
		// 시작 게시물 ex : 0, 15, 30, 45, ...
		// oracle 사용시 ex : 15, 30, 45, ...
		//		int end = 15; // mysql
		int end = reqPageNo * 15; // 오라클

		// mysql
		// sql = "select * from board_list order by gno desc, ono asc limit " + start + ", " + end;

		// oracle 적용
		/* sql = "select * from (select a.*, rownum rseq from (select * from " + tableName
				+ " order by gon desc, ono asc)a) where rseq > " + start + " and rownum <= " + end;*/
		sql = "select * from (select a.*, rownum rseq from (select * from " + tableName
				+ " order by gno desc, ono asc)a) where rseq > ? and rownum <= ?";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//		ResultSetMetaData rsmd = null;

		try {
			pstmt = db.getConnection().prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			//			rsmd = rs.getMetaData();

			while (rs.next()) {
				data = new BoardData();
				data.setNum(rs.getInt("board_num"));
				data.setGroup(rs.getInt("gno"));
				data.setOrder(rs.getInt("ono"));
				data.setNested(rs.getInt("nested"));
				data.setId(rs.getString("id"));
				data.setName(rs.getString("name"));
				data.setTitle(rs.getString("title"));
				data.setContent(rs.getString("content"));
				data.setWdate(rs.getString("wdate"));
				data.setReadno(rs.getInt("readno"));
				//				data.setPseq(rs.getInt("pseq"));
				//				data.setReply(rs.getInt("reply"));
				arr.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
		}

		bdList = new BoardData[arr.size()];
		for (int i = 0; i < bdList.length; i++) {
			bdList[i] = (BoardData) arr.get(i);
		}
		return bdList;
	}

	public boolean insertBoardData(String tableName, BoardData bd) throws SQLException {

		int maxgno = 0;
		sql = "select max(gno) from " + tableName;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = db.getConnection().prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				maxgno = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
		}

		//		sql = "insert into ? values(?,?,?,?,?,?,?,?,?,?,?)"; // mysql
		sql = "insert into " + tableName + " values(board_num.nextval,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			pstmt = db.getConnection().prepareStatement(sql);
			pstmt.setInt(1, (maxgno + 1));
			pstmt.setInt(2, 0);
			pstmt.setInt(3, 0);
			pstmt.setString(4, bd.getId());
			pstmt.setString(5, bd.getName());
			pstmt.setString(6, bd.getTitle());
			pstmt.setString(7, bd.getContent());
			pstmt.setString(8, bd.getWdate());
			pstmt.setInt(9, 0);
			pstmt.setInt(10, 0);
			pstmt.setInt(11, 0);

			confirm = pstmt.executeUpdate();
			insert_confirm = confirm == 1 ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
		}

		return insert_confirm;
	}

	public BoardData selectedBoardData(String tableName, int no, boolean inc) throws SQLException {

		sql = "select * from " + tableName + " where board_num=?";

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			pstmt = db.getConnection().prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				bd = new BoardData();
				bd.setNested(rs.getInt("nested"));
				bd.setOrder(rs.getInt("ono"));
				bd.setGroup(rs.getInt("gno"));
				bd.setId(rs.getString("id"));
				bd.setName(rs.getString("name"));
				bd.setWdate(rs.getString("wdate"));
				bd.setReadno(rs.getInt("readno"));
				bd.setTitle(rs.getString("title"));
				bd.setContent(rs.getString("content"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
		}

		if (inc && information) {
			sql = "UPDATE " + tableName + " set readno =? where board_num=?";

			try {
				pstmt = db.getConnection().prepareStatement(sql);
				pstmt.setInt(1, (bd.getReadno() + 1));
				pstmt.setInt(2, no);

				confirm = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (pstmt != null)
					pstmt.close();
			}

			bd.setReadno(bd.getReadno() + 1); // 조회수를 최신 상태로 보여준다.
			information = false; // 조회 off.
		}

		return bd;
	}

	public boolean updateBoardData(String tableName, BoardData bd) throws SQLException {

		sql = "UPDATE  " + tableName + " set title=?,content=?,wdate=? where board_num=?";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = db.getConnection().prepareStatement(sql);
			pstmt.setInt(4, bd.getNum());
			pstmt.setString(1, bd.getTitle());
			pstmt.setString(2, bd.getContent());
			pstmt.setString(3, bd.getWdate());

			confirm = pstmt.executeUpdate();
			insert_confirm = confirm == 1 ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
		}

		return insert_confirm;
	}

	public boolean reinsertBoardData(String tableName, BoardData bd) throws SQLException {

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		sql = "update " + tableName + " set ono = ono + 1 where gno = ? and ono > ?";

		try {
			pstmt = db.getConnection().prepareStatement(sql);
			pstmt.setInt(1, bd.getGroup());
			pstmt.setInt(2, bd.getOrder());
			confirm = pstmt.executeUpdate();
			insert_confirm = confirm == 1 ? true : false;
			System.out.println("update : " + insert_confirm);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
		}

		sql = "insert into " + tableName + " values(board_num.nextval,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			pstmt = db.getConnection().prepareStatement(sql);
			pstmt.setInt(1, bd.getGroup());
			pstmt.setInt(2, (bd.getOrder() + 1));
			pstmt.setInt(3, (bd.getNested() + 1));
			pstmt.setString(4, bd.getId());
			pstmt.setString(5, bd.getName());
			pstmt.setString(6, bd.getTitle());
			pstmt.setString(7, bd.getContent());
			pstmt.setString(8, bd.getWdate());
			pstmt.setInt(9, 0);
			pstmt.setInt(10, 0);
			pstmt.setInt(11, 0);

			confirm = pstmt.executeUpdate();
			insert_confirm = confirm == 1 ? true : false;
			System.out.println("insert : " + insert_confirm);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
		}

		return insert_confirm;
	}
	
	
}
