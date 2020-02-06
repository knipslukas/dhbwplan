package de.amc17.dhbwplan.entity;

import java.io.Serializable;

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
	@Column(name="ID")
	private int mDID;
	
	@Column(name="Vorname")
	private String mVorname;
	
	@Column(name="Nachname")
	private String mNachname;
	
	@Column(name="Email")
	private String mEmail;
//  @Column(name="Anrede")
//	private String mAnrede;
//	@Column(name="Titel")
//	private String mTitel;
//	@Column(name="Hauptamtlich") 
//	private boolean mHauptamtlich;
	// private ArrayList<Fach> mFächer;
	// private ArrayList<Fach> mGehalteneFächer;
//	@Column(name="Kommentar")
//	private String mKommentar;
//	@Column(name="Passwort") 
//	private String mPasswort;

//	  @ManyToMany(mappedBy="dozenten")
//	  private Set<Modul> mFächer;
//	  private Set<Modul> mGehalteneFächer

	public int getDID() {
		return mDID;
	}

	public void setDID(int aDID) {
		mDID = aDID;
	}

	public String getmVorname() {  //getter, setter müssen den gleichen Namen wie die Variablen bekommen !!! 
		return mVorname;
	}

	public void setmVorname(String avorname) {
		mVorname = avorname;
	}

	public String getmNachname()
	{
		return mNachname;
	}
	
	public void setmNachname(String aNachname)
	{
		mNachname = aNachname;
	}
	
	public String getmEmail()
	{
		return mEmail;
	}
	
	public void setmEmail(String aEmail)
	{
		mEmail = aEmail;
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
