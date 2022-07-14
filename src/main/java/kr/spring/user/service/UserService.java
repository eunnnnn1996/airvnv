package kr.spring.user.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.spring.houseboard.vo.HouseVO;
import kr.spring.houseboard.vo.PaymentVO;
import kr.spring.user.vo.UserVO;

public interface UserService {
	public int selectUserNum();
	public void insertUser(UserVO userVO);
	public UserVO selectCheckUser(String user_id);
	public UserVO selectUser(Integer user_num);
	public void updateProfile(UserVO user);
	public void updateUserId(UserVO user);
	public void deleteUser(UserVO userVO);
	//내가 올린 집 리스트
	public List<HouseVO> selectListPostHouse(Map<String,Object> map);
	//내가 올린 집 갯수
	public int selectRowCountPostHouse(Map<String,Object> map);
	//게시한 방 게시중단
	public void postCencelUpdate(@Param("user_num") Integer user_num,@Param("market_num") int market_num);
	//게시중단한 방 다시 게시
	public void postCencelUpdateReset(@Param("user_num") Integer user_num,@Param("market_num") int market_num);
	//방 삭제
	public void deletePost(@Param("user_num") Integer user_num,@Param("market_num") int market_num);
}
