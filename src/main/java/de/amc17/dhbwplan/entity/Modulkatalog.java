package de.amc17.dhbwplan.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Modulkatalog implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8568487908453793415L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="MKID")
	private int MKID;
	
	private Date gueltigVon;
	
	private Date gueltigBis;
	
	@ManyToOne 
	@JoinColumn(name="riID")
	@JsonIgnore
	private Studienrichtung studienrichtung;
	
	public Studienrichtung getStudienrichtung() {
		return studienrichtung;
	}

	public void setStudienrichtung(Studienrichtung studienrichtung) {
		this.studienrichtung = studienrichtung;
	}

	public int getMKID() {
		return MKID;
	}
	
	public void setMKID(int MKID) {
		this.MKID = MKID;
	}

	public Date getGueltigVon() {
		return gueltigVon;
	}

	public void setGueltigVon(Date gueltigVon) {
		this.gueltigVon = gueltigVon;
	}

	public Date getGueltigBis() {
		return gueltigBis;
	}

	public void setGueltigBis(Date gueltigBis) {
		this.gueltigBis = gueltigBis;
	}
	
	
	
}
