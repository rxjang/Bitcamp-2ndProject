package com.bitjeju.lms.sales.recruit.model;

import java.sql.Date;

public class RecruitDto {

	private String recruit_name, recruit_file_name, recruit_state, thumbnail;
	private int recruit_num;
	private Date start_day, end_day;

	
	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
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

	public RecruitDto() {
		// TODO Auto-generated constructor stub
	}
	
	public RecruitDto(String recruit_name, String recruit_file_name, String recruit_state, int recruit_num) {
		super();
		this.recruit_name = recruit_name;
		this.recruit_file_name = recruit_file_name;
		this.recruit_state = recruit_state;
		this.recruit_num = recruit_num;
	}


	

	@Override
	public String toString() {
		return "RecruitDto [recruit_name=" + recruit_name + ", recruit_file_name=" + recruit_file_name
				+ ", recruit_state=" + recruit_state + ", thumbnail=" + thumbnail + ", recruit_num=" + recruit_num
				+ ", start_day=" + start_day + ", end_day=" + end_day + "]";
	}

	public String getRecruit_name() {
		return recruit_name;
	}
	public void setRecruit_name(String recruit_name) {
		this.recruit_name = recruit_name;
	}
	public String getRecruit_file_name() {
		return recruit_file_name;
	}
	public void setRecruit_file_name(String recruit_file_name) {
		this.recruit_file_name = recruit_file_name;
	}
	public String getRecruit_state() {
		return recruit_state;
	}
	public void setRecruit_state(String recruit_state) {
		this.recruit_state = recruit_state;
	}
	public int getRecruit_num() {
		return recruit_num;
	}
	public void setRecruit_num(int recruit_num) {
		this.recruit_num = recruit_num;
	}



}



