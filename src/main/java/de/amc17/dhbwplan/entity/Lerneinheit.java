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
	
	private int praesenzzeit;
	
	private int selbststudium;

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
}
