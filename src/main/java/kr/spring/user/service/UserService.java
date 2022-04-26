package kr.spring.user.service;

import kr.spring.user.vo.UserVO;

public interface UserService {
	public int selectUserNum();
	public void insertUser(UserVO userVO);
	public UserVO selectCheckUser(String user_id);
	public UserVO selectUser(Integer user_num);
	public void updateProfile(UserVO user);
	public void updateUserId(UserVO user);
	public void deleteUser(UserVO userVO);
}
