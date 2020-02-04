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
	private int mDID;
	
	private String mVorname;
//	  private String mNachname;
//	  private String mAnrede;
//	  private String mTitel;
//	  private boolean mHauptamtlich;
	// private ArrayList<Fach> mFächer;
	// private ArrayList<Fach> mGehalteneFächer;
//	  private String mKommentar;
//	  private String mEmail;
//	  private String mPasswort;

//	  @ManyToMany(mappedBy="dozenten")
//	  private Set<Modul> mFächer;
//	  private Set<Modul> mGehalteneFächer

	public int getDID() {
		return mDID;
	}

	public void setDID(int aDID) {
		mDID = aDID;
	}

	public String getmVorname() {
		return mVorname;
	}

	public void setmVorname(String avorname) {
		mVorname = avorname;
	}

//		public String getNachname()
//		{
//			return mNachname;
//		}
//		
//		public void setNachname(String aNachname)
//		{
//			mNachname = aNachname;
//		}
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
//		public String getEmail()
//		{
//			return mEmail;
//		}
//		
//		public void setEmail(String aEmail)
//		{
//			mEmail = aEmail;
//		}
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
