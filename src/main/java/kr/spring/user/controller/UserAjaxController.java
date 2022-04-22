package kr.spring.user.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.user.service.UserService;
import kr.spring.user.vo.UserVO;

@Controller
public class UserAjaxController {
	@Autowired
	private UserService userService;
	
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
}
