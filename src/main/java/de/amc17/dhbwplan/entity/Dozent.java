package de.amc17.dhbwplan.entity;

import java.io.Serializable;
import java.util.ArrayList;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "dozent")																				
public class Dozent implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="DID")
	private int DID;
	
	@Column(name="Vorname")
	private String vorname;
	
	@Column(name="Nachname")
	private String nachname;
	
	@Column(name="Email")
	private String email;
	
    @Column(name="Anrede") 							//TODO: Umbenennen restlicher Attribute
	private String anrede;
    
    private String Lala;
	
	@Column(name="Titel")
	private String titel;
	
	private String telefonnummer;
	
//	@Column(name="Hauptamtlich") 
//	private boolean mHauptamtlich;
	//private ArrayList<Fach> moeglicheFaecher;
	
	//Funktioniert so nicht, Abbildung so nicht moeglich
	//private ArrayList<Fach> gehalteneFaecher;
	@Column(name="Kommentar")
	private String mKommentar;

//	  @ManyToMany(mappedBy="dozenten")
//	  private Set<Modul> faecher;
//	  private Set<Modul> gehalteneFaecher

	public int getDID() {
		return DID;
	}

	public void setDID(int aID) {
		DID = aID;
	}

	public String getvorname() {  //getter, setter müssen den gleichen Namen wie die Variablen bekommen !!! 
		return vorname;
	}

	public void setvorname(String avorname) {
		vorname = avorname;
	}

	public String getnachname()
	{
		return nachname;
	}
	
	public void setnachname(String aNachname)
	{
		nachname = aNachname;
	}
	
	public String getemail()
	{
		return email;
	}
	
	public void setemail(String aEmail)
	{
		email = aEmail;
	}
		
	public String getAnrede()
	{
		return anrede;
	}
	
	public void setAnrede(String aAnrede)
	{
		anrede = aAnrede;
	}

	public String getTitel()
	{
		return titel;
	}
	
	public void setTitel(String aTitel)
	{
		titel = aTitel;
	}
	
//	public boolean getHauptamtlich()
//	{
//		return mHauptamtlich;
//	}
//	
//	public void setHauptamtlich(boolean aHauptamtlich)
//	{
//		mHauptamtlich = aHauptamtlich;
//	}
	
	public String getTelefonnummer() {
		return telefonnummer;
	}

	public void setTelefonnummer(String telefonnummer) {
		this.telefonnummer = telefonnummer;
	}

	public String getKommentar()
	{
		return mKommentar;
	}
	
	public void setKommentar(String aKommentar)
	{
		mKommentar = aKommentar;
	}
		

//
//		public Set<Modul> getfaecher() 
//		{
//			return faecher;
//		}
//
//		public void setfaecher(Set<Modul> aFächer) 
//		{
//			faecher = aFächer;
//		}
//		
//		public Set<Modul> getgehalteneFaecher() 
//		{
//			return gehaltenefaecher;
//		}
//
//		public void setgehalteneFaecher(Set<Modul> aGehalteneFächer) 
//		{
//			gehalteneFaecher = aGehalteneFächer;
//		}
	
}
