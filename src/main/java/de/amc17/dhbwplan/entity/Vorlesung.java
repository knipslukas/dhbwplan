package de.amc17.dhbwplan.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Vorlesung implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3705267203037916465L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="VID")
	private int VID;
	
	private int vorlesungsstunden;
	
	private String name;
	
	public int getVorlesungsstunden() {
		return vorlesungsstunden;
	}

	public void setVorlesungsstunden(int vorlesungsstunden) {
		this.vorlesungsstunden = vorlesungsstunden;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
		
	

	public int getVID() {
		return VID;
	}
	
	public void setVID(int VID) {
		this.VID = VID;
	}
}
