package kr.spring.user.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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
	//모든 회원 정보조회(관리자)
	public List<HouseVO> selectListUser(Map<String,Object> map);
	//모든 회원 개수(관리자)
	public int selectRowCountListUser(Map<String,Object> map);
	//판매한 기록이 있는 회원 조회(관리자)
	public List<HouseVO> selectListIncome(Map<String,Object> map);
	//판매한 기록이 있는 회원 개수(관리자)
	public int selectRowCountIncomeList(Map<String,Object> map);
	//승인대기 중인 방 리스트
	public List<HouseVO> selectListReservationOnOff(Map<String,Object> map);
	//승인대기 중인 방 개수
	public int selectRowCountReservationOnOff(Map<String,Object> map);
	//승인대기 중인 방 승인
	public void ReservationOnOffUpdate(Integer date_num);
	//승인대기 중인 방 취소
	public void ReservationOnOffCencel(Integer date_num);
	//회원 상태 변경
	public void updateUserAuthMaster(@Param("user_auth")int user_auth,@Param("user_num")Integer user_num);
	//게시물 상태 변경
	public void updateBoardShow(@Param("show") int show,@Param("market_num") int market_num);
	//평균 나이 20대 이하
	public int twenty();
	//평균 나이 30대
	public int thirty();
	//평균 나이 40대
	public int forty();
	//평균 나이 50대
	public int fifty();
	//평균 나이 60대 이상
	public int sixty();
	
	//메뉴 관리
	//메뉴 추가
	public void menuInsert(String category_name);
	//메뉴 삭제
	public void menuDelete(String category_name);
	//카테고리 추가
	public void categoryInsert(String category_name);
	
	//좋아요 누른 방 조회
	public List<HouseVO> selectListLikeBoard(Map<String,Object> map);
	//좋아요 누른 방 개수
	public int selectRowCountLikeBoard(Map<String,Object> map);
}
