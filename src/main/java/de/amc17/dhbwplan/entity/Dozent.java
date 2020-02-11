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
//  @Column(name="Anrede") 							
//	private String anrede;
//	@Column(name="Titel")
//	private String titel;
//	@Column(name="Hauptamtlich") 
//	private boolean hauptamtlich;
	//private ArrayList<Fach> moeglicheFaecher;
	//private ArrayList<Fach> gehalteneFaecher;
//	@Column(name="Kommentar")
//	private String kommentar;
//	@Column(name="Passwort") 
//	private String passwort;

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
	
//		
//		public String getanrede()
//		{
//			return anrede;
//		}
//		
//		public void setanrede(String aAnrede)
//		{
//			anrede = aAnrede;
//		}
//	
//		public String gettitel()
//		{
//			return titel;
//		}
//		
//		public void settitel(String aTitel)
//		{
//			titel = aTitel;
//		}
//		
//		public boolean gethauptamtlich()
//		{
//			return hauptamtlich;
//		}
//		
//		public void sethauptamtlich(boolean aHauptamtlich)
//		{
//			hauptamtlich = aHauptamtlich;
//		}
//		
//		public String getkommentar()
//		{
//			return kommentar;
//		}
//		
//		public void setkommentar(String aKommentar)
//		{
//			kommentar = aKommentar;
//		}
//		

//		
//		public String getpasswort()
//		{
//			return passwort;
//		}
//		
//		public void setpasswort(String aPasswort)
//		{
//			passwort = aPasswort;
//		}

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
