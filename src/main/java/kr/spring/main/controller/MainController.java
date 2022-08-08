package kr.spring.main.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.houseboard.controller.HouseController;
import kr.spring.houseboard.service.HouseService;
import kr.spring.houseboard.vo.HouseVO;
import kr.spring.util.PagingUtil;

@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(HouseController.class); // 로그찍기

	@Autowired
	private HouseService houseService;

	@RequestMapping("/main/main.do")
	public ModelAndView main(@RequestParam(value = "pageNum", defaultValue = "1") int currentPage,
			@RequestParam(value = "keyfield", defaultValue = "") String keyfield,
			@RequestParam(value = "keyword", defaultValue = "") String keyword) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		map.put("board_type", 0);
		
		int count = houseService.selectRowCount(map);

		PagingUtil page = new PagingUtil(keyfield, keyword, currentPage, count, 6, 10, "main.do");

		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());

		List<HouseVO> list = null;
		if (count > 0) {
			list = houseService.selectList(map);
			for(int i=0;i<list.size();i++) {
				HouseVO vo = list.get(i); 
				vo.setLikecount(houseService.selectLikeCount(vo.getMarket_num()));
				vo.setRatecount(houseService.selectRateCount(vo.getMarket_num()));
			}
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("pagingHtml", page.getPagingHtml());

		return mav;
	}

	// 이미지 출력
	@RequestMapping("/main/imageView.do")
	public ModelAndView viewImage(@RequestParam int market_num) {
		HouseVO house = houseService.selectHouse(market_num);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		mav.addObject("imageFile", house.getPhoto());
		mav.addObject("filename", house.getPhoto_name());
		return mav;
	}

}
