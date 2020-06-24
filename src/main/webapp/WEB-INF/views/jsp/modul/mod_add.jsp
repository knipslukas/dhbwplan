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
	                <label for="Bezeichnung" class="col-2 col-form-label">Bezeichnung</label>
	                <div class="col-10">
						<input type="text" name="bezeichnung" class="form-control" placeholder="Bezeichnung eingeben" required>
	                </div>
	            </div>
	
	            <div class="form-group row">
	                <label class="col-2 col-form-label">Studienjahr</label>
	                <div class="col-10">
	                	<select class="form-control">
	                		<option disabled selected>Bitte Auswählen</option>
		                	<option value="Studienjahr 1">Studienjahr 1</option>
		                	<option value="Studienjahr 2">Studienjahr 2</option>
		                	<option value="Studienjahr 3">Studienjahr 3</option>
	                	</select>
	            	</div>
	            </div>
	            
	              <div class="form-group row">
	                <label class="col-2 col-form-label">Modulkatalog</label>
	                <div class="col-10">
	                	<select class="form-control" id="modulkatalog" name="modulkatalogID">
		                	<option disabled selected>Modulkatalog auswählen</option>
		                	<c:forEach items="${modulkatalogList}" var="modulkatalog">
		                		<option value="${modulkatalog.MKID}">${modulkatalog.name} ${modulkatalog.gueltigVon} ${modulkatalog.gueltigVon}</option>
		                	</c:forEach>
		                </select>
	                </div>
	            </div>
	
	            <div class="form-group row">
	                <label class="col-2 col-form-label">Selbststudium</label>
	                <div class="col-10">
	                	<input type="number" name="selbststudium" class="form-control" placeholder="Selbststudium eingeben" required>
	                </div>
	            </div>
	
	            <div class="form-group row">
	                <label class="col-2 col-form-label">Moduldauer</label>
	                <div class="col-10">
						<select class="form-control">
	                		<option disabled selected>Bitte Auswählen</option>
		                	<option value="1 Semester">1 Semester</option>
		                	<option value="2 Semester">2 Semester</option>
	                	</select>	                
	                </div>
	            </div>
	            
	            <div class="form-group row">
	                <label class="col-2 col-form-label">Modulart</label>
	                <div class="col-10">
	                	<select class="form-control">
	                		<option disabled selected>Bitte Auswählen</option>
		                	<option value="Pflichtmodul">Pflichtmodul</option>
		                	<option value="Kernmodul">Kernmodul</option>
	                	</select>	  
	                </div>
	            </div>
	
	            <div class="form-group row">
	                <label class="col-2 col-form-label">Prüfungsleistung</label>
	                <div class="col-10">
	                	<select class="form-control">
	                		<option disabled selected>Bitte Auswählen</option>
		                	<option value="Klausur">Klausur</option>
		                	<option value="Seminararbeit">Seminararbeit</option>
	                	</select>
	                </div>
	            </div>
	            
	            <div class="form-group row">
	                <label class="col-2 col-form-label">Beschreibung</label>
	                <div class="col-10">
	                	<input type="text" name="beschreibung" class="form-control" placeholder="Beschreibung eingeben" required>
	                </div>
	            </div>
	
				<div class="form-group row">
	            	<label class="col-2 col-form-label">Sprache</label>
	            	<div class="col-10">
	            		<select class="form-control">
	                		<option disabled selected>Bitte Auswählen</option>
		                	<option value="Deutsch">Deutsch</option>
		                	<option value="Englisch">Englisch</option>
	                	</select>
	            	</div>
	            </div>
	            
	            <div class="form-group row">
		               <label class="col-2 col-form-label">Präsenzzeit</label>
		               <div class="col-10">
		                <input type="number" name="präsenzzeit" class="form-control" placeholder="Präsenzzeit eingeben" required>
		                </div>
		         </div>
	            
		          <div class="form-group row">
		            	<label class="col-2 col-form-label">ECTS-Punkte</label>
		            	<div class="col-10">
		            		<input type="number" name="ects-punkte" class="form-control" placeholder="ECTS-Punkte eingeben" required>
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