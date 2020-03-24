package de.amc17.dhbwplan.data;

public class StudienLeiterDto {

	private String vorname;
	
	private String nachname;
	
	private String username;
	
	private String email;
	
	private String pwd_1;
	
	private String pwd_2;
	
	private String anrede;
	
	private long dozID;
	
	private String pwd_old;

	public String getVorname() {
		return vorname;
	}

	public void setVorname(String vorname) {
		this.vorname = vorname;
	}

	public String getNachname() {
		return nachname;
	}

	public void setNachname(String nachname) {
		this.nachname = nachname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAnrede() {
		return anrede;
	}

	public void setAnrede(String anrede) {
		this.anrede = anrede;
	}

	public String getPwd_1() {
		return pwd_1;
	}

	public void setPwd_1(String pwd_1) {
		this.pwd_1 = pwd_1;
	}

	public String getPwd_2() {
		return pwd_2;
	}

	public void setPwd_2(String pwd_2) {
		this.pwd_2 = pwd_2;
	}

	public long getDozID() {
		return dozID;
	}

	public void setDozID(long dozID) {
		this.dozID = dozID;
	}

	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}

	public String getPwd_old() {
		return pwd_old;
	}
	
	public void setPwd_old(String pwd_old) {
		this.pwd_old = pwd_old;
	}
	
	
	
	
}
