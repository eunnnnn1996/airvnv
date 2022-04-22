package kr.spring.user.service;

import kr.spring.user.vo.UserVO;

public interface UserService {
	public int selectUserNum();
	public void insertUser(UserVO userVO);
	public UserVO selectCheckUser(String user_id);
}
