package kr.spring.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.houseboard.service.HouseService;
import kr.spring.houseboard.vo.HouseVO;
import kr.spring.houseboard.vo.PaymentVO;
import kr.spring.user.service.UserService;
import kr.spring.user.vo.UserVO;
import kr.spring.util.AuthBlockException;
import kr.spring.util.AuthCheckException;
import kr.spring.util.PagingUtil;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private HouseService houseService;
	
	@ModelAttribute
	public UserVO initCommand() {
		return new UserVO();
	}
	
	@GetMapping("/user/signUp.do")
	public String signUpForm() {
		return "signUp";
	}
	@PostMapping("/user/signUp.do")
	public String signUpSubmit(@Valid UserVO userVO, BindingResult result) {
		
		if (result.hasErrors()) {
			return signUpForm();
		}
		
		BCryptPasswordEncoder sc = new BCryptPasswordEncoder();
		String scPassword = sc.encode(userVO.getPasswd());
		userVO.setPasswd(scPassword);

		userService.insertUser(userVO);
		
		return "redirect:/main/main.do";
	}
	
	@PostMapping("/user/login.do")
	public String signIn(UserVO userVO, Model model, HttpSession session,
												HttpServletRequest request) {

		try {
			UserVO user = userService.selectCheckUser(userVO.getUser_id()); //form에서 가져온거

			boolean check = false;
			if (user != null) {
				check = user.isCheckedPassword(userVO.getPasswd());
			}
			if (user.getUser_auth() == 0) {
				throw new AuthCheckException();
			} else {
				if (user.getUser_auth() == 1 && check) {
					throw new AuthBlockException();
				}
				if (check) {
					session.setAttribute("user_num", user.getUser_num());
					session.setAttribute("user_name", user.getUser_name());
					session.setAttribute("user_auth", user.getUser_auth());
					session.setAttribute("user_photo", user.getPhoto());

					return "redirect:/main/main.do";
				}
			}

			throw new Exception();
		} catch (AuthCheckException e) {
			model.addAttribute("message", "로그인 오류"); 
			model.addAttribute("url", request.getContextPath() + "/main/main.do");
		} catch (AuthBlockException e) {
			model.addAttribute("message", "정지된 회원 입니다"); 
			model.addAttribute("url", request.getContextPath() + "/main/main.do");
		} catch (Exception e) {
			model.addAttribute("message", "아이디 또는 비밀번호 불일치"); 
			model.addAttribute("url", request.getContextPath() + "/main/main.do");	 
		}
		return "common/resultView";
	}
	
	@RequestMapping("/user/logout.do")
	public String processLogout(HttpSession session) {
		
		session.invalidate();

		return "redirect:/main/main.do";
	}
	
	@RequestMapping("/user/myPage.do")
	public String myPageForm(HttpSession session, Model model) {
		
		Integer user_num = (Integer) session.getAttribute("user_num");
		UserVO user = userService.selectUser(user_num);

		model.addAttribute("user",user);
		
		return "myPage";
	}
	//내가 예약한 방
	@RequestMapping("/user/myReservation.do")
	public ModelAndView myReservationForm(HttpSession session,
			@RequestParam(value="pageNum",defaultValue="1")
			int currentPage,
			@RequestParam(value="keyfield",defaultValue="")
			String keyfield,
			@RequestParam(value="keyword",defaultValue="")
			String keyword) {
		
		Integer user_num = (Integer) session.getAttribute("user_num");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		map.put("user_num", user_num);
		
		int count = houseService.selectRowCountPayment(map);
		
		PagingUtil page = new PagingUtil(keyfield,keyword,currentPage,count,20,10,"myReservation.do");
		
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<PaymentVO> list = null;
		if(count > 0) {
			list = houseService.selectListPayment(map);
		}
		
		ModelAndView mav  = new ModelAndView();
		mav.setViewName("myReservation");
		mav.addObject("count", count);
		mav.addObject("list",list);
		mav.addObject("pagingHtml",page.getPagingHtml());
		
		return mav;
	}
	//내가 예약한 방 예약취소
	@RequestMapping("/user/reservationCencel.do")
	public String Cencel(HttpSession session,int date_num,int onoff) {
		Integer user_num = (Integer) session.getAttribute("user_num");
		
		if(onoff == 1) {
			houseService.cencelUpdate(user_num, date_num);
		}else if(onoff == 2) {
			houseService.cencelUpdateReset(user_num, date_num);
		}
		return "redirect:/user/myReservation.do";
	}
	//내가 예약한 방 목록삭제
	@RequestMapping("/user/reservationDelete.do")
	public String reservationDelete(HttpSession session,Model model,
										HttpServletRequest request,int date_num,int onoff) {
		Integer user_num = (Integer) session.getAttribute("user_num");
		
		if(onoff == 1) {
			model.addAttribute("message", "취소 처리중"); 
			model.addAttribute("url", request.getContextPath() + "/user/myReservation.do");
			return "common/resultView";
		}else if(onoff == 2) { 
			model.addAttribute("message", "예약 중단 후 삭제하세요 (예약 중단 문의는 방 상세페이지 호스트에게 연락)");
		    model.addAttribute("url", request.getContextPath() + "/user/myReservation.do"); 
		    return "common/resultView"; 
		}else if(onoff == 3) {
			houseService.deleteReservation(user_num, date_num);
		}
		 
		model.addAttribute("message", "오류"); 
		model.addAttribute("url", request.getContextPath() + "/user/myReservation.do");
		return "common/resultView";
	}
	
	// 이미지 출력
	@RequestMapping("/user/photoView.do")
	public ModelAndView viewImage(HttpSession session) {

		Integer user_num = (Integer) session.getAttribute("user_num");
		UserVO userVO = userService.selectUser(user_num);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		mav.addObject("imageFile", userVO.getPhoto());
		mav.addObject("filename", userVO.getPhoto_name());

		return mav;
	}
	// 후기 프로필이미지 출력
	@RequestMapping("/user/ratePhotoView.do")
	public ModelAndView rateImage(Integer user_num) {

		UserVO userVO = userService.selectUser(user_num);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		mav.addObject("imageFile", userVO.getPhoto());
		mav.addObject("filename", userVO.getPhoto_name());

		return mav;
	}
	//회원 정보수정
	@RequestMapping("/user/userUpdate.do")
	public String updateForm(Model model, UserVO user, HttpSession session
														,HttpServletRequest request) {
		Integer user_num = (Integer) session.getAttribute("user_num");
		user.setUser_num(user_num);
		
		userService.updateUserId(user);
		
		model.addAttribute("message", "정보 수정 완료"); 
		model.addAttribute("url", request.getContextPath() + "/main/main.do");
		
		return "common/resultView";
	}
	//회원 탈퇴
	@RequestMapping("/user/userDelete.do")
	public String updateForm(UserVO userVO,Model model,HttpSession session ,HttpServletRequest request) {
		Integer user_num = (Integer) session.getAttribute("user_num");
		//회원탈퇴view에서 입력한 비밀번호
		String deletePasswd = userVO.getPasswd();
		UserVO userCheckVO = userService.selectUser(user_num);
		
	    if(deletePasswd.equals(userCheckVO.getPasswd())) {
		  userService.deleteUser(userCheckVO);
		  session.invalidate();
		  model.addAttribute("message", "회원탈퇴 완료"); 
		  model.addAttribute("url", request.getContextPath() + "/main/main.do");
	    }else {
	      model.addAttribute("message", "비밀번호가 일치하지 않습니다"); 
		  model.addAttribute("url", request.getContextPath() + "/user/myPage.do");
	    }
		
		return "common/resultView";
	}
	
	@RequestMapping("/user/myPost.do")
	public ModelAndView myPost(HttpSession session,
			@RequestParam(value="pageNum",defaultValue="1")
			int currentPage,
			@RequestParam(value="keyfield",defaultValue="")
			String keyfield,
			@RequestParam(value="keyword",defaultValue="")
			String keyword) {
		
		Integer user_num = (Integer) session.getAttribute("user_num");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		map.put("user_num", user_num);
		
		int count = userService.selectRowCountPostHouse(map);
		
		PagingUtil page = new PagingUtil(keyfield,keyword,currentPage,count,5,10,"myPost.do");
		
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<HouseVO> list = null;
		
		if(count > 0) {
			list = userService.selectListPostHouse(map);
		}
		ModelAndView mav  = new ModelAndView();
		mav.setViewName("myPost");
		mav.addObject("count", count);
		mav.addObject("list",list);
		mav.addObject("pagingHtml",page.getPagingHtml());
		
		return mav;
	} 
		//내가 게시한방 게시중단 및 재시작
		@RequestMapping("/user/postCencel.do")
		public String postCencel(HttpSession session,int market_num,int onoff) {
			Integer user_num = (Integer) session.getAttribute("user_num");
			
			if(onoff == 1) {
				userService.postCencelUpdate(user_num, market_num);
			}else if(onoff == 2) {
				userService.postCencelUpdateReset(user_num, market_num);
			}
			return "redirect:/user/myPost.do";
		}
		//내가 게시한방 삭제
		@RequestMapping("/user/postDelete.do")
		public String postDelete(HttpSession session,Model model,
											HttpServletRequest request,int market_num,int onoff) {
			Integer user_num = (Integer) session.getAttribute("user_num");
			
			if(onoff == 2) {
				houseService.DeleteMarketDetail(market_num);
				model.addAttribute("message", "삭제 완료"); 
				model.addAttribute("url", request.getContextPath() + "/user/myPost.do");
				return "common/resultView";
			}else if(onoff == 1) {
				model.addAttribute("message", "게시 중단 후 삭제하세요"); 
				model.addAttribute("url", request.getContextPath() + "/user/myPost.do");
				return "common/resultView";
			}
			model.addAttribute("message", "오류"); 
			model.addAttribute("url", request.getContextPath() + "/user/myPost.do");
			return "common/resultView";
		}	
		
		@GetMapping("/user/money.do")
		public String moneyForm(HttpSession session,Model model) {
			
			Integer user_num = (Integer) session.getAttribute("user_num");
			
			Integer price = houseService.incomePriceSelect(user_num);
			
			model.addAttribute("price",price);
			
			return "money";
		}
		
		@RequestMapping("/user/ReservationOn.do")
		public ModelAndView ReservationOnForm(@RequestParam(value="pageNum",defaultValue="1")
												int currentPage,
												HttpSession session) {
			
			Integer user_num = (Integer) session.getAttribute("user_num");
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("user_num", user_num);
			
			int count = userService.selectRowCountReservationOnOff(map);
			
			PagingUtil page = new PagingUtil(currentPage,count,10,10,"ReservationOn.do");
			
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());
			
			List<HouseVO> list = null;
			if(count > 0) {
				list = userService.selectListReservationOnOff(map);
			}
			
			ModelAndView mav  = new ModelAndView();
			mav.setViewName("ReservationOn");
			mav.addObject("count", count);
			mav.addObject("list",list);
			mav.addObject("pagingHtml",page.getPagingHtml()); 
			
			return mav;
		}
		
		@RequestMapping("/user/ReservationOnUpdate.do")
		public String ReservationOnUpdate(Integer date_num) {
			
			userService.ReservationOnOffUpdate(date_num);
			
			return "redirect:/user/ReservationOn.do";
		}
		
		@RequestMapping("/user/ReservationOnCencel.do")
		public String ReservationOnCencel(Integer date_num) {
			
			userService.ReservationOnOffCencel(date_num);
			
			return "redirect:/user/ReservationOn.do";
		}
		
		@RequestMapping("/user/likeBoard.do")
		public ModelAndView likeBoardForm(HttpSession session,
											@RequestParam(value="pageNum",defaultValue="1")
											int currentPage) {
						
			Integer user_num = (Integer) session.getAttribute("user_num");
			Map<String,Object> map = new HashMap<String,Object>();
			
			map.put("user_num", user_num);
			
			int count = userService.selectRowCountLikeBoard(map);
			
			PagingUtil page = new PagingUtil(currentPage,count,6,10,"likeBoard.do");
			
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());
			
			List<HouseVO> list = null;
			
			if(count > 0) {
				list = userService.selectListLikeBoard(map);
				for(int i=0;i<list.size();i++) {
					HouseVO vo = list.get(i); 
					vo.setLikecount(houseService.selectLikeCount(vo.getMarket_num()));
					vo.setRatecount(houseService.selectRateCount(vo.getMarket_num()));
				}
			}
			
			ModelAndView mav  = new ModelAndView();
			mav.setViewName("likeBoard");
			mav.addObject("count", count);
			mav.addObject("list",list);
			mav.addObject("pagingHtml",page.getPagingHtml()); 
			
			return mav;
		}
}
