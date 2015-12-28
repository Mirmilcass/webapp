package mvc_ch21;

import java.util.Collection;
import beans.UserBean;

public interface UserService {
	String login(String id, String pw);
	int userInsert(String id, String pass, String name, String regist);
	int userUpdate(String id, String pass, String name, String regist);
	int userDelete(String id);
	UserBean findById(String id);
	Collection<UserBean> userList(); 
}
