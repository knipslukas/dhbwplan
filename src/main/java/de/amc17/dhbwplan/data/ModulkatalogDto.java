package de.amc17.dhbwplan.data;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class ModulkatalogDto {
	
	private String name; 
	
	private Date gueltigVon;
	
	private Date gueltigBis;
	

	public Date getGueltigVon() {
		return gueltigVon;
	}
	
	public void setname(String name) {
		this.name = name;
	}

	public String getname() {
		return name;
	}

	public void setGueltigVon(String gv) {
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		 
		Date date;
		try {
			date = formatter.parse(gv);
			this.gueltigVon =  date;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}

	public Date getGueltigBis() {
		return gueltigBis;
	}

	public void setGueltigBis(String gb) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		 
		Date date;
		try {
			date = formatter.parse(gb);
			this.gueltigBis =  date;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
}
