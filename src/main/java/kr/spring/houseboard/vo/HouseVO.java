package kr.spring.houseboard.vo;

import java.io.IOException;
import java.sql.Date;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

public class HouseVO {
	private int market_num;
	@NotNull
	private int market_type;
	@NotNull
	private int market_type_sort;
	@NotEmpty
	private String address1;
	@NotEmpty
	private String address2;
	@NotEmpty
	private String address3;
	@NotNull
	private int trade_type;
	@NotNull
	private int trade_short;
	private int otherpay;
	private int elevator;
	private int parking;
	private int veranda;
	private String optionitem;
	private Date reg_date;
	private Date modify_date;
	private byte[] photo;
	private String photo_name;
	private MultipartFile upload;
	private String user_id;
	private int show;
	private int likecount;
	private int ratecount;
	private String country;
	
	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public int getRatecount() {
		return ratecount;
	}

	public void setRatecount(int ratecount) {
		this.ratecount = ratecount;
	}

	public int getLikecount() {
		return likecount;
	}

	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}

	public int getShow() {
		return show;
	}

	public void setShow(int show) {
		this.show = show;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	//월별 조회수 담기
	private int allhit;
	private Date nowdate;
	public int getAllhit() {
		return allhit;
	}

	public void setAllhit(int allhit) {
		this.allhit = allhit;
	}
	
	public Date getNowdate() {
		return nowdate;
	}

	public void setNowdate(Date nowdate) {
		this.nowdate = nowdate;
	}

	//이미지 blob 처리
	public void setUpload(MultipartFile upload) throws IOException{
		this.upload = upload;
		//MultiFile -> byte[]
		setPhoto(upload.getBytes());
		//파일이름
		setPhoto_name(upload.getOriginalFilename());
	}
	
	public MultipartFile getUpload() {
		return upload;
	}

	public byte[] getPhoto() {
		return photo;
	}
	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}
	public String getPhoto_name() {
		return photo_name;
	}
	public void setPhoto_name(String photo_name) {
		this.photo_name = photo_name;
	}
	//디테일
	@NotEmpty
	private String market_title;
	@NotEmpty
	private String market_content;
	private int user_num;
	private int onoff;
	private Date startdate;
	private Date enddate;
	private int price;
	private int hit;
	
	
	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public int getOnoff() {
		return onoff;
	}

	public void setOnoff(int onoff) {
		this.onoff = onoff;
	}

	public int getMarket_num() {
		return market_num;
	}
	public void setMarket_num(int market_num) {
		this.market_num = market_num;
	}
	public int getMarket_type() {
		return market_type;
	}
	public void setMarket_type(int market_type) {
		this.market_type = market_type;
	}
	public int getMarket_type_sort() {
		return market_type_sort;
	}
	public void setMarket_type_sort(int market_type_sort) {
		this.market_type_sort = market_type_sort;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getAddress3() {
		return address3;
	}
	public void setAddress3(String address3) {
		this.address3 = address3;
	}
	public int getTrade_type() {
		return trade_type;
	}
	public void setTrade_type(int trade_type) {
		this.trade_type = trade_type;
	}
	public int getTrade_short() {
		return trade_short;
	}
	public void setTrade_short(int trade_short) {
		this.trade_short = trade_short;
	}
	public int getOtherpay() {
		return otherpay;
	}
	public void setOtherpay(int otherpay) {
		this.otherpay = otherpay;
	}
	public int getElevator() {
		return elevator;
	}
	public void setElevator(int elevator) {
		this.elevator = elevator;
	}
	public int getParking() {
		return parking;
	}
	public void setParking(int parking) {
		this.parking = parking;
	}
	public int getVeranda() {
		return veranda;
	}
	public void setVeranda(int veranda) {
		this.veranda = veranda;
	}
	public String getOptionitem() {
		return optionitem;
	}
	public void setOptionitem(String optionitem) {
		this.optionitem = optionitem;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getModify_date() {
		return modify_date;
	}
	public void setModify_date(Date modify_date) {
		this.modify_date = modify_date;
	}
	public String getMarket_title() {
		return market_title;
	}
	public void setMarket_title(String market_title) {
		this.market_title = market_title;
	}
	public String getMarket_content() {
		return market_content;
	}
	public void setMarket_content(String market_content) {
		this.market_content = market_content;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	@Override
	public String toString() {
		return "HouseVO [market_num=" + market_num + ", market_type=" + market_type + ", market_type_sort="
				+ market_type_sort + ", zipcode=" + ", address1=" + address1 + ", address2=" + address2
				+ ", address3=" + address3 + ", trade_type=" + trade_type + ", trade_short=" + trade_short
				+ ", otherpay=" + otherpay + ", elevator=" + elevator + ", parking=" + parking + ", veranda=" + veranda
				+ ", optionitem=" + optionitem + ", reg_date=" + reg_date + ", modify_date=" + modify_date
				+ ", market_title=" + market_title + ", market_content=" + market_content + ", user_num=" + user_num
				+ "]";
	}
	
	
}
