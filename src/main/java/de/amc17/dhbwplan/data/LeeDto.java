package de.amc17.dhbwplan.data;

public class LeeDto {

	private String name;

	private int modulid;

	private int praesenzzeit;

	private int selbststudium;

	public int getPraesenzzeit() {
		return praesenzzeit;
	}

	public void setPräsenzzeit(int praesenzzeit) {
		this.praesenzzeit = praesenzzeit;
	}

	public int getSelbststudium() {
		return selbststudium;
	}

	public void setSelbststudium(int selbststudium) {
		this.selbststudium = selbststudium;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getModulid() {
		return modulid;
	}

	public void setModulid(int modulid) {
		this.modulid = modulid;
	}
}
