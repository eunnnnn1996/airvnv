package kr.spring.houseboard.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.houseboard.service.HouseService;
import kr.spring.houseboard.vo.HouseVO;
import kr.spring.houseboard.vo.RateVO;
import kr.spring.houseboard.vo.ReviewVO;
import kr.spring.user.vo.UserVO;
import kr.spring.util.PagingUtil;

@Controller
public class HouseController {

	private static final Logger logger = LoggerFactory.getLogger(HouseController.class); // 로그찍기

	@Autowired
	private HouseService houseService;

	@ModelAttribute
	public HouseVO initCommand() {
		return new HouseVO();
	}

	@GetMapping("/house/houseInsert.do")
	public String houseInsertForm() {
		return "houseInsert";
	}

	@PostMapping("/house/houseInsert.do")
	public String houseInsert(@Valid HouseVO houseVO, BindingResult result, Errors errors, Model model,
			HttpSession session) {
		logger.info("집 내놓기 정보 : " + houseVO);

		if (errors.hasErrors()) {
			/* 회원가입 실패시 입력 데이터 값을 유지 */
			model.addAttribute("houseVO", houseVO);
			/* 회원가입 페이지로 다시 리턴 */
			return "houseInsert";
		}

		Integer user_num = (Integer) session.getAttribute("user_num");
		int amarket_num = houseService.amarketNumSelect();
		houseVO.setUser_num(user_num);
		houseVO.setMarket_num(amarket_num);

		houseService.houseDetailInsert(houseVO);
		houseService.houseInsert(houseVO);

		return "redirect:/main/main.do";
	}

	@RequestMapping("/house/houseDetail.do")
	public ModelAndView houseDetail(HttpSession session, int market_num) {

		HouseVO vo = houseService.selectHouse(market_num);
		UserVO uvo = houseService.selectSellerInfo(market_num);

		// 이미지 태그를 추출하기 위한 정규식
		Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
		String content = vo.getMarket_content();
		Matcher match = pattern.matcher(content);
		
		ArrayList<String> list = new ArrayList<String>();
		while (match.find()) {
			list.add(match.group(0));
		}
		
		String regex2 = "<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>";
		String html = vo.getMarket_content();
		String noneTag = html.replaceAll(regex2, "");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("houseDetail");
		mav.addObject("house", vo);
		mav.addObject("user", uvo);
		for (int i = 0; i < list.size(); i++) {
			mav.addObject("list" + i, list.get(i));
		}
		mav.addObject("noneTag",noneTag);
		
		return mav;
	}

	@GetMapping("/house/houseModify.do")
	public String houseModifyForm(int market_num, Model model) {
		HouseVO houseVO = houseService.selectHouse(market_num);

		model.addAttribute("houseVO", houseVO);

		return "houseModify";
	}

	@PostMapping("/house/houseModify.do")
	public String houseModify(@Valid HouseVO houseVO, int market_num, BindingResult result, Model model,
			HttpServletRequest request, Errors errors, HttpSession session) {

		logger.info("집 내놓기 정보 : " + houseVO);

		if (errors.hasErrors()) {
			/* 회원가입 실패시 입력 데이터 값을 유지 */
			model.addAttribute("houseVO", houseVO);
			/* 회원가입 페이지로 다시 리턴 */
			return "houseModify";
		}

		houseService.UpdateMarket(houseVO);

		model.addAttribute("message", "글 수정 완료");
		model.addAttribute("url", request.getContextPath() + "/main/main.do");

		return "common/resultView";
	}

	@GetMapping("/house/houseDelete.do")
	public String houseDelete(int market_num, Model model, HttpServletRequest request, HttpSession session) {
		Integer user_num = (Integer) session.getAttribute("user_num");
		houseService.DeleteMarketDetail(user_num, market_num);

		model.addAttribute("message", "글 삭제 완료");
		model.addAttribute("url", request.getContextPath() + "/main/main.do");

		return "common/resultView";
	}

	@PostMapping("/house/payment.do")
	public String payment(int market_num, int sum_price, Date startdate, Date enddate, Model model,
			HttpServletRequest request, HttpSession session) {

		Integer user_num = (Integer) session.getAttribute("user_num");
		houseService.insertPayment(market_num, sum_price, user_num, startdate, enddate);

		model.addAttribute("message", "예약 완료");
		model.addAttribute("url", request.getContextPath() + "/main/main.do");
		return "common/resultView";
	}

	@GetMapping("/house/reviewMain.do")
	public String reviewMainForm() {
		return "reviewMain";
	}

	@GetMapping("/house/reviewInsert.do")
	public String reviewInsertForm(@ModelAttribute("reviewVO") ReviewVO reviewVO) {
		return "reviewInsert";
	}

	@PostMapping("/house/reviewInsert.do")
	public String reviewInsert(@Valid ReviewVO reviewVO, BindingResult result, Errors errors, Model model,
			HttpSession session) {
		return "main";
	}

	@RequestMapping("/house/rateMain.do")
	public ModelAndView rateMainForm(@RequestParam(value="pageNum",defaultValue="1")
										int currentPage,
										@RequestParam(value="keyfield",defaultValue="")
										String keyfield,
										@RequestParam(value="keyword",defaultValue="")
										String keyword, 
										Integer market_num) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		map.put("market_num", market_num);
		
		int count = houseService.selectRowCountRate(map);
		
		PagingUtil page = new PagingUtil(keyfield,keyword,currentPage,count,2,10,"rateMain.do","&market_num="+market_num);
		
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<RateVO> list = null;
		
		if(count > 0) {
			list = houseService.selectListRate(map);
		}
		
		ModelAndView mav  = new ModelAndView();
		mav.setViewName("rateMain");
		mav.addObject("count", count);
		mav.addObject("list",list);
		mav.addObject("pagingHtml",page.getPagingHtml()); 
		
		float allrate = 0;
		float accuracy_rate = 0;
		float clean_rate = 0;
		float ease_rate = 0;
		float position_rate = 0;
		float communication_rate = 0;
		for(int i = 0; i<list.size();i++) {
			allrate += list.get(i).getAll_rate();
			accuracy_rate += list.get(i).getAccuracy_rate();
			clean_rate += list.get(i).getClean_rate();
			ease_rate += list.get(i).getEase_rate();
			position_rate += list.get(i).getPosition_rate();
			communication_rate += list.get(i).getCommunication_rate();
		}	
		mav.addObject("allrate",allrate/list.size());
		mav.addObject("accuracy_rate",accuracy_rate/list.size());
		mav.addObject("clean_rate",clean_rate/list.size());
		mav.addObject("ease_rate",ease_rate/list.size());
		mav.addObject("position_rate",position_rate/list.size());
		mav.addObject("communication_rate",communication_rate/list.size());
		
		return mav;
	}

	@GetMapping("/house/rateInsert.do")
	public String rateInsertGetForm(@ModelAttribute("rateVO") RateVO rateVO) {
		return "rateInsert";
	}

	
	  @PostMapping("/house/rateInsert.do") public String
	  rateInsertForm(@ModelAttribute("rateVO")RateVO rateVO,HttpSession session) {
	  
	  logger.info("점수 보기 : " + rateVO);
	  
	  Integer user_num = (Integer) session.getAttribute("user_num");
	  rateVO.setUser_num(user_num);
	  
	  int market_num = rateVO.getMarket_num(); houseService.insertRate(rateVO);
	  
	  return "redirect:/house/houseDetail.do?market_num="+market_num; }
	 

}