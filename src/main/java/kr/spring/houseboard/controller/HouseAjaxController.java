package kr.spring.houseboard.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.houseboard.service.HouseService;
import kr.spring.houseboard.vo.HouseLikeVO;
import kr.spring.houseboard.vo.ReplyVO;
import kr.spring.util.PagingUtil;

@Controller
public class HouseAjaxController {
	
	private static final Logger logger = LoggerFactory.getLogger(HouseController.class); // 로그찍기
	
	private int rowCount = 10;
	
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
	
	//댓글 시작
	//댓글 List
	@RequestMapping("/house/replyList.do")
	@ResponseBody
	public Map<String,Object> replyList(@RequestParam(value="pageNum", defaultValue="1") int currentPage,
										@RequestParam Integer rate_num, HttpSession session){
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("rate_num",rate_num);
		
		int count = houseService.selectRowCountReply(map);
		PagingUtil page = new PagingUtil(currentPage, count, rowCount, 10, null);
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<ReplyVO> list = null;
		if(count>0) {
			list = houseService.selectListReply(map);
		}else {
			list = Collections.emptyList(); //null값을 넘겨주지 않기 위해서 list를 빈값으로 
		}
		
		Map<String,Object> mapj = new HashMap<String,Object>();
		mapj.put("count", count);
		mapj.put("rowCount", rowCount);
		mapj.put("list", list);
		mapj.put("user_num", (Integer)session.getAttribute("user_num"));
		
		return mapj;
	}
	
	//댓글 insert
	@RequestMapping("/house/replyInsert.do")
	@ResponseBody
	public Map<String,String> replyInsert(ReplyVO replyVO,HttpSession session, 
														HttpServletRequest request){
		Map<String,String> map = new HashMap<String,String>();
		
		Integer user_num = (Integer)session.getAttribute("user_num");
		
		if(user_num == null) {
			map.put("result", "logout");
		}else {
			replyVO.setUser_num(user_num);
			houseService.replyInsert(replyVO);
			map.put("result", "success");
		}
		
		return map;
	}
	
	@RequestMapping("/house/replyUpdate.do")
	@ResponseBody
	public Map<String,String> replyUpdate(ReplyVO replyVO, HttpSession session, 
														HttpServletRequest request){
		
		Map<String,String>map = new HashMap<String,String>();
		
		Integer user_num = (Integer)session.getAttribute("user_num");
		ReplyVO dbVO = houseService.selectReply(replyVO.getReply_num());
		
		if(user_num==null) {
			map.put("result","logout");
		}else if(user_num!=null && user_num == dbVO.getUser_num()){
			houseService.updateReply(replyVO);
			map.put("result","success");
		}else {
			map.put("result","wrongAccess");
		}
		
		return map;
	}
	
	@RequestMapping("/house/replyDelete.do")
	@ResponseBody
	public Map<String,String> deleteReply(@RequestParam int re_num, HttpSession session){
		
		Map<String,String> map = new HashMap<String,String>();
		Integer user_num = (Integer)session.getAttribute("user_num");
		
		ReplyVO dvo = houseService.selectReply(re_num);
		
		if(user_num ==null) {
			map.put("result","logout");
		}else if(user_num!=null && user_num == dvo.getUser_num()) {
			houseService.deleteReply(re_num);
			map.put("result","success");
		}
		else {
			map.put("result","wrongAccess");
		}
		
		return map;
	}
	
}

















