package kr.spring.user.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.user.vo.UserVO;

public interface UserMapper {
	@Select("select auser_seq.nextval from dual")
	public int selectUserNum();
	@Insert("insert into auser(user_num,user_id) values (#{user_num},#{user_id})")
	public void insertUser(UserVO userVO);
	@Insert("insert into auser_detail(user_num,user_name,passwd,phone,zipcode,address1,address2) "
			+ "values(#{user_num},#{user_name},#{passwd},#{phone},#{zipcode},#{address1},#{address2})")
	public void insertUserDetail(UserVO userVO);
	
	@Select("select u.user_id,u.user_auth,d.passwd,d.user_name,d.photo from auser u "
			+ "left outer join auser_detail d on u.user_num = d.user_num "
			+ "where u.user_id = #{user_id}")
	public UserVO selectCheckUser(String user_id);
	
}
