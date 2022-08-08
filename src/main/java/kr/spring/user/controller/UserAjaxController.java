package kr.spring.user.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.houseboard.service.HouseService;
import kr.spring.user.service.UserService;
import kr.spring.user.vo.UserVO;

@Controller
public class UserAjaxController {
	@Autowired
	private UserService userService;
	@Autowired
	private HouseService houseService;
	
	@RequestMapping("/user/confirmId.do")
	@ResponseBody
	public Map<String, String> process(@RequestParam String user_id){
		
		Map<String, String> map = new HashMap<String, String>();
		
		UserVO user= userService.selectCheckUser(user_id);
		//경우의 수 세가지 
		if(user!=null) {
			//아이디 중복 
			map.put("result", "idDuplicated");
		}else {
			if(!Pattern.matches("^[A-Za-z0-9]{4,12}$", user_id)) {
				//패턴 불일치
				map.put("result", "notMatchPattern");
			}else {
				//아이디 미중복
				map.put("result", "idNotFound");
			}
		}
		return map;
	}
	@RequestMapping("/user/updateMyPhoto.do")
	@ResponseBody
	public Map<String,String> processProfile(UserVO userVO,
										HttpSession session){
		Map<String,String> map = new HashMap<String,String>();
		
		Integer user_num = (Integer)session.getAttribute("user_num");
		if(user_num==null) {//로그인 되지 않은 경우
			map.put("result", "logout");
		}else {//로그인 된 경우
			userVO.setUser_num(user_num);
			userService.updateProfile(userVO);
			
			//이미지를 업로드한 후 세션에 저장된 user_photo 값 변경
			session.setAttribute("user_photo", userVO.getPhoto());
			
			map.put("result","success");
		}
		
		return map;
	}
	//월간 조회수 최신화
	@RequestMapping("/user/hitRefresh")
	@ResponseBody
	public Map<String,String> hitRefreshbtn() {
		
		Map<String,String> map = new HashMap<String,String>();
		Map<String,Integer> mapB = new HashMap<String,Integer>();
		
		Integer allhit = houseService.houseAllHitCount();
		mapB.put("allhit", allhit);
		
		//현재 날짜 구하기
		LocalDate now = LocalDate.now(); 
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM"); 
		String formatedNow = now.format(formatter);
		
		if (formatedNow.equals("2022/01")) {
			houseService.insertHitMonth(allhit, 1);
		} else if (formatedNow.equals("2022/02")) {
			houseService.insertHitMonth(allhit, 2);
		} else if (formatedNow.equals("2022/03")) {
			houseService.insertHitMonth(allhit, 3);
		} else if (formatedNow.equals("2022/04")) {
			houseService.insertHitMonth(allhit, 4);
		} else if (formatedNow.equals("2022/05")) {
			houseService.insertHitMonth(allhit, 5);
		} else if (formatedNow.equals("2022/06")) {
			houseService.insertHitMonth(allhit, 6);
		} else if (formatedNow.equals("2022/07")) {
			houseService.insertHitMonth(allhit, 7);
		} else if (formatedNow.equals("2022/08")) {
			houseService.insertHitMonth(allhit, 8);
		} else if (formatedNow.equals("2022/09")) {
			houseService.insertHitMonth(allhit, 9);
		} else if (formatedNow.equals("2022/10")) {
			houseService.insertHitMonth(allhit, 10);
		} else if (formatedNow.equals("2022/11")) {
			houseService.insertHitMonth(allhit, 11);
		} else if (formatedNow.equals("2022/12")) {
			houseService.insertHitMonth(allhit, 12);
		} else {
			System.out.println("오류");
		}
		
		map.put("result","success");
		
		return map;
	}
	
	@RequestMapping("/user/menuDelete.do")
	@ResponseBody
	public Map<String,String> menuDeleteForm(String countryRadio) {
		Map<String,String> map = new HashMap<String,String>();
		
		if(countryRadio == null) {
			map.put("result","fail");
		}else if(countryRadio != null) {
			userService.menuDelete(countryRadio);
			map.put("result","success");
		}
		
		return map;
	}
	
	@RequestMapping("/user/menuInsert.do")
	@ResponseBody
	public Map<String,String> menuInsertForm(String countryRadio) {
		Map<String,String> map = new HashMap<String,String>();
		
		if(countryRadio == null) {
			map.put("result","fail");
		}else if(countryRadio != null) {
			userService.menuInsert(countryRadio);
			map.put("result","success");
		}
		
		return map;
	}
	
}
