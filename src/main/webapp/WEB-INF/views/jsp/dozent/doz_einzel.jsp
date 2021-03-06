<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
    <template:navbar user="${currentUser}" />


	<div class="container">
		
		<c:choose>
	    	<c:when test="${dozentCreated}">
		    	<div class="alert alert-success alert-dismissible">
		    		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Dozent erfolgreich erstellt</Strong>
		    	</div>
	    	</c:when>
	    	<c:when test="${dozentCreated eq false}">
	    		<div class="alert alert-danger alert-dismissible">
	    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Dozent konnte nicht erstellt werden</Strong>
		    	</div>
	    	</c:when>
	    </c:choose>
	    
	    <c:choose>
	    	<c:when test="${dozentUpdated}">
		    	<div class="alert alert-success alert-dismissible">
		    		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Dozent erfolgreich aktualisiert</Strong>
		    	</div>
	    	</c:when>
	    	<c:when test="${dozentUpdated eq false}">
	    		<div class="alert alert-danger alert-dismissible">
	    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Dozent konnte nicht aktualisiert werden</Strong>
		    	</div>
	    	</c:when>
	    </c:choose>
	
    	<!-- Start Orentierungszeile -->
	   	<div class="alert dozentuebersicht d-flex align-items-center" role="alert">
			<h1 class="text-white my-1">Dozentansicht</h1>
			<a href="/dozent/edit/${dozent.DID}" class="btn ml-auto DHBWbutton">Bearbeiten</a>
			<c:if test="${!dozent.studiengangsleiter}">
				<button type="button" class="btn ml-2 DHBWbutton" data-toggle="modal" data-target="#deleteModal">Löschen</button>
			</c:if>
			<a href="/dozent" class="btn ml-2 DHBWbutton">Zurück</a>
        </div>
    	<!-- Ende Orentierungszeile -->
    	
    	<div class="row">
	    	<div class="card col-sm-12 col-md-11 col-lg-8 mx-auto doz-card">
	    		<div class="card-header text-center">
	    			<h1><i class="fas fa-chalkboard-teacher fa-4x mb-5 mt-3"></i></h1>
	    			<h1 class="card-title"><strong>${dozent.anrede} ${dozent.titel } ${dozent.nachname }</strong></h1>
	    			<c:if test="${dozent.studiengangsleiter}">
	    				<h6 class="text-secondary">Studiengangsleiter</h6>
	    			</c:if>
	    		
	    		</div>
	   			<div class="card-body">
	   				<div class="row text-left border border-left-0 border-right-0 border-top-0">
	   					<div class="col-6"><p><strong>Name:</strong></p></div>
	   					<div class="col-6 ">
	   						<p>${dozent.vorname } ${dozent.nachname }</p>
	   					</div>
	   				</div>
	   				<div class="row mt-4 text-left border border-left-0 border-right-0 border-top-0">
	   					<div class="col-6"><p><strong>E-Mail:</strong></p></div>
	   					<div class="col-6 ">
	   						<p><a href="mailto:${dozent.email }">${dozent.email }</a></p>
	   					</div>
	   					<div class="col-6"><p><strong>Telefon:</strong></p></div>
	   					<div class="col-6 ">
	   						<p>${dozent.telefonnummer }</p>
	   					</div>
	   				</div>
	   				<div class="row mt-4 text-left border border-left-0 border-right-0 border-top-0">
	   					<div class="col-6"><p><strong>Unternehmen:</strong></p></div>
	   					<div class="col-6 ">
	   						<p>${dozent.unternehmen }</p>
	   					</div>
	   					<div class="col-6 doz-einzel-adresse"><p><strong>Adresse:</strong></p></div>
	   					<div class="col-6 doz-einzel-adresse ">
	   						<p>${dozent.strassehaus }</p>
	   					</div>
	   					<div class="col-6"></div>
	   					<div class="col-6 ">
	   						<p>${dozent.plz } ${dozent.stadt }</p>
	   					</div>
	   				</div>
	   				<div class="row mt-4 text-left border border-left-0 border-right-0 border-top-0">
	   					<div class="col-6"><p><strong>Schwerpunkte:</strong></p></div>
	   					<div class="col-6 ">
	   						<p>${dozent.schwerpunkt }</p>
	   					</div>
	   					<div class="col-6"><p><strong>Präferenzzeitraum:</strong></p></div>
	   					<div class="col-6 ">
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
	   				<div class="row mt-4 text-left">
	   					<div class="col-6"><p><strong>Notizen: </strong></p></div>
	   					<div class="col-6" >
	   						<p>${dozent.notiz }</p>
	   					</div>
	   				</div>
	   				<div class="mt-4">
						<table class="table table tab-einzel">
							<caption> Lerneinheiten: </caption>
							<thead class="thead-light">
								<tr>
									<th scope="col"><strong>Modul:</strong></th>
									<th scope="col"><strong>Lerneinheit:</strong></th>
								</tr>
							</thead>
							<tbody class="js-table">
								<c:choose>
									<c:when test="${not empty dozent.kannhalten}">
										<c:forEach items="${dozent.kannhalten}" var="lee">
											<tr>
												<td scope="row" class="align-middle">${lee.modul.bezeichnung}</td>
												<td scope="row" class="align-middle">${lee.name }</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr class="table-warning">
											<td>Keine Lerneinheiten vorhanden</td>
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
					<h4>Wollen Sie wirklich ${dozent.anrede } ${dozent.nachname } aus dem System entfernen?</h4>
				</div>
				
				<div class="modal-footer">
					<a href="/dozent/delete/${dozent.DID }" class="btn btn-danger">Unwiderruflich löschen</a>
					<button type="button" class="btn DHBWbutton" data-dismiss="modal">Abbrechen</button>
				</div>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/static/js/dozent.js"></script>

</template:template>