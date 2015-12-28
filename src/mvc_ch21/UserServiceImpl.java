package mvc_ch21;

import java.util.Collection;

import beans.UserBean;

public class UserServiceImpl implements UserService{
	
	private UserDao userDao;
	public UserServiceImpl(){
		this.userDao = new UserDaoImpl();
	}

	@Override
	public String login(String id, String pw) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int userInsert(String id, String pass, String name, String regist) {
		UserBean user = new UserBean();
		user.setId(id);
		user.setPass(pass);
		user.setName(name);
		user.setRegist(regist);
		return this.userDao.userInsert(user);
	}

	@Override
	public int userUpdate(String id, String pass, String name, String regist) {
		UserBean user = new UserBean();
		user.setId(id);
		user.setPass(pass);
		user.setName(name);
		user.setRegist(regist);
		return this.userDao.userUpdate(user);
	}

	@Override
	public int userDelete(String id) {
		return this.userDao.userDelete(id);
	}

	@Override
	public UserBean findById(String id) {
		return userDao.findById(id);
	}

	@Override
	public Collection<UserBean> userList() {
		return userDao.userList();
	}
}
