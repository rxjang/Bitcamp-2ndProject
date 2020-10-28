package com.bitjeju.customer.model;

import java.sql.Date;
import java.sql.Timestamp;

public class NoticeDto {

	private int ntnum, num, read_cnt;
	private String title, content, filename, wtimeStamp;
	private Date wtime;

	public NoticeDto() {

	}

	public NoticeDto(int ntnum, int read_cnt, String title, String content, String filename, Date wtime) {
		super();
		this.ntnum = ntnum;
		this.read_cnt = read_cnt;
		this.title = title;
		this.content = content;
		this.filename = filename;
		this.wtime = wtime;
	}


	@Override
	public String toString() {
		return "NoticeDto [ntnum=" + ntnum + ", num=" + num + ", read_cnt=" + read_cnt + ", title=" + title
				+ ", content=" + content + ", filename=" + filename + ", wtime=" + wtime + "]";
	}

	
	

	public String getWtimeStamp() {
		return wtimeStamp;
	}

	public void setWtimeStamp(String wtimeStamp) {
		this.wtimeStamp = wtimeStamp;
	}

	public int getNtnum() { // 글번호
		return ntnum;
	}

	public void setNtnum(int ntnum) {
		this.ntnum = ntnum;
	}

	public int getNum() { // 작성자 회원번호
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getRead_cnt() {
		return read_cnt;
	}

	public void setRead_cnt(int read_cnt) {
		this.read_cnt = read_cnt;
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

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public Date getWtime() {
		return wtime;
	}

	public void setWtime(Date wtime) {
		this.wtime = wtime;
	}


}
