<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
    <template:navbar user="${currentUser}"/>


	<div class="container">
	
		<c:choose>
			<c:when test="${addUser eq '0'}">
				<div class="alert alert-danger alert-dismissible">
	    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>User konnte nicht erstellt werden!</Strong> Unbekannter Fehler! Bitte den Administrator benachrichtigen
		    	</div>
			</c:when>
			<c:when test="${addUser eq '1'}">
				<div class="alert alert-danger alert-dismissible">
	    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Der angegebene Dozent konnte nicht gefunden werden</Strong>
		    	</div>
			</c:when>
			<c:when test="${addUser eq '2'}">
				<div class="alert alert-danger alert-dismissible">
	    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Die beiden Passwörter stimmen nicht überein</Strong>
		    	</div>
			</c:when>
		</c:choose>
		
    	<!-- Start Orentierungszeile -->
	   	<div class="alert dozentuebersicht d-flex align-items-center" role="alert">
			<h1 class="text-white my-1">User anlegen</h1>
			<a href="/user/show" class="btn ml-auto DHBWbutton">Zurück</a>
        </div>
    	<!-- Ende Orentierungszeile -->
	
	    <!-- Start Content -->
	    <div class="dhbw_content mt-5">
	        <!-- Start Formular -->
	        <form class="pb-3 js-form-dozanleg" method="POST" action="/user/add">	      
	
	            <div class="form-group row mb-5">
	                <label class="col-2 col-form-label">Username:</label>
	                <div class="col-10">
						<input type="text" name="username" class="form-control" placeholder="Username eingeben" required>	                
	                </div>
	            </div>
	            
	            <div class="form-group row mb-5">
	                <label class="col-2 col-form-label">Verknüpfter Dozent:</label>
	                <div class="col-10">
	                	<select class="form-control" id="dozent" name="dozID">
		                	<option disabled selected>Dozent auswählen</option>
		                	<c:forEach items="${dozentList}" var="dozent">
		                		<option value="${dozent.DID }">${dozent.vorname } ${dozent.nachname }</option>
		                	</c:forEach>
		                </select>
	                </div>
	            </div>
	            
	            <div class="form-group row">
	                <label class="col-2 col-form-label">Vorläufiges Passwort:</label>
	                <div class="col-10">
	                	<input type="password" name="pwd_1" class="form-control" placeholder="Passwort eingeben" required>
	                </div>
	            </div>
	
				<div class="form-group row mb-5">
	                <label class="col-2 col-form-label">Passwort wiederholen:</label>
	                <div class="col-10">
	                	<input type="password" name="pwd_2" class="form-control" placeholder="Passwort wiederholen" required>
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