<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
    <template:navbar user="${currentUser}" />


<div class="container">
		
		<c:choose>
	    	<c:when test="${studiengangCreated}">
		    	<div class="alert alert-success alert-dismissible">
		    		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Studiengang erfolgreich erstellt</Strong>
		    	</div>
	    	</c:when>
	    	<c:when test="${studiengangCreated eq false}">
	    		<div class="alert alert-danger alert-dismissible">
	    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Studiengang konnte nicht erstellt werden</Strong>
		    	</div>
	    	</c:when>
	    </c:choose>
	    
	    <c:choose>
	    	<c:when test="${studiengangUpdated}">
		    	<div class="alert alert-success alert-dismissible">
		    		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Studiengang erfolgreich aktualisiert</Strong>
		    	</div>
	    	</c:when>
	    	<c:when test="${studiengangUpdated eq false}">
	    		<div class="alert alert-danger alert-dismissible">
	    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Studiengang konnte nicht aktualisiert werden</Strong>
		    	</div>
	    	</c:when>
	    </c:choose>
	
    	<!-- Start Orentierungszeile -->
	   	<div class="alert dozentuebersicht d-flex align-items-center" role="alert">
			<h1 class="text-white my-1">Studiengangsansicht</h1>
			<a href="/studiengang/edit/${studiengang.stID}" class="btn ml-auto DHBWbutton">Bearbeiten</a>
			<button type="button" class="btn ml-2 DHBWbutton" data-toggle="modal" data-target="#deleteModal">Löschen</button>
			<a href="/studiengang" class="btn ml-2 DHBWbutton">Zurück</a>
        </div>
    	<!-- Ende Orentierungszeile -->
    	
    	<div class="row"> 
	    	<div class="card col-sm-12 col-md-11 col-lg-8 mx-auto doz-card">
	    		<div class="card-header text-center">
	    			<h1><i class="fas fa-university fa-4x mb-5 mt-3"></i></h1>
					<h1 class="card-title"><strong>${studiengang.name}</strong></h1>
	    		
	    		</div>
	   			<div class="card-body">
	   				<div class="row text-left border border-bottom-0 border-left-0 border-right-0 border-top-0">
	   					<div class="col-6"><p><strong>Beschreibung:</strong></p></div>
	   					<div class="col-6">
							   <p>${studiengang.beschreibung}</p> <!-- wird nach Fertigstellung des Controllers durch untenstehende Zeile ersetzt-->
							   <!--<p>${studiengang.name }</p>-->
	   					</div>
	   				</div>

	    	 
	    	
	    		    	<!-- Start Content -->
	 <!--    <div class="mt-5"> -->
	<div class="mt-4"> 
	         <table class="table table-hover tab-einzel" >
	              <caption>Studiengangsrichtungen:</caption>
	              <thead class="thead-light">
	                <tr>
	                  <th scope="col"><strong>Name:</strong></th>
	                
	                </tr>
	              </thead>
	              <tbody class="js-table">
	                <!-- Beispieleintrag --> 
	                <c:choose>
	                	<c:when test="${sturiListe ne null }">
	                		<c:forEach items="${sturiListe}" var="sturiListe">
	                			<tr>
					                <td scope="row" class="align-middle">${sturiListe.name }</td>
				                </tr>
	                		</c:forEach>
	                	</c:when>
	                	<c:otherwise>
	                		<tr class="table-warning">
	                			<td>Keine Studienrichtungen vorhanden</td>
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
					<h4>Wollen Sie wirklich ${studiengang.name } löschen?</h4> <!-- wird nach Fertigstellung des Controllers durch untenstehende Zeile ersetzt-->
					<!--<h4>Wollen Sie wirklich ${studiengang.name} löschen?</h4>-->
				</div>
				
				<div class="modal-footer">
					<a href="/studiengang/delete/${studiengang.stID }" class="btn btn-danger">Unwiderruflich löschen</a> <!-- wird nach Fertigstellung des Controllers durch untenstehende Zeile ersetzt-->
					<!--<a href="/studiengang/delete/${studiengang.stID }" class="btn btn-danger">Unwiderruflich löschen</a>-->
					<button type="button" class="btn DHBWbutton" data-dismiss="modal">Abbrechen</button>
				</div>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/static/js/dozent.js"></script>



</template:template>