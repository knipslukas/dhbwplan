package de.amc17.dhbwplan.data;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

public class KursDto {


	private String name; 
	
	private int jahrgang;

	private int anzahlStudierende;

	public int studienrichtung_riid;
	
	public int dozent_DID;

	public int getDozent_DID() {
		return dozent_DID;
	}

	public void setDozent_DID(int dozent_DID) {
		this.dozent_DID = dozent_DID;
	}

	public int getStudienrichtung_riid() {
		return studienrichtung_riid;
	}

	public void setStudienrichtung_riid(int studienrichtung_riid) {
		this.studienrichtung_riid = studienrichtung_riid;
	}
		
	public void setname(String name) {
		this.name = name;
	}

	public String getname() {
		return name;
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

}
