<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
    <template:navbar user="${currentUser}" />


	<div class="container">
	
    	<!-- Start Orentierungszeile -->
	   	<div class="alert dozentuebersicht d-flex align-items-center" role="alert">
			<h1 class="text-white my-1">Dozent bearbeiten</h1>
			<a href="/dozent/show/${dozent.DID }" class="btn ml-auto DHBWbutton">Zurück</a>
        </div>
    	<!-- Ende Orentierungszeile -->
	
	    <!-- Start Content -->
	    <div class="dhbw_content mt-5">
	        <!-- Start Formular -->
	        <form class="pb-3 js-form-dozanleg" method="POST" action="/dozent/update/${dozent.DID }">	      
	        	  
	            <div class="form-group row">
	                <label for="anrede" class="col-2 col-form-label">Anrede</label>
	                <div class="col-10">
		                <select class="form-control" id="anrede" name="anrede">
		                	<c:choose>
		                		<c:when test="${dozent.anrede eq 'Herr' }">
		                			<option value="Herr" selected>Herr</option>
		                			<option value="Frau">Frau</option>
		                			<option value="Divers">Divers</option>
		                		</c:when>
		                		<c:when test="${dozent.anrede eq 'Frau' }">
		                			<option value="Herr">Herr</option>
		                			<option value="Frau" selected>Frau</option>
		                			<option value="Divers">Divers</option>
		                		</c:when>
		                		<c:otherwise>
		                			<option value="Herr">Herr</option>
		                			<option value="Frau">Frau</option>
		                			<option value="Divers" selected>Divers</option>
		                		</c:otherwise>
		                	</c:choose>
		                </select>
	                </div>
	            </div>
	
	            <div class="form-group row">
	                <label class="col-2 col-form-label">Titel</label>
	                <div class="col-10">
	                	<input type="text" name="titel" class="form-control" placeholder="Titel eingeben" value="${dozent.titel }">
	            	</div>
	            </div>
	
	            <div class="form-group row">
	                <label class="col-2 col-form-label">Vorname</label>
	                <div class="col-10">
	                	<input type="text" name="vorname" class="form-control" placeholder="Vorname eingeben" value="${dozent.vorname }" required>
	                </div>
	            </div>
	
	            <div class="form-group row mb-5">
	                <label class="col-2 col-form-label">Nachname</label>
	                <div class="col-10">
						<input type="text" name="nachname" class="form-control" placeholder="Nachname eingeben" value="${dozent.nachname }" required>	                
	                </div>
	            </div>
	            
	            <div class="form-group row">
	                <label class="col-2 col-form-label">Adresse</label>
	                <div class="col-10">
	                	<input type="text" name="strassehaus" class="form-control" placeholder="Straße und Hausnummer eingeben" value="${dozent.strassehaus }" required>
	                </div>
	            </div>
	
	            <div class="form-group row">
	                <label class="col-2 col-form-label">Postleitzahl</label>
	                <div class="col-10">
	                	<input type="text" name="plz" class="form-control" placeholder="Postleitzahl eingeben" value="${dozent.plz }" required>
	                </div>
	            </div>
	            
	            <div class="form-group row mb-5">
	                <label class="col-2 col-form-label">Stadt</label>
	                <div class="col-10">
	                	<input type="text" name="stadt" class="form-control" placeholder="Stadt eingeben" value="${dozent.stadt }" required>
	                </div>
	            </div>
	
				<c:choose>
					<c:when test="${dozent.intern }">
						<div class="form-group row">
			            	<label class="col-2 col-form-label">DHBW Intern</label>
			            	<div class="col-10">
			            		<input checked class="js-toggle-intern" type="checkbox" data-toggle="toggle" data-size="sm" data-on="Ja" data-off="Nein" name="intern" data-style="mr-1" data-onstyle="danger">
			            	</div>
			            </div>
			            
			            <div class="collapse js-collapse-intern">
			            	<div class="form-group row">
				                <label class="col-2 col-form-label">Unternehmen</label>
				                <div class="col-10">
				                	<input type="text" name="unternehmen" class="form-control js-toggle-untern" placeholder="Unternehmen eingeben" value="${dozent.unternehmen }">
				                </div>
				            </div>
			            </div>
			            
			            <div class="collapse js-collapse-stuleiter show">
				            <div class="form-group row">
				            	<label class="col-2 col-form-label">Studiengangsleiter</label>
				            	<div class="col-10">
				            		<input <c:if test="${dozent.studiengangsleiter}">checked</c:if> type="checkbox" class="js-toggle-stuleiter" data-toggle="toggle" data-size="sm" data-on="Ja" data-off="Nein" name="studiengangsleiter" data-style="mr-1" data-onstyle="danger">
				            	</div>
				            </div>
			           	</div>
					</c:when>
					<c:otherwise>
						<div class="form-group row">
			            	<label class="col-2 col-form-label">DHBW Intern</label>
			            	<div class="col-10">
			            		<input class="js-toggle-intern" type="checkbox" data-toggle="toggle" data-size="sm" data-on="Ja" data-off="Nein" name="intern" data-style="mr-1" data-onstyle="danger">
			            	</div>
			            </div>
			            
			            <div class="collapse js-collapse-intern show">
			            	<div class="form-group row">
				                <label class="col-2 col-form-label">Unternehmen</label>
				                <div class="col-10">
				                	<input type="text" name="unternehmen" class="form-control js-toggle-untern" placeholder="Unternehmen eingeben" value="${dozent.unternehmen }">
				                </div>
				            </div>
			            </div>
			            
			            <div class="collapse js-collapse-stuleiter">
				            <div class="form-group row">
				            	<label class="col-2 col-form-label">Studiengangsleiter</label>
				            	<div class="col-10">
				            		<input type="checkbox" class="js-toggle-stuleiter" data-toggle="toggle" data-size="sm" data-on="Ja" data-off="Nein" name="studiengangsleiter" data-style="mr-1" data-onstyle="danger">
				            	</div>
				            </div>
			           	</div>
					</c:otherwise>
				</c:choose>
	
	            <div class="form-group row">
	                <label class="col-2 col-form-label">E-Mail</label>
	                <div class="col-10">
	                	<input type="text" name="email" class="form-control" placeholder="E-Mail eingeben" value="${dozent.email }" required>
	                </div>
	            </div>
	
	            <div class="form-group row mb-5">
	                <label class="col-2 col-form-label">Telefonnummer</label>
	                <div class="col-10">
	                	<input type="text" name="telefonnummer" class="form-control" placeholder="Telefonnummer eingeben" value="${dozent.telefonnummer }" required>
	                </div>
	            </div>
	
	            <div class="form-group row">
	                <label class="col-2 col-form-label">Schwerpunkte</label>
	                <div class="col-10">
	                	<input type="text" name="schwerpunkt" class="form-control" placeholder="Schwerpunkte eingeben" value="${dozent.schwerpunkt }">
	                </div>
	            </div>
	
	            <div class="form-group row">
	                <label for="timespaces" class="col-2 col-form-label">Zeitpräferenzen</label>
	                <div class="col-10">
	                	<select class="form-control" id="timespaces" name="zeitpraef">
		                	<c:choose>
	   							<c:when test="${dozent.zeitpraef eq 'VORMITTAG'}">
				                	<option value="VORMITTAG" selected>Vormittags</option>
				                	<option value="NACHMITTAG">Nachmittags</option>
				                	<option value="ABEND">Abends</option>
				                	<option value="NONE">Keine Vorgabe</option>
	   							</c:when>
	   							<c:when test="${dozent.zeitpraef eq 'NACHMITTAG'}">
				                	<option value="VORMITTAG">Vormittags</option>
				                	<option value="NACHMITTAG" selected>Nachmittags</option>
				                	<option value="ABEND">Abends</option>
				                	<option value="NONE">Keine Vorgabe</option>
	   							</c:when>
	   							<c:when test="${dozent.zeitpraef eq 'ABEND'}">
				                	<option value="VORMITTAG">Vormittags</option>
				                	<option value="NACHMITTAG">Nachmittags</option>
				                	<option value="ABEND" selected>Abends</option>
				                	<option value="NONE">Keine Vorgabe</option>
	   							</c:when>
	   							<c:otherwise>
				                	<option value="VORMITTAG">Vormittags</option>
				                	<option value="NACHMITTAG">Nachmittags</option>
				                	<option value="ABEND">Abends</option>
				                	<option value="NONE" selected>Keine Vorgabe</option>
	   							</c:otherwise>
	   						</c:choose>
		                </select>
	                </div>
	            </div>
	
	            <div class="form-group row">
	                <label class="col-2 col-form-label">Notizen</label>
	                <div class="col-10">
	                	<textarea class="form-control" name="notiz" placeholder="Hier können Sie Notizen ergänzen">${dozent.notiz }</textarea>
	                </div>
	            </div>
	            
	            <!-- Das hier übermittelt dem Server die ID von Dozenten, da diese für das Update benötigt wird -->
	            <input class="d-none" name="DID" value="${dozent.DID }">
	            
	            <!-- Das hier muss IMMER dazu, das hilft Spring zu erkennen, ob Angriffe auf die Übertragung stattgefunden haben oder nicht -->
	            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	
	            <!-- Final Buttons-->
	            <div class="finalButtons">
	                <button type="submit" class="btn btn-success">Speichern </button>
	                <button type="reset" class="btn btn-danger">Zurücksetzen </button>
	            </div>
				
	        </form>
	
	        <!-- Ende Formular -->
	
	        <!-- Ende Content -->
	        <!-- ab Hier kommt mein Code -->
	    </div>
	</div>
	
	<script src="${pageContext.request.contextPath}/static/js/dozent.js"></script>

</template:template>