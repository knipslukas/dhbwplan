<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
	<template:navbar user="${currentUser}" />
	
	<!-- Start Orientierungszeile -->
	<div class="container">
	   	
	   	
       	<div class="alert dozentuebersicht d-flex align-items-center" role="alert">
			<h1 class="text-white my-1">Vorlesungsplaner</h1>
        </div>
        
	    <!-- Ende Orentierungszeile -->
    
    	<div class="mt-5">
    		<h4>Kurs und Studienjahr auswählen</h4>
    		<form role="form">
    			<div class="form-row">
    				<div class="form-group col-3">
	    				<label for="sturi">Studiengang/Studienrichtung</label>
	    				<select class="js-sturi-select custom-select">
	    					<option value="0" disabled selected>Studienrichtung auswählen</option>
	    					<c:choose>
	    						<c:when test="${sturiList ne null }">
	    							<c:forEach var="sturi" items="${sturiList }">
	    								<option value="${sturi.riID }">${sturi.studiengang.name } - ${sturi.name}</option>
	    							</c:forEach>
	    						</c:when>
	    						<c:otherwise>
	    							<option disabled selected>Keine Studienrichtungen vorhanden</option>
	    						</c:otherwise>
	    					</c:choose>
	    				</select>
	    			</div>
	    			<div class="form-group col-3 d-none js-kurs-group">
	    				<label for="kurs">Kurs</label>
	    				<select class="js-kurs-select custom-select">
	    				</select>
	    			</div>
	    			<div class="form-group col-3 d-none js-jahr-group">
	    				<label for="jahr">Studienjahr</label>
	    				<select class="js-jahr-select custom-select">
	    					<option value="0">Studienjahr auswählen</option>
	    					<option value="1">1 Studienjahr</option>
	    					<option value="2">2 Studienjahr</option>
	    					<option value="3">3 Studienjahr</option>
	    				</select>
	    			</div>
	    			<div class="form-group col-3  js-jahr-group">
	    				<label for="modulkatalog">Modulkatalog</label>
	    				<select class="js-modkat-select custom-select">
	    					<option value="0">Studienjahr auswählen</option>
	    					<option value="1">1 Studienjahr</option>
	    					<option value="2">2 Studienjahr</option>
	    					<option value="3">3 Studienjahr</option>
	    				</select>
	    			</div>
    			</div>
    		</form>
		</div>
	    <!-- Start Content -->
	    <div class="mt-5">
	         <table class="table table-hover">
	              <thead class="thead-light">
	                <tr>
	                  <th scope="col"><strong>Modul</strong></th>
	                  <th scope="col"><strong>Lerneinheit</strong></th>
	                  <th scope="col"><strong>Dozent finden</strong></th>
	                </tr>
	              </thead>
	              <tbody>
	                <!-- Beispieleintrag --> 
	                <c:choose>
	                	<c:when test="${vorlesungList ne null }">
	                		<c:forEach items="${vorlesungList}" var="vorlesung">
	                			<tr>
					                <td scope="row" class="align-middle">${vorlesung.name}</td>
					                <td scope="row" class="align-middle">${vorlesung.vorlesungsstunden}</td>
					                <td scope="row" class="align-middle"><a href="/vorlesung/show/${vorlesung.VID}" class="btn btn-sm btn-secondary">Anzeigen</a></td>
				                </tr>
	                		</c:forEach>
	                	</c:when>
	                	<c:otherwise>
	                		<tr class="table-warning">
	                			<td>Keine Einträge vorhanden</td>
	                			<td></td>
	                			<td></td>
	                		</tr>
	                	</c:otherwise>
	                </c:choose>
	
	              </tbody>
	         </table>
	    </div>
	</div>
	
	<script>
		$(".js-sturi-select").change(function() {
			if ($(".js-sturi-select").val() != "0") {
				var sturiid = new Object();
				sturiid.studienrichtung_riid = $(".js-sturi-select").val();
				$.ajax({
					url: "/vorlesungsplaner/kurse/",
					type: "POST",
					contentType: "application/json",
					data: JSON.stringify(sturiid),
					success: function(result) {
						renderKurse(result);
					},
					error: function(status) {
						alert("Eingabe nicht möglich! HTTP Fehler: "+status.status);
					}
				})
			}
		})
		
		function renderKurse(result) {
			$(".js-kurs-select").html(function() {
				var list = "";
				list += '<option disabled selected value="0">Kurs auswählen</option>'
				$.each(result, function(i, kurs) {
					list += '<option value="'+kurs.kid+'">'+kurs.name+' - '+kurs.jahrgang+'</option>';
				})
				if (result != "") {
					return list;
				}
				else {
					list = "";
					list = '<option disabled selected>Es konnten keine Kurse gefunden werden</option>';
					$(".js-jahr-group").addClass("d-none");
					return list;
				}
			});
			$(".js-kurs-group").removeClass("d-none");
		}


		$(".js-kurs-select").change(function() {
			if ($(".js-kurs-select").val() != "0") {
				$(".js-jahr-group").removeClass("d-none");
			}
		})
		
		$(".js-jahr-select").change(function() {
			if ($(".js-jahr-select").val() != "0") {
				var sturiid = new Object();
				sturiid.studienrichtung_riid = $(".js-sturi-select").val();
				$.ajax({
					url: "/vorlesungsplaner/kurse/",
					type: "POST",
					contentType: "application/json",
					data: JSON.stringify(sturiid),
					success: function(result) {
						renderKurse(result);
					},
					error: function(status) {
						alert("Eingabe nicht möglich! HTTP Fehler: "+status.status);
					}
				})
			}
		})
	</script>
</template:template>