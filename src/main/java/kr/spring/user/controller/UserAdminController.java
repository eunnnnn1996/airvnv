package kr.spring.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.houseboard.service.HouseService;
import kr.spring.houseboard.vo.CategoryVO;
import kr.spring.houseboard.vo.HouseVO;
import kr.spring.user.service.UserService;
import kr.spring.user.vo.HitVO;
import kr.spring.util.PagingUtil;

@Controller
public class UserAdminController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private HouseService houseService;
	
	//관리자 페이지
	@RequestMapping("/user/stats.do")
	public String statsForm(Model model) {
		Integer allhit = houseService.houseAllHitCount();

		model.addAttribute("allhit",allhit);
		
		List<HitVO> list = houseService.selectHitMonth();
		
		if(list.size() > 0) {
		model.addAttribute("January",list.get(0).getJanuary());
		model.addAttribute("Feburary",list.get(0).getFeburary());
		model.addAttribute("March",list.get(0).getMarch());
		model.addAttribute("April",list.get(0).getApril());
		model.addAttribute("May",list.get(0).getMay());
		model.addAttribute("June",list.get(0).getJune());
		model.addAttribute("July",list.get(0).getJuly());
		model.addAttribute("August",list.get(0).getAugust());
		model.addAttribute("September",list.get(0).getSeptember());
		model.addAttribute("October",list.get(0).getOctober());
		model.addAttribute("November",list.get(0).getNovember());
		model.addAttribute("December",list.get(0).getDecember());
		}
		model.addAttribute("twenty",userService.twenty());
		model.addAttribute("thirty",userService.thirty());
		model.addAttribute("forty",userService.forty());
		model.addAttribute("fifty",userService.fifty());
		model.addAttribute("sixty",userService.sixty());
	
		return "stats";
	}

	//관리자 유저 정보 페이지
	@RequestMapping("/user/userBoard.do")
	public ModelAndView userBoardForm(@RequestParam(value="pageNum",defaultValue="1")
										int currentPage,
										@RequestParam(value="keyfield",defaultValue="")
										String keyfield,
										@RequestParam(value="keyword",defaultValue="")
										String keyword) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		int count = userService.selectRowCountListUser(map);
		
		PagingUtil page = new PagingUtil(keyfield,keyword,currentPage,count,1,10,"userBoard.do");
		
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<HouseVO> list = null;
		if(count > 0) {
			list = userService.selectListUser(map);
		}
		
		ModelAndView mav  = new ModelAndView();
		mav.setViewName("userBoard");
		mav.addObject("count", count);
		mav.addObject("list",list);
		mav.addObject("pagingHtml",page.getPagingHtml()); 
		
		return mav;
	}
	//회원상태 변경하기
	@GetMapping("/user/authChange.do")
	public String authChangeAct(int user_auth,Integer user_num) {
		
		userService.updateUserAuthMaster(user_auth, user_num);
		
		
		return "redirect:/user/userBoard.do";
	}
	
	//관리자 게시물 승인 페이지
	@RequestMapping("/user/standBoard.do")
	public ModelAndView standBoardForm(@RequestParam(value="pageNum",defaultValue="1")
									int currentPage,
									@RequestParam(value="keyfield",defaultValue="")
									String keyfield,
									@RequestParam(value="keyword",defaultValue="")
									String keyword) {
		
		Map<String,Object> map = new HashMap<String,Object>();
	  	
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		map.put("board_type",0);
		
		int count = houseService.selectRowCount(map);
		
		PagingUtil page = new PagingUtil(keyfield,keyword,currentPage,count,6,10,"standBoard.do");
		
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<HouseVO> list = null;
		if(count > 0) {
			list = houseService.selectList(map);
		}
		ModelAndView mav  = new ModelAndView();
		mav.setViewName("standBoard");
		mav.addObject("count", count);
		mav.addObject("list",list);
		mav.addObject("pagingHtml",page.getPagingHtml()); 
		
		return mav;
	}
	
	//게시물 승인하기
	@GetMapping("/user/approve.do")
	public String approve(int show,int market_num) {
			userService.updateBoardShow(show,market_num);
			
			return "redirect:/user/standBoard.do";
		}
	
	//메뉴 추가, 삭제
	@RequestMapping("/user/menuAdd.do")
	public String menuAddForm(Model model) {
		
		List<CategoryVO> clist = houseService.categorySelect();
		
		model.addAttribute("clist",clist);
		
		return "menuAdd";
	}
}
