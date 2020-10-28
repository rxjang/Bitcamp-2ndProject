package com.bitjeju.lms.student.attendance.model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;

public class StuAttDto {
	private Date nalja, start_day, end_day;
	private int num;
	private String state;
	private ArrayList<String> attList;
	
	public StuAttDto() {}
	
	public StuAttDto(Date nalja,String state) {
		this.nalja=nalja;
		this.state=state;
	}

	public StuAttDto(Date nalja, Date start_day, Date end_day, int num,
			String state, ArrayList<String> attList) {
		super();
		this.nalja = nalja;
		this.start_day = start_day;
		this.end_day = end_day;
		this.num = num;
		this.state = state;
		this.attList = attList;
	}


	
	public int calAttDays() { //총 수업일 계
		int attDays=0;	//총 출석일 변수설정
		
		Calendar start=Calendar.getInstance();
		start.setTime(start_day);
		Calendar end=Calendar.getInstance();
		end.setTime(end_day);
		
		while(!start.after(end)) {//총 수업일 계산
			int day=start.get(Calendar.DAY_OF_WEEK);
			if((day!=Calendar.SATURDAY)&&(day!=Calendar.SUNDAY)) attDays++;	//주말 아닐시에만 총 출석일++
			start.add(Calendar.DATE, 1);
		}
		System.out.println("attDays: "+attDays);		
		return attDays;
	}
	
	public double attRate() {
		int cnt = 0;//출석 카운트.
		for (int i=0 ; i<attList.size();i++) {//리스트 사이즈 = 총 수업들은 일 수 
			if(attList.get(i).equals("출석")) { 		//총 수업일 중 '출석'한 날
				cnt++;	//출석하면 카운트 +1	
			}//if
		}//for
		double ar = 0;
		if(attList.size()!=0) {
			ar = cnt*100/calAttDays()*1.0;
		}
		
		return ar;//출석한날/총수업일 
	}
	
	public int calTilToday() {//수업 시작일로부터 오늘 날짜 계산
		Calendar end=Calendar.getInstance();
		end.setTime(end_day);		
		Calendar today=Calendar.getInstance();
		
		int temp=0; //남은 수업일수 저장
		
		while(!today.after(end)) {//오늘까지 진행된 수업일 계산
			int day=today.get(Calendar.DAY_OF_WEEK);
			if((day!=Calendar.SATURDAY)&&(day!=Calendar.SUNDAY)) temp++;	//주말 아닐시에만++
			today.add(Calendar.DATE, 1);
		}
		int tilToday=calAttDays()-temp;
		
		return tilToday;
	}
	
	public double classProgress() {//수업 진행률 계산
		System.out.println("수업진행률: "+ (calTilToday()*100.0/calAttDays()));
		System.out.println("수업진행률: "+ calTilToday()+"//"+calAttDays());
		return (calTilToday()*1000/calAttDays())/10.0;
	}
	
	
	
	
	public int cntAtt() {
		int cnt=0;
		for (int i=0 ; i<attList.size();i++) {//리스트 사이즈 = 총 수업들은 일 수 
			if(attList.get(i).equals("출석")) { 		//총 수업일 중 '출석'한 날
				cnt++;	//출석하면 카운트 +1	
			}//if
		}//for
		return cnt;
	}
	public int cntLate() {
		int cnt=0;
		for (int i=0 ; i<attList.size();i++) {//리스트 사이즈 = 총 수업들은 일 수 
			if(attList.get(i).equals("지각")) { 		//총 수업일 중 '지각'한 날
				cnt++;	//지각하면 카운트 +1	
			}//if
		}//for
		return cnt;
	}
	public int cntEarly() {
		int cnt=0;
		for (int i=0 ; i<attList.size();i++) {//리스트 사이즈 = 총 수업들은 일 수 
			if(attList.get(i).equals("조퇴")) { 		//총 수업일 중 '조퇴'한 날
				cnt++;	//조퇴하면 카운트 +1	
			}//if
		}//for
		return cnt;
	}
	public int cntAbsent() {
		int cnt=0;
		for (int i=0 ; i<attList.size();i++) {//리스트 사이즈 = 총 수업들은 일 수 
			if(attList.get(i).equals("결석")) { 		//총 수업일 중 '결석'한 날
				cnt++;	//결석하면 카운트 +1	
			}//if
		}//for
		return cnt;
	}

	public Date getNalja() {
		return nalja;
	}

	public void setNalja(Date nalja) {
		this.nalja = nalja;
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

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public ArrayList<String> getAttList() {
		return attList;
	}

	public void setAttList(ArrayList<String> attList) {
		this.attList = attList;
	}

	@Override
	public String toString() {
		return "StuAttDto [nalja=" + nalja + ", start_day=" + start_day
				+ ", end_day=" + end_day + ", num=" + num + ", state=" + state
				+ ", attList=" + attList + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((attList == null) ? 0 : attList.hashCode());
		result = prime * result + ((end_day == null) ? 0 : end_day.hashCode());
		result = prime * result + ((nalja == null) ? 0 : nalja.hashCode());
		result = prime * result + num;
		result = prime * result
				+ ((start_day == null) ? 0 : start_day.hashCode());
		result = prime * result + ((state == null) ? 0 : state.hashCode());
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
		StuAttDto other = (StuAttDto) obj;
		if (attList == null) {
			if (other.attList != null)
				return false;
		} else if (!attList.equals(other.attList))
			return false;
		if (end_day == null) {
			if (other.end_day != null)
				return false;
		} else if (!end_day.equals(other.end_day))
			return false;
		if (nalja == null) {
			if (other.nalja != null)
				return false;
		} else if (!nalja.equals(other.nalja))
			return false;
		if (num != other.num)
			return false;
		if (start_day == null) {
			if (other.start_day != null)
				return false;
		} else if (!start_day.equals(other.start_day))
			return false;
		if (state == null) {
			if (other.state != null)
				return false;
		} else if (!state.equals(other.state))
			return false;
		return true;
	}
	
}