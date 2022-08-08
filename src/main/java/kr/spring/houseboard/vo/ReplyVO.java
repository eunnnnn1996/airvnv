package kr.spring.houseboard.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ReplyVO {
	private int reply_num;
	private int rate_num;
	private int user_num;
	private String content;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date reg_date;
	
	public int getReply_num() {
		return reply_num;
	}
	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}
	public int getRate_num() {
		return rate_num;
	}
	public void setRate_num(int rate_num) {
		this.rate_num = rate_num;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
}
