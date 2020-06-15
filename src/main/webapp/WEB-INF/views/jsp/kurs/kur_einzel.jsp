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
	    			<h1><i class="fas fa-chalkboard-teacher fa-4x mb-5 mt-3"></i></h1>
	    			<h1 class="card-title"><strong>${kurs.name} </strong></h1>
	    			<h6 class="text-secondary">Kurs</h6>
	    		
	    		</div>
	   			<div class="card-body">
	   				<div class="row text-center border border-left-0 border-right-0 border-top-0">
	   					<div class="col-6"><p><strong>Name</strong></p></div>
	   					<div class="col-6">
	   						<p>${kurs.name}</p>
	   					</div>
	   				</div>
	   				<div class="row mt-4 text-center border border-left-0 border-right-0 border-top-0">
	   					<div class="col-6"><p><strong>Jahrgang</strong></p></div>
	   					<div class="col-6">
	   						<p>${kurs.jahrgang}</p>
	   					</div>
	   				</div>
	   				
	   				<div class="row mt-4 text-center">
	   					<div class="col-6"><p><strong>Anzahl Studierende </strong></p></div>
	   					<div class="col-6">
	   						<p>${kurs.anzahlStudierende}</p>
	   					</div>
	   				</div>
	   				<!-- Test -->
	<div class="mt-5">
	         <table class="table table-hover">
	              <thead class="thead-light">
	                <tr>
	                  <th scope="col"><strong>Semester</strong></th>
	                  <th scope="col"><strong>Date von</strong></th>
	                  <th scope="col"><strong>Date bis</strong></th>
	                </tr>
	              </thead>
	              <tbody>
	                <!-- Beispieleintrag --> 
	                <c:choose>
	                	<c:when test="${przList ne null }">
	                		<c:forEach items="${przList}" var="praesenzzeitraum">
	                			<tr>
	                		<%-- <td scope="row" class="align-middle">${kurs.KID}</td> --%>
					                <td scope="row" class="align-middle">${praesenzzeitraum.semester }</td>
					                <td scope="row" class="align-middle">${praesenzzeitraum.Date von }</td>
					                <td scope="row" class="align-middle">${praesenzzeitraum.Date bis }</td>
				                </tr>
	                		</c:forEach>
	                	</c:when>
	                	<c:otherwise>
	                		<tr class="table-warning">
	                			<td>Kein Praesenzzeitraum vorhanden</td>
	                			<td></td>
	                			<td></td>
	                			<td></td>
	                			<td></td>

	                		</tr>
	                	</c:otherwise>
	                </c:choose>
	
	              </tbody>
	         </table>
	    </div>
	  <!-- Test abgeschlossen -->
	   			</div>
	    	</div>
		</div>
	</div>
	
	<div class="modal" id="deleteModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body">
					<h1><strong>Achtung!</strong></h1>
					<h4>Wollen Sie wirklich ${kurs.name}  löschen?</h4>
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