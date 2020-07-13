<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
	<template:navbar user="${currentUser}" />
	
	<!-- Start Orientierungszeile -->
	<div class="container">
	   	
	   	
       	<div class="alert dozentuebersicht d-flex align-items-center" role="alert">
			<h1 class="text-white my-1">Dozenten für: ${kurs.name } - ${lerneinheit.name}</h1>
			<a href="/vorlesungsplaner" class="btn ml-2 DHBWbutton ml-auto">Zurück</a>
        </div>
        
	    <!-- Ende Orentierungszeile -->
    
    	<!-- Start Content -->
	    <div class="mt-5">
	 	   <table class="table table-hover">
	              <thead class="thead-light">
	                <tr>
	                  <th scope="col"><strong>Name</strong></th>
	                  <th scope="col"><strong>E-Mail Adresse</strong></th>
	                  <th scope="col"><strong>Aktion</strong></th>
	                </tr>
	              </thead>
	              <tbody class="js-modul-table">
	              		<c:forEach items="${dozentList }" var="dozent">
	              			<tr>
	              				<td>${dozent.vorname } ${dozent.nachname }</td>
	              				<td>${dozent.email }</td>
	              				<td><button type="button" class="btn btn-secondary btn-sm" onClick="openModal('${dozent.anrede}', '${dozent.nachname }', '${dozent.email }')">Anschreiben</button></td>
	              			</tr>
	              		</c:forEach>
	              </tbody>
	         </table>
	    </div>
	</div>
	
	<div class="modal" id="message">
	  <div class="modal-dialog modal-lg" style="height:90%">
	    <div class="modal-content" style="height:90%">
	      <div class="modal-header">
	        <h4 class="modal-title">Anschreiben</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	      <div class="modal-body">
	        <textarea class="js-message form-control" style="height:90%">
	        	
	        </textarea>
	      </div>
	      <div class="modal-footer">
	      	<a class="btn btn-primary js-send">E-Mail senden</a>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Schließen</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script>
		function openModal(anrede, name, email) {
			$(".js-message").html(function() {
				var text = "";
				if (anrede === "Herr") {
					text += "Sehr geehrter Herr "+name+",";
				}
				else if (anrede === "Frau") {
					text += "Sehr geehrte Frau "+name+",";
				}
				else {
					text += "Sehr geehrt* "+name+",";
				}
				text += "\n\nWürden Sie für den Kurs ${kurs.name} die Vorlesungen für ${modul.bezeichnung} - ${lerneinheit.name} übernehmen?  \n\n";
				text += "Der Zeitraum wäre von HIER ZEITRAUM EINFÜGEN\n\n";
				text += "Bitte geben Sie mir entsprechend Rückmeldung ob wir mit Ihnen in diesem Zeitraum planen können. Bei Rückfragen stehe ich Ihnen gerne zur Seite.\n";
				text += "Im Voraus schon einmal vielen Dank für Ihre Rückmeldung\n\n";
				text += "Mit freundlichen Grüßen,\n\n";
				text += "${currentUser.displayName}";

				$(".js-send").attr("href", function() {
					var mail = "mailto:"+email;
					mail += "?body="+encodeURI(text);
					mail += "&subject="+encodeURI("Anfrage für Vorlesungen");
					return mail;
				})
				
				return text;
			});
			$("#message").modal();
		}
	</script>
	
</template:template>