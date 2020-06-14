package de.amc17.dhbwplan.data;

import java.util.List;

import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import de.amc17.dhbwplan.entity.Dozent;
import de.amc17.dhbwplan.entity.Praesenzzeitraum;

public class KursDto {

	
	private int KID;

	private String name;

	private int jahrgang;

	private int anzahlStudierende;
	
	@OneToOne
	private Dozent dozent;	

	@OneToMany(mappedBy="kurs")
    private List<Praesenzzeitraum> praesenzzeitraum;

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
	
	public Dozent getDozent() {
		return dozent;
	}

	public void setDozent(Dozent dozent) {
		this.dozent = dozent;
	}
	
	public List<Praesenzzeitraum> getPraesenzzeitraum() {
		return praesenzzeitraum;
	}

	public void setPraesenzzeitraum(List<Praesenzzeitraum> praesenzzeitraum) {
		this.praesenzzeitraum = praesenzzeitraum;
	}
}
