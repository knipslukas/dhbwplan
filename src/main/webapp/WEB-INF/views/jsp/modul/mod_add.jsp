<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
    <template:navbar user="${currentUser}"/>


	<div class="container">
	
    	<!-- Start Orentierungszeile -->
	   	<div class="alert dozentuebersicht d-flex align-items-center" role="alert">
			<h1 class="text-white my-1">Modul anlegen</h1>
			<a href="/modul" class="btn ml-auto DHBWbutton">Zurück</a>
        </div>
    	<!-- Ende Orentierungszeile -->
	
	    <!-- Start Content -->
	    <div class="dhbw_content mt-5">
	        <!-- Start Formular -->
	        <form class="pb-3 js-form-dozanleg" method="POST" action="/modul/add">	      
	        	  
	            <div class="form-group row">
	                <label for="Bezeichnung" class="col-2 col-form-label">Bezeichnung:</label>
	                <div class="col-10">
						<input type="text" name="bezeichnung" class="form-control" placeholder="Bezeichnung eingeben" required>
	                </div>
	            </div>
	
	            <div class="form-group row">
	                <label class="col-2 col-form-label">Studienjahr:</label>
	                <div class="col-10">
	                	<select class="form-control" name="studienjahr">
	                		<option disabled selected>Bitte Auswählen</option>
		                	<option value="1">Studienjahr 1</option>
		                	<option value="2">Studienjahr 2</option>
		                	<option value="3">Studienjahr 3</option>
	                	</select>
	            	</div>
	            </div>
	            
	              <div class="form-group row">
	                <label class="col-2 col-form-label">Modulkatalog:</label>
	                <div class="col-10">
	                	<select class="form-control" id="modulkatalog" name="modulkatalogID">
		                	<option disabled selected>Modulkatalog auswählen</option>
		                	<c:forEach items="${modulkatalogList}" var="modulkatalog">
		                		<option value="${modulkatalog.MKID}">${modulkatalog.name}</option>
		                	</c:forEach>
		                </select>
	                </div>
	            </div>
	
	            <div class="form-group row">
	                <label class="col-2 col-form-label">Moduldauer:</label>
	                <div class="col-10">
						<select class="form-control" name="moduldauer">
	                		<option disabled selected>Bitte Auswählen</option>
		                	<option value="1">1 Semester</option>
		                	<option value="2">2 Semester</option>
	                	</select>	                
	                </div>
	            </div>
	            
	            <div class="form-group row">
	                <label class="col-2 col-form-label">Modulart:</label>
	                <div class="col-10">
	                	<select class="form-control" name="modulart">
	                		<option disabled selected>Bitte Auswählen</option>
		                	<option value="Pflichtmodul">Pflichtmodul</option>
		                	<option value="Kernmodul">Kernmodul</option>
	                	</select>	  
	                </div>
	            </div>
	
	            <div class="form-group row">
	                <label class="col-2 col-form-label">Prüfungsleistung:</label>
	                <div class="col-10">
	                	<select class="form-control" name="pruefungsleistung">
	                		<option disabled selected>Bitte Auswählen</option>
		                	<option value="Klausur">Klausur</option>
		                	<option value="Seminararbeit">Seminararbeit</option>
		                	<option value="Alternative Prüfungsleistung">Alternative Prüfungsleistung</option>
	                	</select>
	                </div>
	            </div>
	            
	            <div class="form-group row">
	                <label class="col-2 col-form-label">Beschreibung:</label>
	                <div class="col-10">
	                	<input type="text" name="beschreibung" class="form-control" placeholder="Beschreibung eingeben" required>
	                </div>
	            </div>
	
				<div class="form-group row">
	            	<label class="col-2 col-form-label">Sprache:</label>
	            	<div class="col-10">
	            		<select class="form-control" name="sprache">
	                		<option disabled selected>Bitte Auswählen</option>
		                	<option value="Deutsch">Deutsch</option>
		                	<option value="Englisch">Englisch</option>
	                	</select>
	            	</div>
	            </div>
	            
		        <div class="form-group row">
		            	<label class="col-2 col-form-label">ECTS-Punkte:</label>
		            	<div class="col-10">
		            		<input type="number" name="ectsPunkte" class="form-control" placeholder="ECTS-Punkte eingeben" required>
		            	</div>
		        </div>
	            
	            <!-- Das hier muss IMMER dazu, das hilft Spring zu erkennen, ob Angriffe auf die Übertragung stattgefunden haben oder nicht -->
	            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	
	            <!-- Final Buttons-->
	            <div class="finalButtons">
	                <button type="submit" class="btn btn-success">Speichern </button>
	                <button type="reset" class="btn btn-danger">Zurücksetzen </button>
	            </div>
	
	        </form>
	
	        <!-- Ende Formular -->
	
	        <!-- Ende Content -->
	    </div>
	</div>
	
	<script src="${pageContext.request.contextPath}/static/js/modul.js"></script>

</template:template>