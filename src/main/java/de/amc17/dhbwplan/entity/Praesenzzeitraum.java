package de.amc17.dhbwplan.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Praesenzzeitraum implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -9193246840616350360L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="PID")
	private int PID;
	
	private int semester;
	
	@Temporal(TemporalType.TIME)
	private Date von;
	
	@Temporal(TemporalType.TIME)
	private Date bis;

	public int getSemester() {
		return semester;
	}

	public void setSemester(int semester) {
		this.semester = semester;
	}

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
}
