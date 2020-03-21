package de.amc17.dhbwplan.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
