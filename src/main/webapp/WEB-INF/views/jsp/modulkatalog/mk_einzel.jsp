<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
    <template:navbar user="${currentUser}" />


	<div class="container">
		
		<c:choose>
	    	<c:when test="${modulCreated}">
		    	<div class="alert alert-success alert-dismissible">
		    		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Modul erfolgreich erstellt</Strong>
		    	</div>
	    	</c:when>
	    	<c:when test="${modulCreated eq false}">
	    		<div class="alert alert-danger alert-dismissible">
	    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Modul konnte nicht erstellt werden</Strong>
		    	</div>
	    	</c:when>
	    </c:choose>
	    
	    <c:choose>
	    	<c:when test="${modulUpdated}">
		    	<div class="alert alert-success alert-dismissible">
		    		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Modul erfolgreich aktualisiert</Strong>
		    	</div>
	    	</c:when>
	    	<c:when test="${modulUpdated eq false}">
	    		<div class="alert alert-danger alert-dismissible">
	    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Modul konnte nicht aktualisiert werden</Strong>
		    	</div>
	    	</c:when>
	    </c:choose>
	
    	<!-- Start Orentierungszeile -->
	   	<div class="alert dozentuebersicht d-flex align-items-center" role="alert">
			<h1 class="text-white my-1">Modulansicht</h1>
			<a href="/modul/edit/${modul.m_ID}" class="btn ml-auto DHBWbutton">Bearbeiten</a>
			<button type="button" class="btn ml-2 DHBWbutton" data-toggle="modal" data-target="#deleteModal">Löschen</button>
			<a href="/modul" class="btn ml-2 DHBWbutton">Zurück</a>
        </div>
    	<!-- Ende Orentierungszeile -->
    	
    	<div class="row">
	    	<div class="card col-sm-12 col-md-11 col-lg-8 mx-auto doz-card">
	    		<div class="card-header text-center">
	    			<h1><i class="fas fa-chalkboard-teacher fa-4x mb-5 mt-3"></i></h1>
	    			<h1 class="card-title"><strong>${modul.modulbezeichnung}</strong></h1>
	    		
	    		</div>
	   			<div class="card-body">
	   				<div class="row text-center border border-left-0 border-right-0 border-top-0">
	   					<div class="col-6"><p><strong>Semester</strong></p></div>
	   					<div class="col-6">
	   						<p>${modul.semester}. Semester </p>
	   					</div>
	   					<div class="col-6"><p><strong>ECTS-Punkte</strong></p></div>
	   					<div class="col-6">
	   						<p>${modul.ectsPunkte} Punkte </p>
	   					</div>
	   				</div>
	   				<div class="row mt-4 text-center border border-left-0 border-right-0 border-top-0">
	   					<div class="col-6"><p><strong>Präsenzzeit</strong></p></div>
	   					<div class="col-6">
	   						<p>${modul.präsenzzeit} Unterrichtseinheiten</p>
	   					</div>
	   					<div class="col-6"><p><strong>Selbststudium</strong></p></div>
	   					<div class="col-6">
	   						<p>${modul.selbststudium} Unterrichtseinheiten</p>
	   					</div>
	   					<div class="col-6"><p><strong>Moduldauer</strong></p></div>
	   					<div class="col-6">
	   						<p>${modul.moduldauer} Unterrichtseinheiten</p>
	   					</div>
	   				</div>
	   				<div class="row mt-4 text-center border border-left-0 border-right-0 border-top-0">
	   					<div class="col-6"><p><strong>Modulart</strong></p></div>
	   					<div class="col-6">
	   						<p>${modul.modulart}</p>
	   					</div>
	   					<div class="col-6"><p><strong>Prüfungsleistungen</strong></p></div>
	   					<div class="col-6">
	   						<p>${modul.prüfungsleistungen}</p>
	   					</div>
	   				</div>
	   				<div class="row mt-4 text-center border border-left-0 border-right-0 border-top-0">
	   					<div class="col-6"><p><strong>Beschreibung</strong></p></div>
	   					<div class="col-6">
	   						<p>${modul.beschreibung }</p>
	   					</div>
	   					<div class="col-6"><p><strong>Sprache</strong></p></div>
	   					<div class="col-6">
	   						<p>${modul.sprache}</p>
						</div>
					</div>
					<div class="row mt-4 text-center border border-left-0 border-right-0 border-top-0">				
						<table class="table table-hover">
							<thead class="thead-light">
							  <tr>
								<th scope="col"><strong>Name</strong></th>
								<th scope="col"><strong>Präsenzzeit</strong></th>
								<th scope="col"><strong>Selbststudium</strong></th>
								<th scope="col"><strong>Aktionen</strong></th>
							  </tr>
							</thead>
							<tbody>
							  <c:choose>
								  <c:when test="${modul.lerneinheiten ne null }">
									  <c:forEach items="${modulkatalogList}" var="lerneinheit">
										  <tr>
										  <%--<td scope="row" class="align-middle">${lerneinheit.name</td>--%>
											  <td scope="row" class="align-middle">${lerneinheit.präsenzzeit}</td>
											  <td scope="row" class="align-middle">${lerneinheit.selbststudium}</td>
											  <td scope="row" class="align-middle">${modulkatalog.gueltigBis }</td>
											  <td scope="row" class="align-middle"><a href="/lerneinheit/show/${lerneinheit.LEID}" class="btn btn-sm btn-secondary">Anzeigen</a></td>
										  </tr>
									  </c:forEach>
								  </c:when>
								  <c:otherwise>
									  <tr class="table-warning">
										  <td>Keine Lerneinheit vorhanden</td>
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
					<h4>Wollen Sie wirklich das Modul ${modul.modulbezeichnung} löschen?</h4>
				</div>
				
				<div class="modal-footer">
					<a href="/modul/delete/${modul.m_ID}" class="btn btn-danger">Unwiderruflich löschen</a>
					<button type="button" class="btn DHBWbutton" data-dismiss="modal">Abbrechen</button>
				</div>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/static/js/dozent.js"></script>

</template:template>