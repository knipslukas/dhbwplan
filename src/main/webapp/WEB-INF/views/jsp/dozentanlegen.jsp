<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
    <template:navbar />

	
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
	<div class="container">
	    <!-- Start Content -->
	    <div class="dhbw_content">
	        <!-- Start Formular -->
	        <form class="pb-3" action="/dozent/add" method="post">
	            <div class="form-group">
	                <label>Anrede</label>
	                <input type="text" name="dozentAnrede" class="form-control" placeholder="Enter Anrede">
	            </div>
	
	            <div class="form-group">
	                <label>Titel</label>
	                <input type="text" name="dozentTitel" class="form-control" placeholder="Enter Titel">
	            </div>
	
	            <div class="form-group">
	                <label>Vorname</label>
	                <input type="text" name="dozentVorname" class="form-control" placeholder="Enter Vorname">
	            </div>
	
	            <div class="form-group">
	                <label>Nachname</label>
	                <input type="text" name="dozentName" class="form-control" placeholder="Enter Nachname">
	            </div>
	
	            <div class="form-group">
	                <label>Unternehmen</label>
	                <input type="text" name="dozentUnternehmen" class="form-control" placeholder="Enter Unternehmen">
	            </div>
	
	            <div class="form-group">
	                <label>Straße und Hausnummer</label>
	                <input type="text" name="dozentStrasse" class="form-control" placeholder="Enter Straße und Hausnummer">
	            </div>
	
	            <div class="form-group">
	                <label>Postleitzahl</label>
	                <input type="text" name="dozentPLZ" class="form-control" placeholder="Enter Postleitzahl">
	            </div>
	
	            <div class="form-group">
	                <label>Stadt</label>
	                <input type="text" name="dozentStadt" class="form-control" placeholder="Enter Stadt">
	            </div>
	
	            <div class="form-group">
	                <label>E-Mail</label>
	                <input type="text" name="dozentEmail" class="form-control" placeholder="Enter E-Mail">
	            </div>
	
	            <div class="form-group">
	                <label>Telefonnummer</label>
	                <input type="text" name="dozentTele" class="form-control" placeholder="Enter Telefonnummer">
	            </div>
	
	            <div class="form-group">
	                <label>Unterrichtsfächer</label>
	                <input type="text" name="dozentUnterrichtsfaecher" class="form-control"
	                    placeholder="Enter Unterrichtsfächer">
	            </div>
	
	            <div class="form-group">
	                <label>Schwerpunkte</label>
	                <input type="text" name="dozentSchwerpunkte" class="form-control" placeholder="Enter Schwerpunkte">
	            </div>
	
	            <div class="form-group">
	                <label for="timespaces">Zeitpräferenzen</label>
	                <select class="form-control" id="timespaces" name="dozentZeitPraef">
	                	<option value="0">Vormittags</option>
	                	<option value="1">Nachmittags</option>
	                	<option value="2">Abends</option>
	                </select>
	            </div>
	
	            <div class="form-group">
	                <label>Notizen</label> <br>
	                <textarea class="dozentNotizen"> Hier können Sie Notizen ergänzen </textarea>
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