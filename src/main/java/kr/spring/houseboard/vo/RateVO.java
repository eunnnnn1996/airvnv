package kr.spring.houseboard.vo;

import java.sql.Date;

public class RateVO {
	private int rate_num;
	private String title;
	private String content;
	private int all_rate;
	private int accuracy_rate;
	private int clean_rate;
	private int ease_rate;
	private int position_rate;
	private int communication_rate;
	private Date reg_date;
	private int user_num;
	private int market_num;
	private String user_name;
	private byte[] photo;
	private String photo_name;
	
	
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
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getRate_num() {
		return rate_num;
	}
	public void setRate_num(int rate_num) {
		this.rate_num = rate_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getAll_rate() {
		return all_rate;
	}
	public void setAll_rate(int all_rate) {
		this.all_rate = all_rate;
	}
	public int getAccuracy_rate() {
		return accuracy_rate;
	}
	public void setAccuracy_rate(int accuracy_rate) {
		this.accuracy_rate = accuracy_rate;
	}
	public int getClean_rate() {
		return clean_rate;
	}
	public void setClean_rate(int clean_rate) {
		this.clean_rate = clean_rate;
	}
	public int getEase_rate() {
		return ease_rate;
	}
	public void setEase_rate(int ease_rate) {
		this.ease_rate = ease_rate;
	}
	public int getPosition_rate() {
		return position_rate;
	}
	public void setPosition_rate(int position_rate) {
		this.position_rate = position_rate;
	}
	public int getCommunication_rate() {
		return communication_rate;
	}
	public void setCommunication_rate(int communication_rate) {
		this.communication_rate = communication_rate;
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
	public int getMarket_num() {
		return market_num;
	}
	public void setMarket_num(int market_num) {
		this.market_num = market_num;
	}
	
	@Override
	public String toString() {
		return "RateVO [rate_num=" + rate_num + ", title=" + title + ", content=" + content + ", all_rate=" + all_rate
				+ ", accuracy_rate=" + accuracy_rate + ", clean_rate=" + clean_rate + ", ease_rate=" + ease_rate
				+ ", position_rate=" + position_rate + ", communication_rate=" + communication_rate + ", reg_date="
				+ reg_date + ", user_num=" + user_num + ", market_num=" + market_num + "]";
	}
}
