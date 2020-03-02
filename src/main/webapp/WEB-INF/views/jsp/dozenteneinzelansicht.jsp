<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
	<template:navbar />
	
	<div class="container">
		<!-- Start Orientierungszeile -->
	    <div class="mx-2 mt-3">
	        <div class="alert homeleiste" role="alert">
	           	<div class="row">
	               	<!-- Orientierungstext -->
	               	<div class="col homeleistetext">
	                   	Dozenteneinzelansicht - ${dozent.nachname}
	               	</div>
	               	<!-- Button "Zurück" -->
	               	<div class="dhbw_kursanlegen">
	                   	<a href="/dozent/getAll" class="btn btn-light DHBWbutton float-right">Zurück</a>
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
						<input type="text" class="form-control" name="dozentAnrede" placeholder="Anrede" value="${dozent.anrede}" disabled>
					</div>
					
					<div class="form-group">
						<label>Titel</label>
						<input type="text" class="form-control" name="dozentTitel" placeholder="Titel" value="${dozent.titel }" disabled>
					</div>
					
					<div class="form-group">
						<label>Vorname</label>
						<input type="text" class="form-control" name="dozentVorname" placeholder="Vorname" value="${dozent.vorname }" disabled>
					</div>
					
					<div class="form-group">
						<label >Nachname</label>
						<input type="text" class="form-control" name="dozentName"  placeholder="Nachname" value="${dozent.nachname }" disabled>
					</div>
					
					<div class="form-group">
						<label >Unternehmen</label>
						<input type="text" class="form-control" name="dozentUnternehmen" placeholder="Unternehmen" value="${dozent.unternehmen }" disabled>
					</div>
					
					<div class="form-group">
						<label >Straße und Hausnummer</label>
						<input type="text" class="form-control" name="dozentAdresse" placeholder="Straße und Hausnummer" value="${dozent.strasshaus }" disabled>
					</div>
					
					<div class="form-group">
						<label >Postleitzahl</label>
						<input type="text" class="form-control" name="dozentPLZ"  placeholder="Postleitzahl" value="${dozent.plz }" disabled>
					</div>
					
					<div class="form-group">
						<label >Stadt</label>
						<input type="text" class="form-control" name="dozentStadt"  placeholder="Stadt" value="${dozent.stadt }" disabled>
					</div>
					
					<div class="form-group">
						<label >E-Mail</label>
						<input type="text" class="form-control" name="dozentEmail" placeholder="E-Mail" value="${dozent.email }" disabled>
					</div>
					
					<div class="form-group">
						<label >Telefonnummer</label>
						<input type="text" class="form-control" name="dozentTelnr" placeholder="Telefonnummer" value="${dozent.telefonnummer }" disabled>
					</div>
					
					<div class="form-group">
						<label >Unterrichtsfächer</label>
						<input type="text" class="form-control" name="dozentUnterrichtsfaecher" placeholder="Unterrichtsfächer" value="${dozent.faecher }" disabled>
					</div>
					
					<div class="form-group">
						<label >Schwerpunkte</label>
						<input type="text" class="form-control" name="dozentSchwerpunkte" placeholder="Schwerpunkte" value="${dozent.schwerpunkte }" disabled>
					</div>
					<div class="form-group js-zeitpraef-text">
						<label >Zeitpräferenzen</label>
						<input type="text" class="form-control" name="dozentSchwerpunkte" placeholder="Schwerpunkte" value="${dozent.schwerpunkte }" disabled>
					</div>
					
					<div class="form-group d-none js-zeitpraef">
		                <label for="timespaces">Zeitpräferenzen</label>
		                <select class="form-control" id="timespaces" name="dozentZeitPraef">
		                	<option value="0">Vormittags</option>
		                	<option value="1">Nachmittags</option>
		                	<option value="2">Abends</option>
		                </select>
		            </div>
				
					
					<div class="form-group">
						<label >Notizen</label> <br>
						<textarea class="dozentNotizen" disabled>${dozent.notizen }</textarea>
					</div>
					
					
				</form>
			<!-- Ende Steckbrief -->
	       <!-- Ende Content -->
	    </div>
	</div>
</template:template>