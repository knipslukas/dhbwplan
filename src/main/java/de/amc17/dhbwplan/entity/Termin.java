package de.amc17.dhbwplan.entity;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Termin implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2062599609997878328L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="TID")
	private int TID;
	
    private Date datum;
	
	@Temporal(TemporalType.TIME)
	private Date von;
	
	@Temporal(TemporalType.TIME)
	private Date bis;

	public Date getVon() {
		return von;
	}

	public void setVon(Date von) {
		this.von = von;
	}

	public Date getBis() {
		return bis;
	}

	public void setBis(Date bis) {
		this.bis = bis;
	}

	public Date getDatum() {
		return datum;
	}

	public void setDatum(Date datum) {
		this.datum = datum;
	}
	
	
}
