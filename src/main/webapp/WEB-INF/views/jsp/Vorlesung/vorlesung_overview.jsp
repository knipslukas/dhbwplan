<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
	<template:navbar user="${currentUser}" />
	
	<!-- Start Orientierungszeile -->
	<div class="container">
	
	    <c:choose>
	    	<c:when test="${vorlesungDeleted}">
		    	<div class="alert alert-success alert-dismissible">
			    	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Vorlesung erfolgreich gelöscht</Strong>
	    		</div>
	    	</c:when>
	    	<c:when test="${vorlesungDeleted eq false}">
	    		<div class="alert alert-danger alert-dismissible">
	    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Vorlesung konnte nicht gelöscht werden</Strong>
		    	</div>
	    	</c:when>
	    	
	    	<c:when test="${vorlesungCreated eq false}">
	    		<div class="alert alert-danger alert-dismissible">
	    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Vorlesung konnte nicht angelegt werden</Strong>
		    	</div>
	    	</c:when>
	   	</c:choose>
	   	
	   	
       	<div class="alert dozentuebersicht d-flex align-items-center" role="alert">
			<h1 class="text-white my-1">Vorlesungsübersicht</h1>
			<a href="/vorlesung/add" class="btn ml-auto DHBWbutton">Vorlesung anlegen</a>
        </div>
        
	    <!-- Ende Orentierungszeile -->
    
	
	    <!-- Start Content -->
	    <div class="mt-5">
	         <table class="table table-hover">
	              <thead class="thead-light">
	                <tr>
<!-- 	                  <th scope="col"><strong>Vorlesung</strong></th> -->
	                  <th scope="col"><strong>Name</strong></th>
	                  <th scope="col"><strong>Vorlesungsstunden</strong></th>
	                  <th scope="col"><strong>Aktionen</strong></th>
	                </tr>
	              </thead>
	              <tbody>
	                <!-- Beispieleintrag --> 
	                <c:choose>
	                	<c:when test="${vorlesungList ne null }">
	                		<c:forEach items="${vorlesungList}" var="vorlesung">
	                			<tr>
<%-- 					                <td scope="row" class="align-middle">${vorlesung.VID}</td> --%>
					                <td scope="row" class="align-middle">${vorlesung.VID}</td>
					                <td scope="row" class="align-middle">${vorlesung.Name}</td>
					                <td scope="row" class="align-middle">${vorlesung.Vorlesungsstunden}</td>
					                <td scope="row" class="align-middle"><a href="/vorlesung/show/${vorlesung.VID}" class="btn btn-sm btn-secondary">Anzeigen</a></td>
				                </tr>
	                		</c:forEach>
	                	</c:when>
	                	<c:otherwise>
	                		<tr class="table-warning">
	                			<td>Keine Vorlesung vorhanden</td>
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