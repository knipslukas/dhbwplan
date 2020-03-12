package de.amc17.dhbwplan.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Modul implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7908887684543303784L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="MID")
	private int MID;
	
	private String bezeichnung;
	
	private int semester;
	
	private int selbststudium;
	
	private int moduldauer;
	
	private String modulart;
	
	private String prüfungsleistung;
	
	private String beschreibung;
	
	private String sprache;
	
	private int präsenzzeit;
	
	private int ectsPunkte;

	public String getBezeichnung() {
		return bezeichnung;
	}

	public void setBezeichnung(String bezeichnung) {
		this.bezeichnung = bezeichnung;
	}

	public int getSemester() {
		return semester;
	}

	public void setSemester(int semester) {
		this.semester = semester;
	}

	public int getSelbststudium() {
		return selbststudium;
	}

	public void setSelbststudium(int selbststudium) {
		this.selbststudium = selbststudium;
	}

	public int getModuldauer() {
		return moduldauer;
	}

	public void setModuldauer(int moduldauer) {
		this.moduldauer = moduldauer;
	}

	public String getModulart() {
		return modulart;
	}

	public void setModulart(String modulart) {
		this.modulart = modulart;
	}

	public String getPrüfungsleistung() {
		return prüfungsleistung;
	}

	public void setPrüfungsleistung(String prüfungsleistung) {
		this.prüfungsleistung = prüfungsleistung;
	}

	public String getBeschreibung() {
		return beschreibung;
	}

	public void setBeschreibung(String beschreibung) {
		this.beschreibung = beschreibung;
	}

	public String getSprache() {
		return sprache;
	}

	public void setSprache(String sprache) {
		this.sprache = sprache;
	}

	public int getPräsenzzeit() {
		return präsenzzeit;
	}

	public void setPräsenzzeit(int präsenzzeit) {
		this.präsenzzeit = präsenzzeit;
	}

	public int getEctsPunkte() {
		return ectsPunkte;
	}

	public void setEctsPunkte(int ectsPunkte) {
		this.ectsPunkte = ectsPunkte;
	}
}
