package kr.spring.user.vo;

import java.io.IOException;
import java.sql.Date;

import javax.validation.constraints.Max;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Positive;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

public class UserVO {
	private int user_num;
	/* @Pattern(regexp="^[A-Za-z0-9]{4,12}") */
	private String user_id;
	private int user_auth;
	@NotEmpty
	private String user_name;
	@Pattern(regexp="^[A-Za-z0-9]{4,12}")
	private String passwd;
	@Pattern(regexp="^[A-Za-z0-9]{4,12}")
	private String passwd2;
	public String getPasswd2() {
		return passwd2;
	}
	public void setPasswd2(String passwd2) {
		this.passwd2 = passwd2;
	}
	@NotEmpty
	private String phone;
	private MultipartFile upload;
	private byte[] photo;
	private String photo_name;
	@Size(min=5,max=5)
	private String zipcode;
	@NotEmpty
	private String address1;
	@NotEmpty
	private String address2;
	@NotNull
	@Positive
	@Max(99)
	private int age;
	private Date reg_date;
	private Date modify_date;
	@Pattern(regexp="^[A-Za-z0-9]{4,12}")
	private String now_passwd;
	private int sum_income;
	
	public int getSum_income() {
		return sum_income;
	}
	public void setSum_income(int sum_income) {
		this.sum_income = sum_income;
	}
	public boolean isCheckedPassword(String userPasswd) {
		if(user_auth >= 1 && passwd.equals(userPasswd)) {
			return true;
		}
		return false;
	}
	//이미지 blob 처리
	public void setUpload(MultipartFile upload) throws IOException{
		this.upload = upload;
		//MultiFile -> byte[]
		setPhoto(upload.getBytes());
		//파일이름
		setPhoto_name(upload.getOriginalFilename());
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getUser_auth() {
		return user_auth;
	}
	public void setUser_auth(int user_auth) {
		this.user_auth = user_auth;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getNow_passwd() {
		return now_passwd;
	}
	public void setNow_passwd(String now_passwd) {
		this.now_passwd = now_passwd;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
	public MultipartFile getUpload() {
		return upload;
	}
}
