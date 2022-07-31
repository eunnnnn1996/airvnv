package kr.spring.user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.houseboard.vo.HouseVO;
import kr.spring.user.vo.HitVO;
import kr.spring.user.vo.UserVO;

public interface UserMapper {
	@Select("select auser_seq.nextval from dual")
	public int selectUserNum();
	@Insert("insert into auser(user_num,user_id) values (#{user_num},#{user_id})")
	public void insertUser(UserVO userVO);
	@Insert("insert into auser_detail(user_num,user_name,passwd,phone,zipcode,address1,address2,age) "
			+ "values(#{user_num},#{user_name},#{passwd},#{phone},#{zipcode},#{address1},#{address2},#{age})")
	public void insertUserDetail(UserVO userVO);
	@Select("select u.user_num,u.user_id,u.user_auth,d.passwd,d.user_name,d.photo from auser u "
			+ "left outer join auser_detail d on u.user_num = d.user_num "
			+ "where u.user_id = #{user_id}")
	public UserVO selectCheckUser(String user_id);
	//회원의 모든 정보 조회(비밀번호 포함)
	@Select("select * from auser a join auser_detail d on a.user_num = d.user_num where a.user_num = #{user_num}")
	public UserVO selectUser(Integer user_num);
	@Update("update auser_detail set photo=#{photo},photo_name=#{photo_name} where user_num=#{user_num}")
	public void updateProfile(UserVO user);
	//유저 아이디 변경
	@Update("update auser set user_id = #{user_id} where user_num = #{user_num}")
	public void updateUserId(UserVO user);
	//유저 닉네임, 휴대폰번호 변경
	@Update("update auser_detail set user_name = #{user_name},phone=#{phone} where user_num = #{user_num}")
	public void updateUserNamePhone(UserVO user);
	//유저 정보 삭제
	@Delete("delete from auser_detail where user_num = #{user_num}")
	public void deleteUser(UserVO userVO);
	//유저 삭제 후 auth를 0(탈퇴)으로 변경
	@Update("update auser set user_auth = '0' where user_num = #{user_num}")
	public void updateUserAuth(UserVO userVO);
	//내가 올린 방 리스트
	public List<HouseVO> selectListPostHouse(Map<String,Object> map);
	//내가 올린 방 갯수
	public int selectRowCountPostHouse(Map<String,Object> map);
	@Update("update amarket_detail set onoff = 2 where user_num = #{user_num} and market_num = #{market_num}")
	public void postCencelUpdate(@Param("user_num") Integer user_num,@Param("market_num") int market_num);
	@Update("update amarket_detail set onoff = 1 where user_num = #{user_num} and market_num = #{market_num}")
	public void postCencelUpdateReset(@Param("user_num") Integer user_num,@Param("market_num") int market_num);
	@Delete("delete from amarket_detail where user_num = #{user_num} and market_num = #{market_num}")
	public void deletePost(@Param("user_num") Integer user_num,@Param("market_num") int market_num);
	//모든 회원 정보조회(관리자)
	public List<HouseVO> selectListUser(Map<String,Object> map);
	//모든 회원 갯수(관리자)
	public int selectRowCountListUser(Map<String,Object> map);
	//회원 상태 변경
	@Update("update auser set user_auth = #{user_auth} where user_num = #{user_num}")
	public void updateUserAuthMaster(@Param("user_auth")int user_auth,@Param("user_num")Integer user_num);
	//게시물 상태 변경
	@Update("update amarket set show=#{show} where market_num = #{market_num}")
	public void updateBoardShow(@Param("show") int show,@Param("market_num") int market_num);
	//평균 나이 20대 이하
	@Select("select count(age) from auser_detail where age between 0 and 29")
	public int twenty();
	//평균 나이 30대
	@Select("select count(age) from auser_detail where age between 30 and 39")
	public int thirty();
	//평균 나이 40대
	@Select("select count(age) from auser_detail where age between 40 and 49")
	public int forty();
	//평균 나이 50대
	@Select("select count(age) from auser_detail where age between 50 and 59")
	public int fifty();
	//평균 나이 60대 이상
	@Select("select count(age) from auser_detail where age >= 60")
	public int sixty();
}
