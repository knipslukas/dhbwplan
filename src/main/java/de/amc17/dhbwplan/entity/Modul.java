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
	
	private int studienjahr;
	
	private int selbststudium;
	
	private int moduldauer;
	
	private String modulart;
	
	private String pruefungsleistung;
	
	private String beschreibung;
	
	private String sprache;
	
	private int praesenzzeit;
	
	private int ectsPunkte;

	public String getBezeichnung() {
		return bezeichnung;
	}

	public void setBezeichnung(String bezeichnung) {
		this.bezeichnung = bezeichnung;
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
		return pruefungsleistung;
	}

	public void setPrüfungsleistung(String prüfungsleistung) {
		this.pruefungsleistung = prüfungsleistung;
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


	public int getEctsPunkte() {
		return ectsPunkte;
	}

	public void setEctsPunkte(int ectsPunkte) {
		this.ectsPunkte = ectsPunkte;
	}

	public int getPraesenzzeit() {
		return praesenzzeit;
	}

	public void setPraesenzzeit(int praesenzzeit) {
		this.praesenzzeit = praesenzzeit;
	}

	public int getStudienjahr() {
		return studienjahr;
	}

	public void setStudienjahr(int studienjahr) {
		this.studienjahr = studienjahr;
	}
}
