package de.amc17.dhbwplan.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Lerneinheit implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7038914434975274796L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "LEID")
	private int LEID;

	@ManyToOne
	@JoinColumn(name = "modul_ID")
	@JsonIgnore
	private Modul modul;

	private String name;

	private int praesenzzeit;

	private int selbststudium;
	
	@ManyToMany(mappedBy = "kannhalten")
	private List<Dozent> haelt;

	public int getLEID() {
		return LEID;
	}

	public void setLEID(int LEID) {
		this.LEID = LEID;
	}

	public Modul getModul() {
		return modul;
	}

	public void setModul(Modul modul) {
		this.modul = modul;
	}

	public int getPraesenzzeit() {
		return praesenzzeit;
	}

	public void setPräsenzzeit(int praesenzzeit) {
		this.praesenzzeit = praesenzzeit;
	}

	public int getSelbststudium() {
		return selbststudium;
	}

	public void setSelbststudium(int selbststudium) {
		this.selbststudium = selbststudium;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
