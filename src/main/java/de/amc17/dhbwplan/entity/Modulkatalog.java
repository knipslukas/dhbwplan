package de.amc17.dhbwplan.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

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
	
	private Date gültigVon;
	
	private Date gültigBis;

	public Date getGültigVon() {
		return gültigVon;
	}

	public void setGültigVon(Date gültigVon) {
		this.gültigVon = gültigVon;
	}

	public Date getGültigBis() {
		return gültigBis;
	}

	public void setGültigBis(Date gültigBis) {
		this.gültigBis = gültigBis;
	}
	
	
}
