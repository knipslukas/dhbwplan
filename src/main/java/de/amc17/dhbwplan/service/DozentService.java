package de.amc17.dhbwplan.service;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

@Service
public class DozentService {

	@Resource
	private DozentRepository dozentRepository;

	public Dozent addDozent(
		Dozent d
	) {
		Dozent d2 = new Dozent();
		d2.setDID(d.mDID);
		d2.setVorname(d.mVorname);
		d2.setNachname(d.mNachname);
		d2.setAnrede(d.mAnrede);
		d2.setTitel(d.mTitel);
		d2.setHauptamtlich(d.mHauptamtlich);
		d2.setMöglicheFächer(d.mMöglicheFächer);
		d2.setGehalteneFächer(d.mGehalteneFächer);
		d2.setKommentar(d.mKommentar);
		d2.setEmail(d.mEmail);
		d2.setPasswort(d.mPasswort);

	    dozentRepository.save(d2);
	    return d2;
	}

	public String getDozentNachnameByID(UUID mDID) {return dozentRepository.findByID.getDozentNachnameByID(mDID);}
	public String getDozentEmailByID(UUID mDID) {return dozentRepository.findByID.getDozentEmailByID(mDID);}
	public List<Fach> getDozentMöglicheFächerByID(UUID mDID) {return dozentRepository.findByID.getDozentMöglicheFächerByID(mDID);}
	public List<Fach> getDozentGehalteneFächerByID(UUID mDID) {return dozentRepository.findByID.getDozentGehalteneFächerByID(mDID);}
	public Dozent deleteDozent(UUID mDID) {return dozentRepository.findByID.deleteDozent(mDID);}
	public Dozent updateDozent(UUID mDID) {return dozentRepository.findByID.updateDozent(mDID);}
		
}