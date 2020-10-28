package com.bitjeju.lms.teacher.stu.model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;


public class StudentDto {
	
	private int num, lecture_room, lecture_num, exam1, exam2, exam3;
	//�л� ȸ����ȣ, ���ǽ� ���¹�ȣ,���輺��, ����ó
	private Date start_day, end_day;
	private String name, teacher_name, lecture_name, phone, id_email;
	//�л��̸�, �����̸�, ���¸�
	private ArrayList<String> attList;
	//�⼮���̺� ������ ���� ����Ʈ
	private ArrayList<Date> attNaljaList;
	




	public String getId_email() {
		return id_email;
	}

	public void setId_email(String id_email) {
		this.id_email = id_email;
	}

	public String getLecture_name() {
		return lecture_name;
	}

	public void setLecture_name(String lecture_name) {
		this.lecture_name = lecture_name;
	}

	public StudentDto() {
		// TODO Auto-generated constructor stub
	}
	
	public int calAttDays() { //�� ������ ��
		int attDays=0;	//�� �⼮�� ��������
		
		Calendar start=Calendar.getInstance();
		start.setTime(start_day);
		Calendar end=Calendar.getInstance();
		end.setTime(end_day);
		
		while(!start.after(end)) {//�� ������ ���
			int day=start.get(Calendar.DAY_OF_WEEK);
			if((day!=Calendar.SATURDAY)&&(day!=Calendar.SUNDAY)) attDays++;	//�ָ� �ƴҽÿ��� �� �⼮��++
			start.add(Calendar.DATE, 1);
		}
		System.out.println("attDays: "+attDays);		
		return attDays;
	}
	
	public double attRate() {
		int cnt = 0;//�⼮ ī��Ʈ.
		for (int i=0 ; i<attList.size();i++) {//����Ʈ ������ = �� �������� �� �� 
			if(attList.get(i).equals("�⼮")) { 		//�� ������ �� '�⼮'�� ��
				cnt++;	//�⼮�ϸ� ī��Ʈ +1	
			}//if
		}//for
		double ar = 0;
		if(attList.size()!=0) {
			ar = cnt*100/calAttDays()*1.0;
		}
		
		return ar;//�⼮�ѳ�/�Ѽ����� 
	}
	
	public int calTilToday() {//���� �����Ϸκ��� ���� ��¥ ���
		Calendar end=Calendar.getInstance();
		end.setTime(end_day);		
		Calendar today=Calendar.getInstance();
		
		int temp=0; //���� �����ϼ� ����
		
		while(!today.after(end)) {//���ñ��� ����� ������ ���
			int day=today.get(Calendar.DAY_OF_WEEK);
			if((day!=Calendar.SATURDAY)&&(day!=Calendar.SUNDAY)) temp++;	//�ָ� �ƴҽÿ���++
			today.add(Calendar.DATE, 1);
		}
		int tilToday=calAttDays()-temp;
		
		return tilToday;
	}
	
	public double classProgress() {//���� ����� ���
		System.out.println("���������: "+ (calTilToday()*100.0/calAttDays()));
		System.out.println("���������: "+ calTilToday()+"//"+calAttDays());
		return (calTilToday()*1000/calAttDays())/10.0;
	}
	
	public int cntAtt() {
		int cnt=0;
		for (int i=0 ; i<attList.size();i++) {//����Ʈ ������ = �� �������� �� �� 
			if(attList.get(i).equals("�⼮")) { 		//�� ������ �� '�⼮'�� ��
				cnt++;	//�⼮�ϸ� ī��Ʈ +1	
			}//if
		}//for
		return cnt;
	}
	public int cntLate() {
		int cnt=0;
		for (int i=0 ; i<attList.size();i++) {//����Ʈ ������ = �� �������� �� �� 
			if(attList.get(i).equals("����")) { 		//�� ������ �� '����'�� ��
				cnt++;	//�����ϸ� ī��Ʈ +1	
			}//if
		}//for
		return cnt;
	}
	public int cntEarly() {
		int cnt=0;
		for (int i=0 ; i<attList.size();i++) {//����Ʈ ������ = �� �������� �� �� 
			if(attList.get(i).equals("����")) { 		//�� ������ �� '����'�� ��
				cnt++;	//�����ϸ� ī��Ʈ +1	
			}//if
		}//for
		return cnt;
	}
	public int cntAbsent() {
		int cnt=0;
		for (int i=0 ; i<attList.size();i++) {//����Ʈ ������ = �� �������� �� �� 
			if(attList.get(i).equals("�Ἦ")) { 		//�� ������ �� '�Ἦ'�� ��
				cnt++;	//�Ἦ�ϸ� ī��Ʈ +1	
			}//if
		}//for
		return cnt;
	}

	
	
	public ArrayList<String> getAttList() {
		return attList;
	}



	public void setAttList(ArrayList<String> attList) {
		this.attList = attList;
	}



	public ArrayList<Date> getAttNaljaList() {
		return attNaljaList;
	}



	public void setAttNaljaList(ArrayList<Date> attNaljaList) {
		this.attNaljaList = attNaljaList;
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
	public int getLecture_num() {
		return lecture_num;
	}
	public void setLecture_num(int lecture_num) {
		this.lecture_num = lecture_num;
	}
	public int getExam1() {
		return exam1;
	}
	public void setExam1(int exam1) {
		this.exam1 = exam1;
	}
	public int getExam2() {
		return exam2;
	}
	public void setExam2(int exam2) {
		this.exam2 = exam2;
	}
	public int getExam3() {
		return exam3;
	}
	public void setExam3(int exam3) {
		this.exam3 = exam3;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTeacher_name() {
		return teacher_name;
	}
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}



	
	

}
