<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
    <template:navbar user="${currentUser}" />


	<div class="container">
	
    	<!-- Start Orentierungszeile -->
	   	<div class="alert dozentuebersicht d-flex align-items-center" role="alert">
			<h1 class="text-white my-1">Kurs bearbeiten</h1>
			<a href="/kurs/show/${kurs.KID}" class="btn ml-auto DHBWbutton">Zurück</a>
        </div>
    	<!-- Ende Orentierungszeile -->
	
	    <!-- Start Content -->
	    <div class="dhbw_content mt-5">
	        <!-- Start Formular -->
	        <form class="pb-3 js-form-dozanleg" method="POST" action="/kurs/update/${kurs.KID}">	      
	        	
	             <div class="form-group row">
	                <label class="col-2 col-form-label">Name</label>
	                <div class="col-10">
						<input type="text" name="name" class="form-control" placeholder="Kursname eingeben" value="${kurs.name}" required>	                
	                </div>
	            </div>
	
	            <div class="form-group row">
	                <label class="col-2 col-form-label">Jahrgang</label>
	                <div class="col-10">
						<input type="text" name="jahrgang" class="form-control" placeholder="Kursjahrgang eingeben" value="${kurs.jahrgang}" required>	                
	                </div>
	            </div>
	            
	            <div class="form-group row">
	                <label class="col-2 col-form-label">Anzahl der Studierenden</label>
	                <div class="col-10">
						<input type="text" name="anzahlStudierende" class="form-control" placeholder="Anzahl der Studiernden eingeben" value="${kurs.anzahlStudierende}" required>	                
	                </div>
	            </div>
	            
	            
	            
	      <div class="mt-5">
	      <label class="col-2 col-form-label">Präsenzzeiträume</label>
			<table class="table table-hover">
				<thead class="thead-light">
					<tr>
							                  <th scope="col"><strong>Dozenten Nummer</strong></th>
						<th scope="col"><strong>Semester</strong></th>
						<th scope="col"><strong>Von</strong></th>
						<th scope="col"><strong>Bis</strong></th>
						<th scope="col"><strong>Aktionen</strong></th>
					</tr>
				</thead>
				<tbody>
				<!-- 	Beispieleintrag -->
					<c:choose>
						<c:when test="${przList ne null }">
							<c:forEach items="${przList}" var="prz">
								<tr>
									<td scope="row" class="align-middle">${praesenzzeitraum.semester }</td>
									<td scope="row" class="align-middle">${praesenzzeitraum.von }</td>
									<td scope="row" class="align-middle">${praesenzzeitraum.bis }</td>
									<td scope="row" class="align-middle"><a href="/prz/delete/${praesenzzeitraum.PID}" class="btn btn-sm btn-secondary">löschen</a></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="table-warning">
								<td>Keine Präsenzzeiträume vorhanden</td>
								<td></td>
								<td></td>

							</tr>
						</c:otherwise>
					</c:choose>

				</tbody>
			</table>
			
			
		</div>
	            	            
				<!--Das hier übermittelt dem Server die ID von Dozenten, da diese für das Update benötigt wird -->
	            <input class="d-none" name="KID" value="${kurs.KID }">
	            
	            <!--Das hier muss IMMER dazu, das hilft Spring zu erkennen, ob Angriffe auf die Übertragung stattgefunden haben oder nicht -->
	            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	
	            Final Buttons
	            <div class="finalButtons">
	                <button type="submit" class="btn btn-success">Speichern </button>
	                <button type="reset" class="btn btn-danger">Zurücksetzen </button>
	            </div>
	
	        </form>
	
	        <!-- Ende Formular -->
	        
	        <!-- Versuch, Präsenzzeiträume hinzuügen -->
	        
	        <form class="pb-3 js-form-dozanleg" method="POST" action="/kurs/updatePRZ/${praesenzzeitraum.PID}">
			
			<div class="form-group row">
	                <label class="col-2 col-form-label">Semester</label>
	                <div class="col-10">
						<input type="text" name="semesterNeu" class="form-control" placeholder="Neues Semester eingeben" value="${praesenzzeitraum.semester}" required>	                
	                </div>
	        </div>
	         
	        <div class="form-group row">
	                <label class="col-2 col-form-label">Von</label>
	                <div class="col-10">
						<input type="text" name="vonNeu" class="form-control" placeholder="Neues Startdatum" value="${praesenzzeitraum.von}" required>	                
	                </div>
	        </div>    
	           
	        <div class="form-group row">
	                <label class="col-2 col-form-label">Bis</label>
	                <div class="col-10">
						<input type="text" name="bisNeu" class="form-control" placeholder="Neues Enddatum" value="${praesenzzeitraum.bis}" required>	                
	                </div>
	         </div> 
	         
	         <div class="finalButtons">
	                <button type="submit" class="btn btn-success">Hinzufügen </button>
	          </div> 
	          
	          <!-- Das hier übermittelt dem Server die ID von Dozenten, da diese für das Update benötigt wird -->
              <input class="d-none" name="PID" value="${praesenzzeitraum.PID }">
              
              <!-- Das hier muss IMMER dazu, das hilft Spring zu erkennen, ob Angriffe auf die Übertragung stattgefunden haben oder nicht -->
	          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	            
			</form>
	
	        <!-- Ende Content -->
	    </div>
	</div>
	
	<script src="${pageContext.request.contextPath}/static/js/dozent.js"></script>

</template:template>