package com.bitjeju.lms.sales.assign.model;


import java.sql.Date;

public class AssignDto {
	private int num, lvl,lecture_num;
	private String lecture_name,dept,name;
	private Date start_day, end_day;
	
	public AssignDto() {}

	public AssignDto(String lecture_name,int lecture_num) {
		this.lecture_name = lecture_name;		
		this.lecture_num = lecture_num;
	}
	
	public AssignDto(int num, int lvl, String lecture_name,
			String name, Date start_day) {
		super();
		this.num = num;
		this.lvl = lvl;
		this.lecture_name = lecture_name;
		this.name = name;
		this.start_day = start_day;
	}
	
	public AssignDto(int num, int lvl, int lecture_num, String lecture_name,
			String dept, String name, Date start_day, Date end_day) {
		super();
		this.num = num;
		this.lvl = lvl;
		this.lecture_num = lecture_num;
		this.lecture_name = lecture_name;
		this.dept = dept;
		this.name = name;
		this.start_day = start_day;
		this.end_day = end_day;
	}

	public int getLecture_num() {
		return lecture_num;
	}

	public void setLecture_num(int lecture_num) {
		this.lecture_num = lecture_num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getLvl() {
		return lvl;
	}

	public void setLvl(int lvl) {
		this.lvl = lvl;
	}

	public String getLecture_name() {
		return lecture_name;
	}

	public void setLecture_name(String lecture_name) {
		this.lecture_name = lecture_name;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((dept == null) ? 0 : dept.hashCode());
		result = prime * result + ((end_day == null) ? 0 : end_day.hashCode());
		result = prime * result
				+ ((lecture_name == null) ? 0 : lecture_name.hashCode());
		result = prime * result + lecture_num;
		result = prime * result + lvl;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + num;
		result = prime * result
				+ ((start_day == null) ? 0 : start_day.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		AssignDto other = (AssignDto) obj;
		if (dept == null) {
			if (other.dept != null)
				return false;
		} else if (!dept.equals(other.dept))
			return false;
		if (end_day == null) {
			if (other.end_day != null)
				return false;
		} else if (!end_day.equals(other.end_day))
			return false;
		if (lecture_name == null) {
			if (other.lecture_name != null)
				return false;
		} else if (!lecture_name.equals(other.lecture_name))
			return false;
		if (lecture_num != other.lecture_num)
			return false;
		if (lvl != other.lvl)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (num != other.num)
			return false;
		if (start_day == null) {
			if (other.start_day != null)
				return false;
		} else if (!start_day.equals(other.start_day))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "AssignDto [num=" + num + ", lvl=" + lvl + ", lecture_num="
				+ lecture_num + ", lecture_name=" + lecture_name + ", dept="
				+ dept + ", name=" + name + ", start_day=" + start_day
				+ ", end_day=" + end_day + "]";
	}

}