package mvc_ch21;

import java.util.Collection;

import beans.UserBean;

public interface UserDao {
	String login(String id, String pw);
	int userInsert(UserBean user);
	int userUpdate(UserBean user);
	int userDelete(String id);
	UserBean findById(String id);
	Collection<UserBean> userList(); 
}
