package kr.spring.houseboard.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.houseboard.dao.HouseMapper;
import kr.spring.houseboard.vo.HouseLikeVO;
import kr.spring.houseboard.vo.HouseVO;
import kr.spring.houseboard.vo.PaymentVO;
import kr.spring.houseboard.vo.RateVO;
import kr.spring.user.vo.HitVO;
import kr.spring.user.vo.UserVO;

@Service
@Transactional
public class HouseServiceImpl implements HouseService{
	@Autowired
	private HouseMapper houseMapper;

	@Override
	public int amarketNumSelect() {
		// TODO Auto-generated method stub
		return houseMapper.amarketNumSelect();
	}

	@Override
	public void houseDetailInsert(HouseVO houseVO) {
		// TODO Auto-generated method stub
		houseMapper.houseDetailInsert(houseVO);
	}

	@Override
	public void houseInsert(HouseVO houseVO) {
		// TODO Auto-generated method stub
		houseMapper.houseInsert(houseVO);
	}

	@Override
	public List<HouseVO> selectList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return houseMapper.selectList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return houseMapper.selectRowCount(map);
	}

	@Override
	public HouseVO selectHouse(int market_num) {
		// TODO Auto-generated method stub
		return houseMapper.selectHouse(market_num);
	}

	@Override
	public UserVO selectSellerInfo(int market_num) {
		// TODO Auto-generated method stub
		return houseMapper.selectSellerInfo(market_num);
	}

	@Override
	public void UpdateMarket(HouseVO houseVO) {
		// TODO Auto-generated method stub
		houseMapper.UpdateMarket(houseVO);
		houseMapper.UpdateMarketDetail(houseVO);
	}

	@Override
	public void DeleteMarketDetail(Integer user_num, int market_num) {
		// TODO Auto-generated method stub
		int date_num = houseMapper.selectDateNum(market_num);
		houseMapper.deleteReservation(user_num, date_num);
		houseMapper.DeleteMarketDetail(market_num);
		houseMapper.DeleteMarket(market_num);
	}

	@Override
	public HouseLikeVO selectLike(Integer user_num, Integer market_num) {
		// TODO Auto-generated method stub
		return houseMapper.selectLike(user_num, market_num);				
	}

	@Override
	public void deleteLike(int houselike_num) {
		// TODO Auto-generated method stub
		houseMapper.deleteLike(houselike_num);
	}

	@Override
	public void insertLike(Integer user_num, Integer market_num) {
		// TODO Auto-generated method stub
		houseMapper.insertLike(user_num, market_num);
	}

	@Override
	public int selectLikeCount(Integer market_num) {
		// TODO Auto-generated method stub
		return houseMapper.selectLikeCount(market_num);
	}

	@Override
	public void insertPayment(int market_num, int sum_price, Integer user_num, Date startdate, Date enddate) {
		// TODO Auto-generated method stub
		houseMapper.insertPayment(market_num, sum_price, user_num, startdate, enddate);
	}

	@Override
	public List<PaymentVO> selectListPayment(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return houseMapper.selectListPayment(map);
	}

	@Override
	public int selectRowCountPayment(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return houseMapper.selectRowCountPayment(map);
	}

	@Override
	public void cencelUpdate(Integer user_num, int date_num) {
		// TODO Auto-generated method stub
		houseMapper.cencelUpdate(user_num, date_num);
	}

	@Override
	public void cencelUpdateReset(Integer user_num, int date_num) {
		// TODO Auto-generated method stub
		houseMapper.cencelUpdateReset(user_num, date_num);
	}

	@Override
	public void deleteReservation(Integer user_num, int date_num) {
		// TODO Auto-generated method stub
		houseMapper.deleteReservation(user_num, date_num);
	}

	@Override
	public int selectDateNum(int market_num) {
		// TODO Auto-generated method stub
		return houseMapper.selectDateNum(market_num);
	}

	@Override
	public void insertRate(RateVO vo) {
		// TODO Auto-generated method stub
		houseMapper.insertRate(vo);
	}

	@Override
	public List<RateVO> selectListRate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return houseMapper.selectListRate(map);
	}

	@Override
	public int selectRowCountRate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return houseMapper.selectRowCountRate(map);
	}

	@Override
	public void marketHit(int market_num) {
		// TODO Auto-generated method stub
		houseMapper.marketHit(market_num);
	}

	@Override
	public int houseAllHitCount() {
		// TODO Auto-generated method stub
		return houseMapper.houseAllHitCount();
	}

	@Override
	public void insertHitMonth(int hit, int month) {
		// TODO Auto-generated method stub
		houseMapper.insertHitMonth(hit, month);
	}

	@Override
	public List<HitVO> selectHitMonth() {
		// TODO Auto-generated method stub
		return houseMapper.selectHitMonth();
	}

	@Override
	public void incomeInsert(int sumprice, Integer user_num, int market_num) {
		// TODO Auto-generated method stub
		houseMapper.incomeInsert(sumprice, user_num, market_num);
	}

	@Override
	public void incomeUpdate(int sumprice, int market_num) {
		// TODO Auto-generated method stub
		houseMapper.incomeUpdate(sumprice, market_num);
	}

	@Override
	public int incomeSelect(int market_num) {
		// TODO Auto-generated method stub
		return houseMapper.incomeSelect(market_num);
	}

	@Override
	public int incomePriceSelect(Integer user_num) {
		// TODO Auto-generated method stub
		return houseMapper.incomePriceSelect(user_num);
	}

	@Override
	public int selectRateCount(int market_num) {
		// TODO Auto-generated method stub
		return houseMapper.selectRateCount(market_num);
	}

}
