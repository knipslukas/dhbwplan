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
public class Kurs implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4077563711769047207L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "KID")
	private int KID;

	private String name;

	private int jahrgang;

	private int anzahlStudierende;
	
	@ManyToOne 
	@JoinColumn(name="riID")
	@JsonIgnore
	private Studienrichtung studienrichtung;
	
	public Studienrichtung getStudienrichtung() {
		return studienrichtung;
	}

	public void setStudienrichtung(Studienrichtung studienrichtung) {
		this.studienrichtung = studienrichtung;
	}
	
	@ManyToOne 
	@JoinColumn(name="DID")
	@JsonIgnore
	private Dozent dozent;
	
	public Dozent getDozent() {
		return dozent;
	}

	public void setDozent(Dozent dozent) {
		this.dozent = dozent;
	}
	
	@OneToMany(mappedBy="kurs")
    private List<Praesenzzeitraum> praesenzzeitraum;

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

	public int getKID() {
		return KID;
	}

	public void setKID(int KID) {
		this.KID = KID;
	}

	public List<Praesenzzeitraum> getPraesenzzeitraum() {
		return praesenzzeitraum;
	}

	public void setPraesenzzeitraum(List<Praesenzzeitraum> praesenzzeitraum) {
		this.praesenzzeitraum = praesenzzeitraum;
	}
	
	
}
