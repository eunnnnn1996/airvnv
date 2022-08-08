package kr.spring.houseboard.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.houseboard.vo.CategoryVO;
import kr.spring.houseboard.vo.HouseLikeVO;
import kr.spring.houseboard.vo.HouseVO;
import kr.spring.houseboard.vo.PaymentVO;
import kr.spring.houseboard.vo.RateVO;
import kr.spring.houseboard.vo.ReplyVO;
import kr.spring.user.vo.HitVO;
import kr.spring.user.vo.UserVO;

public interface HouseMapper {
	public List<HouseVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public List<HouseVO> selectWorldList(Map<String,Object> map);
	public int selectWorldRowCount(Map<String,Object> map);
	@Select("select amarket_seq.nextval from dual")
	public int amarketNumSelect();
	@Insert("insert into amarket_detail(market_num,market_title,market_content,user_num) "
			+ "values(#{market_num},#{market_title},#{market_content},#{user_num})")
	public void houseDetailInsert(HouseVO houseVO);
	@Insert("insert into amarket(market_num,market_type,market_type_sort, "
			+ "address1,address2,address3,trade_type,trade_short,otherpay, "
			+ "elevator,parking,veranda,optionitem,reg_date,modify_date,user_num,"
			+ "photo,photo_name,country) "
			+ "values(#{market_num},#{market_type},#{market_type_sort},"
			+ "#{address1},#{address2},#{address3},#{trade_type},#{trade_short},"
			+ "#{otherpay},#{elevator},#{parking},#{veranda},#{optionitem},sysdate,null,#{user_num},"
			+ "#{photo},#{photo_name},#{country})")
	public void houseInsert(HouseVO houseVO);
	@Select("select * from amarket m join auser u on m.user_num = u.user_num "
			+ "join amarket_detail d on d.market_num = m.market_num "
			+ "where m.market_num = #{market_num}")
	public HouseVO selectHouse(int market_num); 
	@Select("select *  from auser_detail u join amarket a on a.user_num = u.user_num "
			+ "where market_num = #{market_num}")
	public UserVO selectSellerInfo(int market_num);
	@Update("update amarket set market_type = #{market_type},market_type_sort= #{market_type_sort},"
			+ "address1= #{address1},address2= #{address2},address3= #{address3},"
			+ "trade_type= #{trade_type},trade_short= #{trade_short},otherpay= #{otherpay},"
			+ "elevator= #{elevator},parking= #{parking},veranda= #{veranda},"
			+ "optionitem= #{optionitem},reg_date= #{reg_date},modify_date= sysdate,"
			+ "photo =#{photo},photo_name=#{photo_name} where market_num = #{market_num}")
	public void UpdateMarket(HouseVO houseVO);
	@Update("update amarket_detail set "
			+ "market_title = #{market_title},"
			+ "market_content = #{market_content}"
			+ "where market_num = #{market_num}")
	public void UpdateMarketDetail(HouseVO houseVO);
	@Delete("delete from amarket_detail where market_num=#{market_num}")
	public void DeleteMarketDetail(int market_num);
	@Delete("delete from amarket where market_num=#{market_num}")
	public void DeleteMarket(int market_num);

	@Select("select * from houselike where user_num = #{user_num} and market_num = #{market_num}")
	public HouseLikeVO selectLike(@Param("user_num") Integer user_num,@Param("market_num") Integer market_num);
	@Delete("delete from houselike where houselike_num = #{houselike_num}")
	public void deleteLike(int houselike_num);
	@Insert("insert into houselike (houselike_num,user_num,market_num,alike) values(houselike_seq.nextval,#{user_num},#{market_num},1)")
	public void insertLike(@Param("user_num") Integer user_num,@Param("market_num") Integer market_num);
	@Select("select count(*) from houselike where market_num = #{market_num}")
	public int selectLikeCount(Integer market_num);
	
	@Insert("insert into apayment(date_num, startdate, enddate, price, market_num, user_num) "
			+ "values(houselike_seq.nextval,#{startdate},#{enddate},#{sum_price},#{market_num},#{user_num})")
	public void insertPayment(@Param("market_num")int market_num, @Param("sum_price")int sum_price, @Param("user_num")Integer user_num, @Param("startdate")Date startdate, @Param("enddate")Date enddate);
	
	public List<PaymentVO> selectListPayment(Map<String,Object> map);
	public int selectRowCountPayment(Map<String,Object> map);
	@Update("update apayment set onoff = 2 where user_num = #{user_num} and date_num = #{date_num}")
	public void cencelUpdate(@Param("user_num") Integer user_num,@Param("date_num") int date_num);
	@Update("update apayment set onoff = 1 where user_num = #{user_num} and date_num = #{date_num}")
	public void cencelUpdateReset(@Param("user_num") Integer user_num,@Param("date_num") int date_num);
	@Delete("delete from apayment where user_num = #{user_num} and date_num = #{date_num}")
	public void deleteReservation(@Param("user_num") Integer user_num,@Param("date_num") int date_num);
	//date_num 찾기
	@Select("select date_num from apayment where market_num = #{market_num}")
	public int selectDateNum(int market_num);
	
	//rate 입력
	@Insert("insert into arate(rate_num,title,content,all_rate, "
			+ "accuracy_rate,clean_rate,ease_rate,position_rate, "
			+ "communication_rate,reg_date,user_num,market_num) "
			+ "values (arate_seq.nextval,#{title},#{content},#{all_rate}, "
			+ "#{accuracy_rate},#{clean_rate},#{ease_rate},#{position_rate}, "
			+ "#{communication_rate},sysdate,#{user_num},#{market_num})")
	public void insertRate(RateVO vo);
	public List<RateVO> selectListRate(Map<String,Object> map);
	public int selectRowCountRate(Map<String,Object> map);
	//특정 댓글 내용 가져오기
	@Select("select * from arate where rate_num = #{rate_num}")
	public RateVO selectRate(Integer rate_num); 
	//댓글 개수
	@Select("select count(*) from arate where market_num = #{market_num}")
	public int selectRateCount(int market_num);
	@Update("update amarket_detail set hit=hit+1 where market_num = #{market_num}")
	public void marketHit(int market_num);
	public Integer houseAllHitCount();
	//월별 총 조회수를 ahitdate 테이블에 저장
	public void insertHitMonth(@Param("hit") int hit,@Param("month") int month);
	//월별 총 조회수 조회하기
	@Select("select * from ahitdate")
	public List<HitVO> selectHitMonth();
	//수익 저장하기 
	@Insert("insert into aincome values(arate_seq.nextval,#{sumprice},sysdate,#{market_num},#{user_num})")
	public void incomeInsert(@Param("sumprice") int sumprice,@Param("user_num") Integer user_num, @Param("market_num") int market_num);
	//수익 더하기
	@Update("update aincome set sum_income = sum_income + #{sumprice} where market_num = #{market_num}")
	public void incomeUpdate(@Param("sumprice") int sumprice, @Param("market_num") int market_num);
	//aincome 테이블에 해당 market_num이 있는지 확인
	@Select("select count(market_num) exist_num from aincome where market_num = #{market_num}")
	public int incomeSelect(int market_num);
	//유저 넘으로 총액 조회하기
	@Select("select sum(sum_income) from aincome where user_num = #{user_num}")
	public Integer incomePriceSelect(Integer user_num);

	//댓글구현
	//댓글 리스트
	public List<ReplyVO> selectListReply(Map<String,Object> map);
	//댓글 인서트
	@Insert("insert into areply values(areply_seq.nextval,#{rate_num},#{user_num},#{content},sysdate)")
	public void replyInsert(ReplyVO replyVO);
	//해당 rate 답글 개수 구하기
	@Select("select count(*) from areply where rate_num = #{rate_num}")
	public int selectRowCountReply(Map<String,Object> map);
	//해당 댓글 내용 조회하기
	@Select("select * from areply where reply_num = #{reply_num}")
	public ReplyVO selectReply(Integer reply_num);
	//댓글 업데이트
	@Update("update areply set content = #{content} where reply_num = #{reply_num}") 
	public void updateReply(ReplyVO replyVO);
	//댓글 삭제
	@Delete("delete from areply where reply_num = #{reply_num}")
	public void deleteReply(Integer reply_num);
	
	/* 카테고리 관리 */
	//모든 카테고리 조회
	@Select("select * from acategory")
	public List<CategoryVO> categorySelect();
	//보여지는 카테고리 조회
	@Select("select * from acategory where category_onoff = 1")
	public List<CategoryVO> categorySelectShow();
}
