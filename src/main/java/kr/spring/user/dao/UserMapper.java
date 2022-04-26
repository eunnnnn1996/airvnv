package kr.spring.user.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.user.vo.UserVO;

public interface UserMapper {
	@Select("select auser_seq.nextval from dual")
	public int selectUserNum();
	@Insert("insert into auser(user_num,user_id) values (#{user_num},#{user_id})")
	public void insertUser(UserVO userVO);
	@Insert("insert into auser_detail(user_num,user_name,passwd,phone,zipcode,address1,address2) "
			+ "values(#{user_num},#{user_name},#{passwd},#{phone},#{zipcode},#{address1},#{address2})")
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
	
	
}
