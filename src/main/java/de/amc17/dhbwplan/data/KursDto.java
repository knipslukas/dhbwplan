package de.amc17.dhbwplan.data;

public class KursDto {

	
	private int KID;

	private String name;

	private int jahrgang;

	private int anzahlStudierende;
	
	private int  DID;	

	public int getKID() {
		return KID;
	}

	public void setKID(int KID) {
		this.KID = KID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getJahrgang() {
		return jahrgang;
	}

	public void setJahrgang(int jahrgang) {
		this.jahrgang = jahrgang;
	}
	
	public int getAnzahlStudierende() {
		return anzahlStudierende;
	}

	public void setAnzahlStudierende(int anzahlStudierende) {
		this.anzahlStudierende = anzahlStudierende;
	}
	
	public int getDID() {
		return DID;
	}

	public void setDID(int DID) {
		this.DID = DID;
	}

}
