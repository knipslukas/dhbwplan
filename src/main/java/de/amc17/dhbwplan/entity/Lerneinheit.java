package de.amc17.dhbwplan.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Lerneinheit implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7038914434975274796L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="LEID")
	private int LEID;
	
	private int präsenzzeit;
	
	private int selbststudium;

	public int getPräsenzzeit() {
		return präsenzzeit;
	}

	public void setPräsenzzeit(int präsenzzeit) {
		this.präsenzzeit = präsenzzeit;
	}

	public int getSelbststudium() {
		return selbststudium;
	}

	public void setSelbststudium(int selbststudium) {
		this.selbststudium = selbststudium;
	}
}
