<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
    <template:navbar user="${currentUser}"/>


	<div class="container">
	
    	<!-- Start Orentierungszeile -->
	   	<div class="alert lerneinheituebersicht d-flex align-items-center" role="alert">
			<h1 class="text-white my-1">Lerneinheit anlegen</h1>
			<a href="/Lerneinheit" class="btn ml-auto DHBWbutton">Zurück</a>
        </div>
    	<!-- Ende Orentierungszeile -->
	
	    <!-- Start Content -->
	    <div class="dhbw_content mt-5">
	        <!-- Start Formular -->
	        <form class="pb-3 js-form-dozanleg" method="POST" action="/lerneinheit/add">	      
			
	            <div class="form-group row">
	                <label class="col-2 col-form-label">Präsenzzeit</label>
	                <div class="col-10">
	                	<textarea class="form-control" name="präsenzzeit" placeholder="Präsenzzeit eingeben (Stunden)"></textarea>
	                </div>
	            </div>
				
				<div class="form-group row">
	                <label class="col-2 col-form-label">Selbststudium</label>
	                <div class="col-10">
	                	<textarea class="form-control" name="selbststudium" placeholder="Selbststudium eingeben (Stunden)"></textarea>
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
	
	<script src="${pageContext.request.contextPath}/static/js/Lerneinheit.js"></script>

</template:template>