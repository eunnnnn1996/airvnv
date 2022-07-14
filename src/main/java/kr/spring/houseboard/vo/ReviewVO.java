package kr.spring.houseboard.vo;

import java.sql.Date;

public class ReviewVO {
	private int review_num;
	private String areview_content;
	private String zipcode;
	private String address1;
	private String address2;
	private String address3;
	private Date reg_date;
	private int user_num;
	private int areview_rate_num;
	private int traffic;
	private int building;
	private int environment;
	private int room;
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public String getAreview_content() {
		return areview_content;
	}
	public void setAreview_content(String areview_content) {
		this.areview_content = areview_content;
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
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public int getAreview_rate_num() {
		return areview_rate_num;
	}
	public void setAreview_rate_num(int areview_rate_num) {
		this.areview_rate_num = areview_rate_num;
	}
	public int getTraffic() {
		return traffic;
	}
	public void setTraffic(int traffic) {
		this.traffic = traffic;
	}
	public int getBuilding() {
		return building;
	}
	public void setBuilding(int building) {
		this.building = building;
	}
	public int getEnvironment() {
		return environment;
	}
	public void setEnvironment(int environment) {
		this.environment = environment;
	}
	public int getRoom() {
		return room;
	}
	public void setRoom(int room) {
		this.room = room;
	}
	
}
