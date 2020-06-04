package de.amc17.dhbwplan.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Studiengang implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3809708678940563950L;

	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="StID")
	private int stID;
	
	private String name;
	
	private String beschreibung;
	
	@OneToMany (mappedBy="studiengang")
	 private Studienrichtung studienrichtung;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBeschreibung() {
		return beschreibung;
	}

	public void setBeschreibung(String beschreibung) {
		this.beschreibung = beschreibung;
	}

	public int getSTID() {
		return stID;
	}

	public void setSTID(int STID) {
		this.stID = STID;
	}
}
