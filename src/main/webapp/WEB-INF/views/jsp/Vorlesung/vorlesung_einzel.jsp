<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
    <template:navbar user="${currentUser}" />


	<div class="container">
		
		<c:choose>
	    	<c:when test="${vorlesungCreated}">
		    	<div class="alert alert-success alert-dismissible">
		    		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Vorlesung erfolgreich erstellt</Strong>
		    	</div>
	    	</c:when>
	    	<c:when test="${vorlesungCreated eq false}">
	    		<div class="alert alert-danger alert-dismissible">
	    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Vorlesung konnte nicht erstellt werden</Strong>
		    	</div>
	    	</c:when>
	    </c:choose>
	    
	    <c:choose>
	    	<c:when test="${vorlesungUpdated}">
		    	<div class="alert alert-success alert-dismissible">
		    		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Vorlesung erfolgreich aktualisiert</Strong>
		    	</div>
	    	</c:when>
	    	<c:when test="${vorlesungUpdated eq false}">
	    		<div class="alert alert-danger alert-dismissible">
	    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Vorlesung konnte nicht aktualisiert werden</Strong>
		    	</div>
	    	</c:when>
	    </c:choose>
	
    	<!-- Start Orentierungszeile -->
	   	<div class="alert dozentuebersicht d-flex align-items-center" role="alert">
			<h1 class="text-white my-1">Vorlesungsansicht</h1>
			<a href="/vorlesung/edit/${vorlesung.VID}" class="btn ml-auto DHBWbutton">Bearbeiten</a>
			<button type="button" class="btn ml-2 DHBWbutton" data-toggle="modal" data-target="#deleteModal">Löschen</button>
			<a href="/vorlesung" class="btn ml-2 DHBWbutton">Zurück</a>
        </div>
    	<!-- Ende Orentierungszeile -->
    	
    	<div class="row">
	    	<div class="card col-sm-12 col-md-11 col-lg-8 mx-auto doz-card">
	    		<div class="card-header text-center">
	    			<h1><i class="fas fa-chalkboard-teacher fa-4x mb-5 mt-3"></i></h1>
	    			<h1 class="card-title"><strong>${vorlesung.name}</strong></h1>
	    				<h6 class="text-secondary">Vorlesung</h6>
	    		
	    		</div>
	   			<div class="card-body">
	   				<div class="row text-center border border-left-0 border-right-0 border-top-0">
	   					<div class="col-6"><p><strong>Name</strong></p></div>
	   					<div class="col-6">
	   						<p>${vorlesung.name}</p>
	   					</div>
	   				</div>
	   				<div class="row mt-4 text-center border border-left-0 border-right-0 border-top-0">
	   					<div class="col-6"><p><strong>ID</strong></p></div>
	   					<div class="col-6">
	   						<p>${vorlesung.VID}</p>
	   					</div>
	   					<div class="col-6"><p><strong>Vorlesungsstunden</strong></p></div>
	   					<div class="col-6">
	   						<p>${vorlesung.vorlesungsstunden}</p>
	   					</div>
	   				</div>
	   			</div>
	    	</div>
		</div>
	</div>
	
	<div class="modal" id="deleteModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body">
					<h1><strong>Achtung!</strong></h1>
					<h4>Wollen Sie wirklich die Vorlesung ${vorlesung.name } löschen?</h4>
				</div>
				
				<div class="modal-footer">
					<a href="/vorlesung/delete/${vorlesung.VID }" class="btn btn-danger">Unwiderruflich löschen</a>
					<button type="button" class="btn DHBWbutton" data-dismiss="modal">Abbrechen</button>
				</div>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/static/js/dozent.js"></script>

</template:template>