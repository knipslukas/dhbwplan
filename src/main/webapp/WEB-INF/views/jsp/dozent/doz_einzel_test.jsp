<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
    <template:navbar />


	<div class="container">
	
    	<!-- Start Orentierungszeile -->
	   	<div class="alert dozentuebersicht d-flex align-items-center" role="alert">
			<h1 class="text-white my-1">Dozentansicht</h1>
			<a href="/dozent" class="btn ml-auto DHBWbutton">Zurück</a>
        </div>
    	<!-- Ende Orentierungszeile -->
    	
    	<div class="card d-flex justify-content-center">
   			<div class="card-body">
   				<h4 class="card-title">${dozent.anrede} ${dozent.nachname }</h4>
   				<div class="row">
   					<div class="col-2"><h5>Name</h5></div>
   					<div class="col-10">
   						<p>${dozent.vorname } ${dozent.nachname }</p>
   					</div>
   				</div>
   				
   			</div>
    	</div>
	
	</div>
	
	<script src="${pageContext.request.contextPath}/static/js/dozent.js"></script>

</template:template>