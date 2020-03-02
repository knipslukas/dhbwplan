package de.amc17.dhbwplan.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import de.amc17.dhbwplan.enums.Zeitpraeferenzen;

@Entity
@Table(name = "dozent")																				
public class Dozent implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -6950667849042772275L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="DID")
	private int DID;
	
	private String anrede;
    
	private String titel;
	
	private String vorname;
	
	private String nachname;
	
	private String unternehmen;
	
	private boolean intern;
	
	private String strassehaus;
	
	private String plz;
	
	private String stadt;
	
	private String email;
	
	private String telefonnummer;
	
	private String unterrichtet;
	
	private String schwerpunkt;
	
	private Zeitpraeferenzen zeitpraef;
	
	private String notiz;

	public String getTitel() {
		return titel;
	}

	public void setTitel(String titel) {
		this.titel = titel;
	}

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

	public String getUnternehmen() {
		return unternehmen;
	}

	public void setUnternehmen(String unternehmen) {
		this.unternehmen = unternehmen;
	}

	public boolean isIntern() {
		return intern;
	}

	public void setIntern(boolean intern) {
		this.intern = intern;
	}

	public String getStrassehaus() {
		return strassehaus;
	}

	public void setStrassehaus(String strassehaus) {
		this.strassehaus = strassehaus;
	}

	public String getPlz() {
		return plz;
	}

	public void setPlz(String plz) {
		this.plz = plz;
	}

	public String getStadt() {
		return stadt;
	}

	public void setStadt(String stadt) {
		this.stadt = stadt;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefonnummer() {
		return telefonnummer;
	}

	public void setTelefonnummer(String telefonnummer) {
		this.telefonnummer = telefonnummer;
	}

	public String getUnterrichtet() {
		return unterrichtet;
	}

	public void setUnterrichtet(String unterrichtet) {
		this.unterrichtet = unterrichtet;
	}

	public String getSchwerpunkt() {
		return schwerpunkt;
	}

	public void setSchwerpunkt(String schwerpunkt) {
		this.schwerpunkt = schwerpunkt;
	}

	public Zeitpraeferenzen getZeitpraef() {
		return zeitpraef;
	}

	public void setZeitpraef(Zeitpraeferenzen zeitpraef) {
		this.zeitpraef = zeitpraef;
	}

	public String getNotiz() {
		return notiz;
	}

	public void setNotiz(String notiz) {
		this.notiz = notiz;
	}

	public int getDID() {
		return DID;
	}

	public String getAnrede() {
		return anrede;
	}

	public void setAnrede(String anrede) {
		this.anrede = anrede;
	}

	
}