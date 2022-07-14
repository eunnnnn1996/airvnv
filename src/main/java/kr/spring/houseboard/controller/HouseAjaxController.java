package kr.spring.houseboard.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.houseboard.service.HouseService;
import kr.spring.houseboard.vo.HouseLikeVO;

@Controller
public class HouseAjaxController {
	@Autowired
	private HouseService houseService;
	
	@RequestMapping("/house/like.do")
	@ResponseBody
	public Map<String, Object> likeForm(int market_num,HttpSession session){
		Integer user_num = (Integer)session.getAttribute("user_num");
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		if(user_num == null) {//로그인 안됨
			map.put("result", "logout");
		}else {
			HouseLikeVO vo = houseService.selectLike(user_num, market_num);
			if(vo!=null) { //이미 추천을 한 경우
				houseService.deleteLike(vo.getHouselike_num());
				map.put("result", "success");
				map.put("status", "noFav");
				map.put("count",houseService.selectLikeCount(market_num));
			}else{
				houseService.insertLike(user_num,market_num);
				map.put("result", "success");
				map.put("status", "yesFav");
				map.put("count",houseService.selectLikeCount(market_num));
				}
			}
	
		return map; 
	}
	//게시물 들어갔을때 하트 빈하트 여부
	@RequestMapping("/house/getFav.do")
	@ResponseBody	
	public Map<String, Object> execute(int market_num,HttpSession session,HouseLikeVO hvo) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		Integer user_num = (Integer)session.getAttribute("user_num");
		
		if(user_num == null) {//로그인 안됨
			map.put("result", "success"); //좋아요 표시
			map.put("status", "noFav"); //빈 하트 표시
			map.put("count", houseService.selectLikeCount(market_num)); //좋아요 총 개수 표시
		}else {	
			hvo = houseService.selectLike(user_num, market_num);
			
			if(hvo!=null) { //vo가 null이 아니면 추천을 이미 한 경우
				map.put("result", "success");
				map.put("status", "yesFav"); // 추천하트로 표시
				map.put("count", houseService.selectLikeCount(market_num)); //좋아요 총 개수 표시
			}else{ // 추천을 안한 경우
				map.put("result", "success");
				map.put("status", "noFav"); //빈 하트 표시 
				map.put("count", houseService.selectLikeCount(market_num)); //좋아요 총 개수 표시
			}
		}
		return map;
	}
}