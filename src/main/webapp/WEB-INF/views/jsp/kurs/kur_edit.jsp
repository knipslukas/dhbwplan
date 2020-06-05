<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
    <template:navbar user="${currentUser}" />


	<div class="container">
	
    	<!-- Start Orentierungszeile -->
	   	<div class="alert dozentuebersicht d-flex align-items-center" role="alert">
			<h1 class="text-white my-1">Kurs bearbeiten</h1>
			<a href="/kurs/show/${kurs.KID }" class="btn ml-auto DHBWbutton">Zurück</a>
        </div>
    	<!-- Ende Orentierungszeile -->
	
	    <!-- Start Content -->
	    <div class="dhbw_content mt-5">
	        <!-- Start Formular -->
	        <form class="pb-3 js-form-dozanleg" method="POST" action="/kurs/update/${kurs.KID }">	      
	        	
	            <div class="form-group row">
	                <label class="col-2 col-form-label">Name</label>
	                <div class="col-10">
	                	<input type="text" name="kursname" class="form-control" placeholder="Kursname eingeben" value="${kurs.name }" required>
	                </div>
	            </div>
	
	            <div class="form-group row mb-5">
	                <label class="col-2 col-form-label">Jahrgang</label>
	                <div class="col-10">
						<input type="text" name="jahrgang" class="form-control" placeholder="Kursjahrgang eingeben" value="${kurs.jahrgang }" required>	                
	                </div>
	            </div>
	            
	            <div class="form-group row">
	                <label class="col-2 col-form-label">AnzahlStudierende</label>
	                <div class="col-10">
	                	<input type="text" name="Studierendenanzahl" class="form-control" placeholder="Ihre Anzahl an Studierende eingeben" value="${kurs.anzahlStudierende }" required>
	                </div>
	            </div>
	
	            
	            <!-- Das hier übermittelt dem Server die ID von Dozenten, da diese für das Update benötigt wird -->
	            <input class="d-none" name="KID" value="${kurs.KID }">
	            
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