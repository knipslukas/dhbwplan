package de.amc17.dhbwplan.data;

import java.util.Date;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;

public class PrzDto {
	
	private int semester;
	@Temporal(TemporalType.TIME)
	private Date von;
	
	@Temporal(TemporalType.TIME)
	private Date bis;
	
	private int KID;

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

	public int getKID() {
		return KID;
	}

	public void setKID(int KID) {
		this.KID = KID;
	}
	
	

}
