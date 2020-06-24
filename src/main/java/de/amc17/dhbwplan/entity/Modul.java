package de.amc17.dhbwplan.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Modul implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7908887684543303784L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "MID")
	private int MID;

	private String bezeichnung;

	private int studienjahr;

	private int moduldauer;

	private String modulart;

	private String pruefungsleistung;

	private String beschreibung;

	private String sprache;

	private int ectsPunkte;
	
	@ManyToOne 
	@JoinColumn(name="MKID")
	@JsonIgnore
	private Modulkatalog modulkatalog;
	
	@OneToMany(mappedBy = "modul")
	private List<Lerneinheit> lerneinheiten;

	public int getMID() {
		return MID;
	}

	public void setMID(int mID) {
		MID = mID;
	}

	public String getBezeichnung() {
		return bezeichnung;
	}

	public void setBezeichnung(String bezeichnung) {
		this.bezeichnung = bezeichnung;
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

	public String getPruefungsleistung() {
		return pruefungsleistung;
	}

	public void setPruefungsleistung(String pruefungsleistung) {
		this.pruefungsleistung = pruefungsleistung;
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

	public int getStudienjahr() {
		return studienjahr;
	}

	public void setStudienjahr(int studienjahr) {
		this.studienjahr = studienjahr;
	}
  
	public Modulkatalog getModulkatalog() {
		return modulkatalog;
	}

	public void setModulkatalog(Modulkatalog modulkatalog) {
		this.modulkatalog = modulkatalog;
	}

	public List<Lerneinheit> getLerneinheiten() {
		return lerneinheiten;
	}

	public void setLerneinheiten(List<Lerneinheit> lerneinheiten) {
		this.lerneinheiten = lerneinheiten;
	}

	


}
