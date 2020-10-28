package com.bitjeju.lms.student.grade.model;

public class StuGradeDto {
	private int num,exam1,exam2,exam3;
	
	public StuGradeDto() {}
	
	public StuGradeDto(int num, int exam1, int exam2, int exam3) {
		super();
		this.num = num;
		this.exam1 = exam1;
		this.exam2 = exam2;
		this.exam3 = exam3;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + exam1;
		result = prime * result + exam2;
		result = prime * result + exam3;
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
		StuGradeDto other = (StuGradeDto) obj;
		if (exam1 != other.exam1)
			return false;
		if (exam2 != other.exam2)
			return false;
		if (exam3 != other.exam3)
			return false;
		if (num != other.num)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "GradeDto [num=" + num + ", exam1=" + exam1 + ", exam2=" + exam2
				+ ", exam3=" + exam3 + "]";
	}
	
	
}