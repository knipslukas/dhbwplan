<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
    <template:navbar user="${currentUser}" />


	<div class="container">
		
		<c:choose>
	    	<c:when test="${kursCreated}">
		    	<div class="alert alert-success alert-dismissible">
		    		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Kurs erfolgreich erstellt</Strong>
		    	</div>
	    	</c:when>
	    	<c:when test="${kursCreated eq false}">
	    		<div class="alert alert-danger alert-dismissible">
	    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Kurs konnte nicht erstellt werden</Strong>
		    	</div>
	    	</c:when>
	    </c:choose>
	    
	    <c:choose>
	    	<c:when test="${kursUpdated}">
		    	<div class="alert alert-success alert-dismissible">
		    		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Kurs erfolgreich aktualisiert</Strong>
		    	</div>
	    	</c:when>
	    	<c:when test="${kursUpdated eq false}">
	    		<div class="alert alert-danger alert-dismissible">
	    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Kurs konnte nicht aktualisiert werden</Strong>
		    	</div>
	    	</c:when>
	    </c:choose>
	
    	<!-- Start Orentierungszeile -->
	   	<div class="alert dozentuebersicht d-flex align-items-center" role="alert">
			<h1 class="text-white my-1">Kursansicht</h1>
			<a href="/kurs/edit/${kurs.KID}" class="btn ml-auto DHBWbutton">Bearbeiten</a>
			<button type="button" class="btn ml-2 DHBWbutton" data-toggle="modal" data-target="#deleteModal">Löschen</button>
			<a href="/kurs" class="btn ml-2 DHBWbutton">Zurück</a>
        </div>
    	<!-- Ende Orentierungszeile -->
    	
    	<div class="row">
	    	<div class="card col-sm-12 col-md-11 col-lg-8 mx-auto doz-card">
	    		<div class="card-header text-center">
	    			<h1><i class="fas fa-user-graduate fa-4x mb-5 mt-3"></i></h1>
	    			<h1 class="card-title"><strong>${kurs.name} </strong></h1>
	    		
	    		</div>
	   			<div class="card-body">	   				
	   				   				
	   				<div class="row mt-4 text-left border border-left-0 border-right-0 border-top-0">
	   					<div class="col-6"><p><strong>Studienrichtung:</strong></p></div>
	   					<div class="col-6 ">
	   						<p><a href="/studiengang/show/${kurs.studienrichtung.studiengang.stID}"> ${kurs.studienrichtung.studiengang.name} - ${kurs.studienrichtung.name} </a></p>
	   					</div>
	   				</div>
	   				
	   				<div class="row mt-4 text-left border border-left-0 border-right-0 border-top-0">
	   					<div class="col-6"><p><strong>Jahrgang:</strong></p></div>
	   					<div class="col-6 ">
	   						<p>${kurs.jahrgang}</p>
	   					</div>
	   				</div>
	
					<div class="row mt-4 text-left border border-left-0 border-right-0 border-top-0">
	   					<div class="col-6"><p><strong>Studiengangsleiter:</strong></p></div>
	   					<div class="col-6 ">
	   						<p>${kurs.dozent.anrede} ${kurs.dozent.vorname} ${kurs.dozent.nachname}</p>
	   					</div>
	   				</div>
	
	   				
	   				<div class="row mt-4 text-left">
	   					<div class="col-6"><p><strong>Anzahl Studierende:</strong></p></div>
	   					<div class="col-6 ">
	   						<p>${kurs.anzahlStudierende}</p>
	   					</div>
	   				</div>
	         
	        <!-- Versuch, Präsenzzeiträume hinzuzufügen -->
	<!--        <div>
	       <label class="col-2 col-form-label">Präsenzzeiträume</label>
	       </div> -->
	      <div class="mt-4">
			<table class="table table-hover tab-einzel" >
				<caption>Präsenzzeiträume:</caption>
				<thead class="thead-light">
					<tr>
						<th scope="col"><strong>Semester:</strong></th>
						<th scope="col"><strong>Von:</strong></th>
						<th scope="col"><strong>Bis:</strong></th>
					</tr>
				</thead>
				<tbody class="js-table">
				<!-- 	Beispieleintrag -->
					<c:choose>
						<c:when test="${przListe ne null }">
							<c:forEach items="${przListe}" var="przListe">
								<tr>
									<td scope="row" class="align-middle">${przListe.semester }</td>
									<td scope="row" class="align-middle">${przListe.von }</td>
									<td scope="row" class="align-middle">${przListe.bis }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="table-warning">
								<td>Keine Präsenzzeiträume vorhanden</td>
								<td></td>
								<td></td>
								<td></td>

							</tr>
						</c:otherwise>
					</c:choose>

				</tbody>
			</table>
			
			
			
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
					<h4>Wollen Sie wirklich den Kurs ${kurs.name}  löschen?</h4>
				</div>
				
				<div class="modal-footer">
					<a href="/kurs/delete/${kurs.KID}" class="btn btn-danger">Unwiderruflich löschen</a>
					<button type="button" class="btn DHBWbutton" data-dismiss="modal">Abbrechen</button>
				</div>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/static/js/kurs.js"></script>

</template:template>