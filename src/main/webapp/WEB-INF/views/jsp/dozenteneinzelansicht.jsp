<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
	<template:navbar />
	<!-- Start Orientierungszeile -->
    <div class="mx-2 mt-3">
        <div class="alert homeleiste" role="alert">
                <div class="row">
                    <!-- Orientierungstext -->
                    <div class="col homeleistetext">
                        Dozenteneinzelansicht
                    </div>
                    <!-- Button "Zurück" -->
                    <div class="dhbw_kursanlegen" style="text-align: right;">
                        <button type="button" class="btn btn-primary btn-sm DHBWbutton">Zurück</button>
                    </div>
                </div>
            </div>
    </div>
    <!-- Ende Orentierungszeile -->
    
     <!-- Start Content -->
    <div class="mx-2">
         
         <!-- Start Steckbrief -->
		   <form>
				<div class="form-group">
					<label>Anrede</label>
					<input type="text" class="form-control" name="dozentAnrede" placeholder="Anrede">
				</div>
				
				<div class="form-group">
					<label>Titel</label>
					<input type="text" class="form-control" name="dozentTitel" placeholder="Titel">
				</div>
				
				<div class="form-group">
					<label>Vorname</label>
					<input type="text" class="form-control" name="dozentVorname" placeholder="Vorname">
				</div>
				
				<div class="form-group">
					<label >Nachname</label>
					<input type="text" class="form-control" name="dozentName"  placeholder="Nachname">
				</div>
				
				<div class="form-group">
					<label >Unternehmen</label>
					<input type="text" class="form-control" name="dozentUnternehmen" placeholder="Unternehmen">
				</div>
				
				<div class="form-group">
					<label >Straße und Hausnummer</label>
					<input type="text" class="form-control" name="dozentAdresse" placeholder="Straße und Hausnummer">
				</div>
				
				<div class="form-group">
					<label >Postleitzahl</label>
					<input type="text" class="form-control" name="dozentPLZ"  placeholder="Postleitzahl">
				</div>
				
				<div class="form-group">
					<label >Stadt</label>
					<input type="text" class="form-control" name="dozentStadt"  placeholder="Stadt">
				</div>
				
				<div class="form-group">
					<label >E-Mail</label>
					<input type="text" class="form-control" name="dozentEmail" placeholder="E-Mail">
				</div>
				
				<div class="form-group">
					<label >Telefonnummer</label>
					<input type="text" class="form-control" name="dozentTelnr" placeholder="Telefonnummer">
				</div>
				
				<div class="form-group">
					<label >Unterrichtsfächer</label>
					<input type="text" class="form-control" name="dozentUnterrichtsfaecher" placeholder="Unterrichtsfächer">
				</div>
				
				<div class="form-group">
					<label >Schwerpunkte</label>
					<input type="text" class="form-control" name="dozentSchwerpunkte" placeholder="Schwerpunkte">
				</div>
				
				<div class="dropdown">
					<label >Zeitpräferenzen</label>
					<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						Zeitraum
					 </button>
					 <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item navigationlist">Vormittags</a>
						<a class="dropdown-item navigationlist">Nachmittags</a>
						<a class="dropdown-item navigationlist">Abends</a>
					 </div>
				</div>
				
				<div class="form-group">
					<label >Notizen</label> <br>
					<textarea class="dozentNotizen"> Hier können Sie Notizen ergänzen </textarea>
				</div>	
				
			</form>
		<!-- Ende Steckbrief -->
       <!-- Ende Content -->
    </div>
</template:template>