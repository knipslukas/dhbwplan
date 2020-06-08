package de.amc17.dhbwplan.data;

public class LeeDto {

	private String name;

	private int MID;

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

	public int getMID() {
		return MID;
	}

	public void setMID(int MID) {
		this.MID = MID;
	}
}
