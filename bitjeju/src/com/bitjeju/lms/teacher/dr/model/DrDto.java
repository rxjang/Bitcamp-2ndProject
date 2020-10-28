package com.bitjeju.lms.teacher.dr.model;

import java.sql.Date;

public class DrDto {
	private int drNum;
	private String drTitle;
	private int num;
	private String name;
	private Date drDate;
	private String fileName;
	private String drContent;
	
	public DrDto() {}

	public DrDto(int drNum, String drTitle, String name, Date drDate,
			String fileName, String drContent) {
		super();
		this.drNum = drNum;
		this.drTitle = drTitle;
		this.name = name;
		this.drDate = drDate;
		this.fileName = fileName;
		this.drContent = drContent;
	}
	
	public DrDto(int drNum, String drTitle, int num, String name, Date drDate,
			String fileName, String drContent) {
		super();
		this.drNum = drNum;
		this.drTitle = drTitle;
		this.num = num;
		this.name = name;
		this.drDate = drDate;
		this.fileName = fileName;
		this.drContent = drContent;
	}

	public int getDrNum() {
		return drNum;
	}

	public void setDrNum(int drNum) {
		this.drNum = drNum;
	}

	public String getDrTitle() {
		return drTitle;
	}

	public void setDrTitle(String drTitle) {
		this.drTitle = drTitle;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getDrDate() {
		return drDate;
	}

	public void setDrDate(Date drDate) {
		this.drDate = drDate;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getDrContent() {
		return drContent;
	}

	public void setDrContent(String drContent) {
		this.drContent = drContent;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((drContent == null) ? 0 : drContent.hashCode());
		result = prime * result + ((drDate == null) ? 0 : drDate.hashCode());
		result = prime * result + drNum;
		result = prime * result + ((drTitle == null) ? 0 : drTitle.hashCode());
		result = prime * result
				+ ((fileName == null) ? 0 : fileName.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + num;
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
		DrDto other = (DrDto) obj;
		if (drContent == null) {
			if (other.drContent != null)
				return false;
		} else if (!drContent.equals(other.drContent))
			return false;
		if (drDate == null) {
			if (other.drDate != null)
				return false;
		} else if (!drDate.equals(other.drDate))
			return false;
		if (drNum != other.drNum)
			return false;
		if (drTitle == null) {
			if (other.drTitle != null)
				return false;
		} else if (!drTitle.equals(other.drTitle))
			return false;
		if (fileName == null) {
			if (other.fileName != null)
				return false;
		} else if (!fileName.equals(other.fileName))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (num != other.num)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "DrDto [drNum=" + drNum + ", drTitle=" + drTitle + ", num="
				+ num + ", name=" + name + ", drDate=" + drDate + ", fileName="
				+ fileName + ", drContent=" + drContent + "]";
	}

}