<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
	<template:navbar user="${currentUser}" />
	
	<!-- Start Orientierungszeile -->
	<div class="container">
	
	    <c:choose>
	    	<c:when test="${studiengangDeleted}">
		    	<div class="alert alert-success alert-dismissible">
			    	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Studiengang erfolgreich gelöscht</Strong>
	    		</div>
	    	</c:when>
	    	<c:when test="${studiengangDeleted eq false}">
	    		<div class="alert alert-danger alert-dismissible">
	    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Studiengang konnte nicht gelöscht werden</Strong>
		    	</div>
	    	</c:when>
	    	
	    	<c:when test="${studiengangCreated eq false}">
	    		<div class="alert alert-danger alert-dismissible">
	    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Studiengang konnte nicht angelegt werden</Strong>
		    	</div>
	    	</c:when>
	   	</c:choose>
	   	
	   	
       	<div class="alert dozentuebersicht d-flex align-items-center" role="alert">
			<h1 class="text-white my-1">Studiengangübersicht</h1>
			<a href="/dozent/add" class="btn ml-auto DHBWbutton">Studiengang anlegen</a>
        </div>
        
	    <!-- Ende Orentierungszeile -->
    
	
	    <!-- Start Content -->
	    <div class="mt-5">
	         <table class="table table-hover">
	              <thead class="thead-light">
	                <tr>
<!-- 	                  <th scope="col"><strong>Dozenten Nummer</strong></th> -->
	                  <th scope="col"><strong>Name</strong></th>
	                  <th scope="col"><strong>Beschreibung</strong></th>
	                  <th scope="col"><strong>Aktionen</strong></th>
	                </tr>
	              </thead>
	              <tbody>
	                <!-- Beispieleintrag --> 
	                <c:choose>
	                	<c:when test="${studiengangList ne null }">
	                		<c:forEach items="${studiengangList}" var="studiengang">
	                			<tr>
<%-- 					                <td scope="row" class="align-middle">${studiengang.STID }</td> --%>
					                <td scope="row" class="align-middle">${studiengang.name }</td>
					                <td scope="row" class="align-middle">${studiengang.beschreibung }</td>
					                <td scope="row" class="align-middle"><a href="/studiengang/show/${studiengang.STID}" class="btn btn-sm btn-secondary">Anzeigen</a></td>
				                </tr>
	                		</c:forEach>
	                	</c:when>
	                	<c:otherwise>
	                		<tr class="table-warning">
	                			<td>Kein Studiengang vorhanden</td>
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