package com.jobeligibility.org.model;

public class EligibilityCondition{
	private int sno ;
	private String field ;
	private String operator ;
	private String value ;
	
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getField() {
		return field;
	}
	public String getOperator() {
		return operator;
	}
	public String getValue() {
		return value;
	}
	public void setField(String field) {
		this.field = field;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	public void setValue(String value) {
		this.value = value;
	}
	
	
}