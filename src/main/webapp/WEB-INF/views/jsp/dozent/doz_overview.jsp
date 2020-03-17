<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
	<template:navbar />
	
	<!-- Start Orientierungszeile -->
	<div class="container">
	
	    <c:choose>
	    	<c:when test="${dozentDeleted}">
		    	<div class="alert alert-success alert-dismissible">
			    	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Dozent erfolgreich gelöscht</Strong>
	    		</div>
	    	</c:when>
	    	<c:when test="${dozentDeleted eq false}">
	    		<div class="alert alert-danger alert-dismissible">
	    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Dozent konnte nicht gelöscht werden</Strong>
		    	</div>
	    	</c:when>
	    	
	    	<c:when test="${dozentCreated eq false}">
	    		<div class="alert alert-danger alert-dismissible">
	    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Dozent konnte nicht angelegt werden</Strong>
		    	</div>
	    	</c:when>
	   	</c:choose>
	   	
	   	
       	<div class="alert dozentuebersicht d-flex align-items-center" role="alert">
			<h1 class="text-white my-1">Dozentenübersicht</h1>
			<a href="/dozent/add" class="btn ml-auto DHBWbutton">Dozent anlegen</a>
        </div>
        
	    <!-- Ende Orentierungszeile -->
    
	
	    <!-- Start Content -->
	    <div class="mt-5">
	         <table class="table table-hover">
	              <thead class="thead-light">
	                <tr>
<!-- 	                  <th scope="col"><strong>Dozenten Nummer</strong></th> -->
	                  <th scope="col"><strong>Nachname</strong></th>
	                  <th scope="col"><strong>Vorname</strong></th>
	                  <th scope="col"><strong>Email</strong></th>
	                  <th scope="col"><strong>Telefon</strong></th>
	                  <th scope="col"><strong>Aktionen</strong></th>
	                </tr>
	              </thead>
	              <tbody>
	                <!-- Beispieleintrag --> 
	                <c:choose>
	                	<c:when test="${dozentList ne null }">
	                		<c:forEach items="${dozentList}" var="dozent">
	                			<tr>
<%-- 					                <td scope="row" class="align-middle">${dozent.DID }</td> --%>
					                <td scope="row" class="align-middle">${dozent.nachname }</td>
					                <td scope="row" class="align-middle">${dozent.vorname }</td>
					                <td scope="row" class="align-middle">${dozent.email }</td>
					                <td scope="row" class="align-middle">${dozent.telefonnummer }</td>
					                <td scope="row" class="align-middle"><a href="/dozent/show/${dozent.DID}" class="btn btn-sm btn-secondary">Anzeigen</a></td>
				                </tr>
	                		</c:forEach>
	                	</c:when>
	                	<c:otherwise>
	                		<tr class="table-warning">
	                			<td>Keine Dozenten vorhanden</td>
	                			<td></td>
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
	</div>
</template:template>