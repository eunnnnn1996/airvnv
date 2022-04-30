package kr.spring.houseboard.vo;

import java.sql.Date;

public class HouseVO {
	private int market_num;
	private int market_type;
	private int market_type_sort;
	private String zipcode;
	private String address1;
	private String address2;
	private String address3;
	private int trade_type;
	private int trade_short;
	private int otherpay;
	private int elevator;
	private int parking;
	private int veranda;
	private String optionitem;
	private Date reg_date;
	private Date modify_date;
	//디테일
	private String market_title;
	private String market_content;
	private int user_num;
	
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
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
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
}
