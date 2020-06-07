package de.amc17.dhbwplan.entity;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

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
	

    @OneToMany(mappedBy="kurs")
    private Set<Praesenzzeitraum> praesenzzeitraum;

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
}
