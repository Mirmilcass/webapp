package mvc_ch21;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import beans.UserBean;
import db.DBAction;

public class UserDaoImpl implements UserDao {

	@Override
	public String login(String id, String pw) {
		
		return null;
	}

	@Override
	public int userInsert(UserBean user) {
		Connection conn = DBAction.getInstance().getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into userinfo(id, pass, name, regist)"
				+ " values(?, ?, ?, ?)";
		int result = -1;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPass());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getRegist());
			result = pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				if(pstmt != null) pstmt.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return result;
	}
	@Override
	public int userUpdate(UserBean user) {
		Connection conn = DBAction.getInstance().getConnection();
		PreparedStatement pstmt = null;
		String sql = "update userinfo set pass=?, name=?, regist=? where id=?";
		int result = -1;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getPass());
			pstmt.setString(2, user.getName());
			pstmt.setString(3, user.getRegist());
			pstmt.setString(4, user.getId());
			result = pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				if(pstmt != null) pstmt.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return result;
	}

	@Override
	public int userDelete(String id) {
		Connection conn = DBAction.getInstance().getConnection();
		PreparedStatement pstmt = null;
		String sql = "delete from userinfo where id=?";
		int result = -1;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				if(pstmt != null) pstmt.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return result;
	}

	@Override
	public UserBean findById(String id) {
		Connection conn = DBAction.getInstance().getConnection();
		UserBean user = new UserBean();
		String sql = "select * from userinfo where id=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				user.setId(rs.getString("id"));
				user.setPass(rs.getString("pass"));
				user.setName(rs.getString("name"));
				user.setRegist(rs.getString("regist"));
			}
		}catch(SQLException e){
			
		}finally{
			try{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				//if(conn != null) conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return user;
	}

	@Override
	public Collection<UserBean> userList() {
		Connection conn = DBAction.getInstance().getConnection();
		UserBean user = null;
		ArrayList<UserBean> data = new ArrayList<UserBean>();
		String sql = "select * from userinfo";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				user = new UserBean();
				user.setId(rs.getString("id"));
				user.setPass(rs.getString("pass"));
				user.setName(rs.getString("name"));
				user.setRegist(rs.getString("regist"));
				data.add(user);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				//if(conn != null) conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return data;
	}
}
