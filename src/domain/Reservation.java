package domain;

import java.sql.Date;

public class Reservation {

	int reNo;
	String name;
	String password;
	String title;
	String date;
	int time;
	int guest;
	String phone;
	String message;
	public int getReNo() {
		return reNo;
	}
	public void setReNo(int reNo) {
		this.reNo = reNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public int getGuest() {
		return guest;
	}
	public void setGuest(int guest) {
		this.guest = guest;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
