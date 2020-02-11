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
//  @Column(name="Anrede") 							//TODO: Umbenennen restlicher Attribute
//	private String mAnrede;
//	@Column(name="Titel")
//	private String mTitel;
//	@Column(name="Hauptamtlich") 
//	private boolean mHauptamtlich;
	//private ArrayList<Fach> moeglicheFaecher;
	//private ArrayList<Fach> gehalteneFaecher;
//	@Column(name="Kommentar")
//	private String mKommentar;
//	@Column(name="Passwort") 
//	private String mPasswort;

//	  @ManyToMany(mappedBy="dozenten")
//	  private Set<Modul> mFächer;
//	  private Set<Modul> mGehalteneFächer

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
//		public String getAnrede()
//		{
//			return mAnrede;
//		}
//		
//		public void setAnrede(String aAnrede)
//		{
//			mAnrede = aAnrede;
//		}
//	
//		public String getTitel()
//		{
//			return mTitel;
//		}
//		
//		public void setTitel(String aTitel)
//		{
//			mTitel = aTitel;
//		}
//		
//		public boolean getHauptamtlich()
//		{
//			return mHauptamtlich;
//		}
//		
//		public void setHauptamtlich(boolean aHauptamtlich)
//		{
//			mHauptamtlich = aHauptamtlich;
//		}
//		
//		public String getKommentar()
//		{
//			return mKommentar;
//		}
//		
//		public void setKommentar(String aKommentar)
//		{
//			mKommentar = aKommentar;
//		}
//		

//		
//		public String getPasswort()
//		{
//			return mPasswort;
//		}
//		
//		public void setPasswort(String aPasswort)
//		{
//			mPasswort = aPasswort;
//		}

//
//		public Set<Modul> getFächer() 
//		{
//			return mFächer;
//		}
//
//		public void setFächer(Set<Modul> aFächer) 
//		{
//			mFächer = aFächer;
//		}
//		
//		public Set<Modul> getGehalteneFächer() 
//		{
//			return mGehalteneFächer;
//		}
//
//		public void setGehalteneFächer(Set<Modul> aGehalteneFächer) 
//		{
//			mGehalteneFächer = aGehalteneFächer;
//		}

	// Test Kathi
//	@Id

//	@GeneratedValue(strategy=GenerationType.AUTO)
//	private UUID mDID; 
//	
//	private String mVorname; 
//	
//	
//	 public String getVorname() {
//		    return mVorname;
//		  }
//	public UUID getDID() {
//		// TODO Auto-generated method stub
//		return mDID;
//	}
}
