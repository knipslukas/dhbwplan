<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
    <template:navbar user="${currentUser}" />


	<div class="container">
	
    	<!-- Start Orentierungszeile -->
	   	<div class="alert dozentuebersicht d-flex align-items-center" role="alert">
			<h1 class="text-white my-1">Studiengang bearbeiten</h1>
			<a href="/studiengang/show/${Studiengang.STID }" class="btn ml-auto DHBWbutton">Zurück</a>
        </div>
    	<!-- Ende Orentierungszeile -->
	
	    <!-- Start Content -->
	    <div class="dhbw_content mt-5">
	        <!-- Start Formular -->
	        <form class="pb-3 js-form-dozanleg" method="POST" action="/studiengang/update/${Studiengang.STID }">	      
	        	  
	           
	
	            <div class="form-group row">
	                <label class="col-2 col-form-label">Studiengang</label>
	                <div class="col-10">
	                	<input type="text" name="name" class="form-control" placeholder="Studiengangsname eingeben" value="${studiengang.name }">
	            	</div>
	            </div>
	
	            <div class="form-group row">
	                <label class="col-2 col-form-label">Beschreibung</label>
	                <div class="col-10">
	                	<input type="text" name="beschreibung" class="form-control" placeholder="Hier können Sie eine Beschreibung ergänzen" value="${studiengang.beschreibung }" required>
	                </div>
	            </div>
	
	   			<div class="form-group row">
	                <label class="col-2 col-form-label">Studienrichtung</label>
	                <div class="col-10">
	                	<input type="text" name="studienrichtung" class="form-control" placeholder="Hier bitte die Studienrichtung ergänzen" value="${studiengang.studienrichtung }" required>
	                </div>
	            </div>
	
		<div class="mt-5">
	         <table class="table table-hover">
	              <thead class="thead-light">
	                <tr>
<!-- 	                  <th scope="col"><strong>Studienrichtung Nummer</strong></th> -->
	                  <th scope="col"><strong>Studienrichtung</strong></th>
	                </tr>
	              </thead>
	           </table>
	    </div>
	            
	            <!-- Das hier übermittelt dem Server die ID von Dozenten, da diese für das Update benötigt wird -->
	            <input class="d-none" name="STID" value="${studiengang.STID }">
	            
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