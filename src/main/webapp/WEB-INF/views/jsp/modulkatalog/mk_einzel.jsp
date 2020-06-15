<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<template:template pageTitle="${pageTitle}">
    <template:navbar user="${currentUser}" />


	<div class="container">
		
		<c:choose>
	    	<c:when test="${modulkatalogCreated}">
		    	<div class="alert alert-success alert-dismissible">
		    		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Modulkatalog erfolgreich erstellt</Strong>
		    	</div>
	    	</c:when>
	    	<c:when test="${modulkatalogCreated eq false}">
	    		<div class="alert alert-danger alert-dismissible">
	    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Modulkatalog konnte nicht erstellt werden</Strong>
		    	</div>
	    	</c:when>
	    </c:choose>
	    
	    <c:choose>
	    	<c:when test="${modulkatalogUpdated}">
		    	<div class="alert alert-success alert-dismissible">
		    		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Modulkatalog erfolgreich aktualisiert</Strong>
		    	</div>
	    	</c:when>
	    	<c:when test="${modulkatalogUpdated eq false}">
	    		<div class="alert alert-danger alert-dismissible">
	    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Modulkatalog konnte nicht aktualisiert werden</Strong>
		    	</div>
	    	</c:when>
	    </c:choose>
	
    	<!-- Start Orentierungszeile -->
	   	<div class="alert dozentuebersicht d-flex align-items-center" role="alert">
			<h1 class="text-white my-1">Modulkatalogansicht</h1>
			<a href="/modul/edit/${modulkatalog.MKID}" class="btn ml-auto DHBWbutton">Bearbeiten</a>
			<button type="button" class="btn ml-2 DHBWbutton" data-toggle="modal" data-target="#deleteModal">Löschen</button>
			<a href="/modulkatalog" class="btn ml-2 DHBWbutton">Zurück</a>
        </div>
    	<!-- Ende Orentierungszeile -->
    	
    	<div class="row">
	    	<div class="card col-sm-12 col-md-11 col-lg-8 mx-auto doz-card">
	    		<div class="card-header text-center">
	    			<h1><i class="fas fa-chalkboard-teacher fa-4x mb-5 mt-3"></i></h1>
	    			<h1 class="card-title"><strong>${modulkatalog.name}</strong></h1>
	   			</div>
	    	
	    	<div class="card-body">
	   			<div class="row text-center border border-left-0 border-right-0 border-top-0">
	   				<div class="col-6"><p><strong>Gültig von:</strong></p></div>
	   				<div class="col-6">
	   					<p><fmt:formatDate type = "date" 
         					value = "${modulkatalog.gueltigVon}" /></p>
	   				</div>
	   			</div>
	   			<div class="row mt-4 text-center border border-left-0 border-right-0 border-top-0">
	   				<div class="col-6"><p><strong>Gültig bis:</strong></p></div>
	   				<div class="col-6">
	   					<p><fmt:formatDate type = "date" 
         					value = "${modulkatalog.gueltigBis}" /></p>
	   				</div>

	   			</div>
	    	</div>
		
	</div>
	</div>
	<!-- ---------------------------------------------------------------------------------------------- -->
 <div class="mt-5">
	      <label class="col-2 col-form-label"><font size="5">Module</font></label>
			<table class="table table-hover" STYLE="margin-bottom: 50px;">
				<thead class="thead-light">
					<tr>
						<th scope="col"><strong>Name</strong></th>
						<th scope="col"><strong>Beschreibung</strong></th>
						<th scope="col"><strong>Pruefungsleistung</strong></th>
					</tr>
				</thead>
				<tbody class="js-table">
				<!-- 	Beispieleintrag -->
					<c:choose>
						<c:when test="${ModulList ne null } ne null }">
							<c:forEach items="${ModulList}" var="modul">
								<tr>
									<td scope="row" class="align-middle">${modul.bezeichnung }</td>
									<td scope="row" class="align-middle">${modul.beschreibung }</td>
									<td scope="row" class="align-middle">${modul.pruefungsleistung }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="table-warning">
								<td>Keine Module vorhanden</td>
								<td></td>
								<td></td>
								<td></td>

							</tr>
						</c:otherwise>
					</c:choose>

				</tbody>
			</table>
			
			
			
		</div>
	       
	<!-- 	---------------------------------------------------------------------- -->
	<div class="modal" id="deleteModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body">
					<h1><strong>Achtung!</strong></h1>
					<h4>Wollen Sie wirklich das Modul ${modulkatalog.name} löschen?</h4>
				</div>
				
				<div class="modal-footer">
					<a href="/modul/delete/${modulkatalog.MKID}" class="btn btn-danger">Unwiderruflich löschen</a>
					<button type="button" class="btn DHBWbutton" data-dismiss="modal">Abbrechen</button>
				</div>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/static/js/dozent.js"></script>

</template:template>