package kr.spring.houseboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import kr.spring.houseboard.service.HouseService;
import kr.spring.houseboard.vo.HouseVO;
import kr.spring.user.service.UserService;
import kr.spring.user.vo.UserVO;

@Controller
public class HouseController {
	@Autowired
	private HouseService houseService;
	
	@ModelAttribute
	public HouseVO initCommand() {
		return new HouseVO();
	}
	
	@GetMapping("/house/houseInsert.do")
	public String houseInsertForm(HouseVO houseVO) {
		return "houseInsert";
	}
	
}
