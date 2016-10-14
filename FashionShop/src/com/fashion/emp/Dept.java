package com.fashion.emp;

import java.util.ArrayList;
import java.util.List;

public class Dept {
	private int deptno;
	private String dname;
	private String loc;
	private ArrayList<Emp> empList;
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public ArrayList<Emp> getEmpList() {
		return empList;
	}
	public void setEmpList(ArrayList<Emp> empList) {
		this.empList = empList;
	}
	
}
