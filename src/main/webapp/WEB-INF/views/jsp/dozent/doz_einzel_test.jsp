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
    	
    	<div class="row">
	    	<div class="card col-sm-11 col-md-9 col-lg-6 mx-auto">
	    		<div class="card-header">
	    			<i class="fa fa-user-circle-o fa-5x" aria-hidden="true"></i>
	    		</div>
	   			<div class="card-body">
	   				<h1 class="card-title"><strong>${dozent.anrede} ${dozent.nachname }</strong></h1>
	   				<div class="row">
	   					<div class="col-lg-2 col-md-4 col-sm-6"><p>Name</p></div>
	   					<div class="col-lg-10 col-md-8 col-sm-6">
	   						<p>${dozent.vorname } ${dozent.nachname }</p>
	   					</div>
	   				</div>
	   				
	   			</div>
	    	</div>
		</div>
	</div>
	
	<script src="${pageContext.request.contextPath}/static/js/dozent.js"></script>

</template:template>