package de.amc17.dhbwplan.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Studienrichtung implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8704198075041666111L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="RiID")
	private int riID;
	
	private String name;
	
	@ManyToOne
	@JoinColumn(name="StID", nullable=false)
	@JsonIgnore
	private Studiengang studiengang;
	
	@OneToOne(fetch = FetchType.LAZY)
	private Modulkatalog modulkatalog;
	
	public int getriID() {
		return riID;
	}
	
	public void setriID(int riID) {
		this.riID = riID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public Studiengang getStudiengang() {
		return studiengang;
	}
	
	public void setStudiengang(Studiengang studiengang) {
		this.studiengang=studiengang;
	}
	
	public Modulkatalog getModulkatalog() {
		return modulkatalog;
	}

	public void setModulkatalog(Modulkatalog modulkatalog) {
		this.modulkatalog = modulkatalog;
	}
}
