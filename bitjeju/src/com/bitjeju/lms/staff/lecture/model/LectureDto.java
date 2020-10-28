package com.bitjeju.lms.staff.lecture.model;

import java.sql.Date;

public class LectureDto {

	private String lecture_name, name;
	private Date start_day, end_day;
	private int num, lecture_room,lecture_num, recruit_num;
	


	
	public LectureDto(int num, int lecture_room, int lecture_num,
			String lecture_name, String name, Date start_day, Date end_day) {
		super();
		this.num = num;
		this.lecture_room = lecture_room;
		this.lecture_num = lecture_num;
		this.lecture_name = lecture_name;
		this.name = name;
		this.start_day = start_day;
		this.end_day = end_day;
	}

	
	
	@Override
	public String toString() {
		return "LectureDto [lecture_name=" + lecture_name + ", name=" + name + ", start_day=" + start_day + ", end_day="
				+ end_day + ", num=" + num + ", lecture_room=" + lecture_room + ", lecture_num=" + lecture_num
				+ ", recruit_num=" + recruit_num + "]";
	}



	public LectureDto() {
		// TODO Auto-generated constructor stub
	}



	public int getRecruit_num() {
		return recruit_num;
	}
	public void setRecruit_num(int recruit_num) {
		this.recruit_num = recruit_num;
	}
	public String getName() {	
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getLecture_num() {
		return lecture_num;
	}
	public void setLecture_num(int lecture_num) {
		this.lecture_num = lecture_num;
	}
	public String getLecture_name() {
		return lecture_name;
	}
	public void setLecture_name(String lecture_name) {
		this.lecture_name = lecture_name;
	}
	public Date getStart_day() {	
		return start_day;
	}
	public void setStart_day(Date start_day) {
		this.start_day = start_day;
	}
	public Date getEnd_day() {
		return end_day;
	}
	public void setEnd_day(Date end_day) {
		this.end_day = end_day;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getLecture_room() {
		return lecture_room;
	}
	public void setLecture_room(int lecture_room) {
		this.lecture_room = lecture_room;
	}
	
	
	
	
	
	
}
