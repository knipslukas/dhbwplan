<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
    <template:navbar />


	<div class="container">
	
    	<!-- Start Orentierungszeile -->
	   	<div class="mx-2 mt-3">
	       	<div class="alert  dozentuebersicht" role="alert">
		        <div class="row">
		            <!-- Orientierungstext -->
		            <div class="col dozentuebersichttext">
		                Dozent anlegen
		            </div>
		            <!-- Button "Dozent anlegen" -->
		            <div class="col">
		                <a href="/dozent/" class="btn btn-light float-right DHBWbutton">Zurück</a>
		            </div>
		        </div>
	    	</div>
	    </div>
    <!-- Ende Orentierungszeile -->
	
	    <!-- Start Content -->
	    <div class="dhbw_content">
	        <!-- Start Formular -->
	        <form class="pb-3 js-form-dozanleg" method="POST" action="/dozent/add">	            
	            <div class="form-group">
	                <label for="anrede">Anrede</label>
	                <select class="form-control" id="anrede" name="anrede">
	                	<option disabled selected>Anrede Auswählen</option>
	                	<option value="Herr">Herr</option>
	                	<option value="Frau">Frau</option>
	                	<option value="Divers">Divers</option>
	                </select>
	            </div>
	
	            <div class="form-group">
	                <label>Titel</label>
	                <input type="text" name="titel" class="form-control" placeholder="Titel eingeben">
	            </div>
	
	            <div class="form-group">
	                <label>Vorname</label>
	                <input type="text" name="vorname" class="form-control" placeholder="Vorname eingeben">
	            </div>
	
	            <div class="form-group">
	                <label>Nachname</label>
	                <input type="text" name="nachname" class="form-control" placeholder="Nachname eingeben">
	            </div>
	
	            <div class="form-group">
	                <label>Unternehmen</label>
	                <input type="text" name="unternehmen" class="form-control" placeholder="Unternehmen eingeben">
	            </div>
	            
	            <div class="form-group">
	            	<label>DHBW Intern</label><br>
	            	<input type="checkbox" data-toggle="toggle" data-size="sm" data-on="Ja" data-off="Nein" name="intern" data-style="mr-1">
	            </div>
	
	            <div class="form-group">
	                <label>Straße und Hausnummer</label>
	                <input type="text" name="strassehaus" class="form-control" placeholder="Straße und Hausnummer eingeben">
	            </div>
	
	            <div class="form-group">
	                <label>Postleitzahl</label>
	                <input type="text" name="plz" class="form-control" placeholder="Postleitzahl eingeben">
	            </div>
	
	            <div class="form-group">
	                <label>Stadt</label>
	                <input type="text" name="stadt" class="form-control" placeholder="Stadt eingeben">
	            </div>
	
	            <div class="form-group">
	                <label>E-Mail</label>
	                <input type="text" name="email" class="form-control" placeholder="E-Mail eingeben">
	            </div>
	
	            <div class="form-group">
	                <label>Telefonnummer</label>
	                <input type="text" name="telefonnummer" class="form-control" placeholder="Telefonnummer eingeben">
	            </div>
	
	            <div class="form-group">
	                <label>Unterrichtsfächer</label>
	                <input type="text" name="unterrichtet" class="form-control" placeholder="Unterrichtsfächer eingeben">
	            </div>
	
	            <div class="form-group">
	                <label>Schwerpunkte</label>
	                <input type="text" name="schwerpunkt" class="form-control" placeholder="Schwerpunkte eingeben">
	            </div>
	
	            <div class="form-group">
	                <label for="timespaces">Zeitpräferenzen</label>
	                <select class="form-control" id="timespaces" name="zeitpraef">
	                	<option disabled selected>Bitte Auswählen</option>
	                	<option value="VORMITTAG">Vormittags</option>
	                	<option value="NACHMITTAG">Nachmittags</option>
	                	<option value="ABEND">Abends</option>
	                </select>
	            </div>
	
	            <div class="form-group">
	                <label>Notizen</label> <br>
	                <textarea class="form-control" name="notiz" placeholder="Hier können Sie Notizen ergänzen"></textarea>
	            </div>
	
	            <!-- Final Buttons-->
	            <div class="finalButtons">
	                <button type="submit" class="btn btn-primary btn-sm DHBWbutton">Speichern </button>
	                <button type="reset" class="btn btn-primary btn-sm DHBWbutton">Abbrechen </button>
	            </div>
	
	        </form>
	
	        <!-- Ende Formular -->
	
	        <!-- Ende Content -->
	    </div>
	</div>
	


</template:template>