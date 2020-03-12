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
			<a href="/dozent/edit/${dozent.DID}" class="btn ml-auto DHBWbutton">Bearbeiten</a>
			<a href="/dozent" class="btn ml-2 DHBWbutton">Zurück</a>
        </div>
    	<!-- Ende Orentierungszeile -->
    	
    	<div class="row">
	    	<div class="card col-sm-12 col-md-11 col-lg-8 mx-auto doz-card">
	    		<div class="card-header text-center">
	    			<h1><i class="fas fa-chalkboard-teacher fa-4x mb-5 mt-3"></i></h1>
	    			<h1 class="card-title"><strong>${dozent.anrede} ${dozent.titel } ${dozent.nachname }</strong></h1>
	    		</div>
	   			<div class="card-body">
	   				<div class="row text-center border border-left-0 border-right-0 border-top-0">
	   					<div class="col-6"><p>Name</p></div>
	   					<div class="col-6">
	   						<p>${dozent.vorname } ${dozent.nachname }</p>
	   					</div>
	   				</div>
	   				<div class="row mt-4 text-center border border-left-0 border-right-0 border-top-0">
	   					<div class="col-6"><p>E-Mail</p></div>
	   					<div class="col-6">
	   						<p><a href="mailto:${dozent.email }">${dozent.email }</a></p>
	   					</div>
	   					<div class="col-6"><p>Telefon</p></div>
	   					<div class="col-6">
	   						<p>${dozent.telefonnummer }</p>
	   					</div>
	   				</div>
	   				<div class="row mt-4 text-center border border-left-0 border-right-0 border-top-0">
	   					<div class="col-6"><p>Unternehmen</p></div>
	   					<div class="col-6">
	   						<p>${dozent.unternehmen }</p>
	   					</div>
	   					<div class="col-6 doz-einzel-adresse"><p>Adresse</p></div>
	   					<div class="col-6 doz-einzel-adresse">
	   						<p>${dozent.strassehaus }</p>
	   					</div>
	   					<div class="col-6"></div>
	   					<div class="col-6">
	   						<p>${dozent.plz }, ${dozent.stadt }</p>
	   					</div>
	   				</div>
	   				<div class="row mt-4 text-center border border-left-0 border-right-0 border-top-0">
	   					<div class="col-6"><p>Schwerpunkte</p></div>
	   					<div class="col-6">
	   						<p>${dozent.schwerpunkt }</p>
	   					</div>
	   					<div class="col-6"><p>Präferenzzeitraum</p></div>
	   					<div class="col-6">
	   						<c:choose>
	   							<c:when test="${dozent.zeitpraef eq 'VORMITTAG'}">
	   								<p>Vormittags</p>
	   							</c:when>
	   							<c:when test="${dozent.zeitpraef eq 'NACHMITTAG'}">
	   								<p>Nachmittags</p>
	   							</c:when>
	   							<c:when test="${dozent.zeitpraef eq 'ABEND'}">
	   								<p>Abends</p>
	   							</c:when>
	   							<c:otherwise>
	   								<p>Keine Vorgabe</p>
	   							</c:otherwise>
	   						</c:choose>
	   					</div>
	   				</div>
	   				<div class="row mt-4 text-center">
	   					<div class="col-6"><p>Notizen</p></div>
	   					<div class="col-6">
	   						<p>${dozent.notiz }</p>
	   					</div>
	   				</div>
	   			</div>
	    	</div>
		</div>
	</div>
	
	<script src="${pageContext.request.contextPath}/static/js/dozent.js"></script>

</template:template>