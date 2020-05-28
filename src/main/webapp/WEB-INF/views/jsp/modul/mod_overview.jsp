<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
	<template:navbar user="${currentUser}" />
	
	<!-- Start Orientierungszeile -->
	<div class="container">
	
	    <c:choose>
	    	<c:when test="${modulDeleted}">
		    	<div class="alert alert-success alert-dismissible">
			    	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Modul erfolgreich gelöscht</Strong>
	    		</div>
	    	</c:when>
	    	<c:when test="${modulDeleted eq false}">
	    		<div class="alert alert-danger alert-dismissible">
	    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Modul konnte nicht gelöscht werden</Strong>
		    	</div>
	    	</c:when>
	    	
	    	<c:when test="${modulCreated eq false}">
	    		<div class="alert alert-danger alert-dismissible">
	    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Modul konnte nicht angelegt werden</Strong>
		    	</div>
	    	</c:when>
	   	</c:choose>
	   	
	   	
       	<div class="alert dozentuebersicht d-flex align-items-center" role="alert">
			<h1 class="text-white my-1">Modulübersicht</h1>
			<a href="/modul/add" class="btn ml-auto DHBWbutton">Modul anlegen</a>
        </div>
        
	    <!-- Ende Orentierungszeile -->
    
	
	    <!-- Start Content -->
	    <div class="mt-5">
	         <table class="table table-hover">
	              <thead class="thead-light">
	                <tr>
<!-- 	              			<th scope="col"><strong>Modul Nummer</strong></th> -->
	                  <th scope="col"><strong>Bezeichnung</strong></th>
	                  <th scope="col"><strong>Modulart</strong></th>
	                  <th scope="col"><strong>Studienjahr</strong></th>
	                  <th scope="col"><strong>ECTS-Punkte</strong></th>
	                </tr>
	              </thead>
	              <tbody>
	                <!-- Beispieleintrag --> 
	                <c:choose>
	                	<c:when test="${modulList ne null }">
	                		<c:forEach items="${modulList}" var="modul">
	                			<tr>
<%-- 					                <td scope="row" class="align-middle">${modul.DID}</td> --%>
					                <td scope="row" class="align-middle">${modul.bezeichnung }</td>
					                <td scope="row" class="align-middle">${modul.modulart }</td>
					                <td scope="row" class="align-middle">${modul.studienjahr }</td>
					                <td scope="row" class="align-middle">${modul.ectsPunkte }</td>
					                <td scope="row" class="align-middle"><a href="/modul/show/${modul.DID}" class="btn btn-sm btn-secondary">Anzeigen</a></td>
				                </tr>
	                		</c:forEach>
	                	</c:when>
	                	<c:otherwise>
	                		<tr class="table-warning">
	                			<td>Keine Module vorhanden</td>
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