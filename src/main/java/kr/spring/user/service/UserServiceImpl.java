package kr.spring.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.user.dao.UserMapper;
import kr.spring.user.vo.UserVO;

@Service
@Transactional
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public int selectUserNum() {
		// TODO Auto-generated method stub
		return userMapper.selectUserNum();
	}

	@Override
	public void insertUser(UserVO userVO) {
		// TODO Auto-generated method stub
		userVO.setUser_num(userMapper.selectUserNum());
		userMapper.insertUser(userVO);
		userMapper.insertUserDetail(userVO);
	}

	@Override
	public UserVO selectCheckUser(String user_id) {
		// TODO Auto-generated method stub
		return userMapper.selectCheckUser(user_id);
	}
	
	
}
