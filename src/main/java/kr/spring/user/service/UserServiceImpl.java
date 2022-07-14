package kr.spring.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.houseboard.vo.HouseVO;
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

	@Override
	public UserVO selectUser(Integer user_num) {
		// TODO Auto-generated method stub
		return userMapper.selectUser(user_num);
	}

	@Override
	public void updateProfile(UserVO user) {
		// TODO Auto-generated method stub
		userMapper.updateProfile(user);
	}

	@Override
	public void updateUserId(UserVO user) {
		// TODO Auto-generated method stub
		userMapper.updateUserId(user);
		userMapper.updateUserNamePhone(user);
	}

	@Override
	public void deleteUser(UserVO userVO) {
		// TODO Auto-generated method stub
		userMapper.deleteUser(userVO);
		userMapper.updateUserAuth(userVO);
	}

	@Override
	public List<HouseVO> selectListPostHouse(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.selectListPostHouse(map);
	}

	@Override
	public int selectRowCountPostHouse(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.selectRowCountPostHouse(map);
	}

	@Override
	public void postCencelUpdate(Integer user_num, int market_num) {
		// TODO Auto-generated method stub
		userMapper.postCencelUpdate(user_num, market_num);
	}

	@Override
	public void postCencelUpdateReset(Integer user_num, int market_num) {
		// TODO Auto-generated method stub
		userMapper.postCencelUpdateReset(user_num, market_num);
	}

	@Override
	public void deletePost(Integer user_num, int market_num) {
		// TODO Auto-generated method stub
		userMapper.deletePost(user_num, market_num);
		
	}
	
	
}
