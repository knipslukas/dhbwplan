<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
    <template:navbar user="${currentUser}"/>


	<div class="container">
	
    	<!-- Start Orentierungszeile -->
	   	<div class="alert dozentuebersicht d-flex align-items-center" role="alert">
			<h1 class="text-white my-1">Präsenzzeitraum anlegen</h1>
			<a href="/dozent" class="btn ml-auto DHBWbutton">Zurück</a>
        </div>
    	<!-- Ende Orentierungszeile -->
	
	    <!-- Start Content -->
	    <div class="dhbw_content mt-5">
	        <!-- Start Formular -->
	        <form class="pb-3 js-form-dozanleg" method="POST" action="/praesenzzeitraum/add">	      
	        	  
	            <div class="form-group row">
	                <label for="semester" class="col-2 col-form-label">Semester</label>
	                <div class="col-10">
		                <select class="form-control" id="semester" name="semester">
		                	<option disabled selected>Semester Auswählen</option>
		                	<option value="1">1.</option>
		                	<option value="2">2.</option>
		                	<option value="3">3.</option>
		                	<option value="4">4.</option>
		                	<option value="5">5.</option>
		                	<option value="6">6.</option>
		                </select>
	                </div>
	            </div>
	
	            <div class="form-group row">
	                <label class="col-2 col-form-label">Datum Von</label>
	                <div class="col-10">
	                	<input type="text" name="date_von" class="form-control" placeholder="Datum von eingeben">
	            	</div>
	            </div>
	
	            <div class="form-group row">
	                <label class="col-2 col-form-label">Datum Bis</label>
	                <div class="col-10">
	                	<input type="text" name="date_bis" class="form-control" placeholder="Datum bis wann eingeben" required>
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
	
	<script src="${pageContext.request.contextPath}/static/js/dozent.js"></script>

</template:template>