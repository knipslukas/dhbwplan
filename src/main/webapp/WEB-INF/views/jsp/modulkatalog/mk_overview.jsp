<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<template:template pageTitle="${pageTitle}">
	<template:navbar user="${currentUser}" />
	
	<!-- Start Orientierungszeile -->
	<div class="container">
	
	    <c:choose>
	    	<c:when test="${modulkatalogDeleted}">
		    	<div class="alert alert-success alert-dismissible">
			    	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Modulkatalog erfolgreich gelöscht</Strong>
	    		</div>
	    	</c:when>
	    	<c:when test="${modulkatalogDeleted eq false}">
	    		<div class="alert alert-danger alert-dismissible">
	    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Modulkatalog konnte nicht gelöscht werden</Strong>
		    	</div>
	    	</c:when>
	    	
	    	<c:when test="${modulkatalogCreated eq false}">
	    		<div class="alert alert-danger alert-dismissible">
	    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Modulkatalog konnte nicht angelegt werden</Strong>
		    	</div>
	    	</c:when>
	   	</c:choose>
	   	
	   	
       	<div class="alert dozentuebersicht d-flex align-items-center" role="alert">
			<h1 class="text-white my-1">Modulkatalogübersicht</h1>
			<a href="/modulkatalog/add" class="btn ml-auto DHBWbutton">Modulkatalog anlegen</a>
        </div>
        
	    <!-- Ende Orentierungszeile -->
    
	
	    <!-- Start Content -->
	    <div class="mt-5">
	         <table class="table table-hover">
	              <thead class="thead-light">
	                <tr>
<!-- 	                  <th scope="col"><strong>Dozenten Nummer</strong></th> -->
	                  <th scope="col"><strong>Name</strong></th>
	                  <th scope="col"><strong>Studienrichtung</strong></th>
	                  <th scope="col"><strong>Gültig von</strong></th>
	                  <th scope="col"><strong>Gültig bis</strong></th>
	                  <th scope="col"><strong>Aktionen</strong></th>
	                </tr>
	              </thead>
	              <tbody>
	                <!-- Beispieleintrag --> 
	                <c:choose>
	                	<c:when test="${modulkatalogList ne null }">
	                		<c:forEach items="${modulkatalogList}" var="modulkatalog">
	                			<tr>
<%-- 					                <td scope="row" class="align-middle">${modulkatalog.MKID}</td> --%>
					                <td scope="row" class="align-middle">${modulkatalog.name}</td>
					                <td scope="row" class="align-middle">${modulkatalog.studienrichtung.studiengang.name} - ${modulkatalog.studienrichtung.name}</td>
					                <td scope="row" class="align-middle"><fmt:formatDate type = "date" 
         											value = "${modulkatalog.gueltigVon}" /></td>
					                <td scope="row" class="align-middle"><fmt:formatDate type = "date" 
         											value = "${modulkatalog.gueltigBis}" /></td>
					                <td scope="row" class="align-middle"><a href="/modulkatalog/show/${modulkatalog.MKID}" class="btn btn-sm btn-secondary">Anzeigen</a></td>
				                </tr>
	                		</c:forEach>
	                	</c:when>
	                	<c:otherwise>
	                		<tr class="table-warning">
	                			<td>Kein Modulkatalog vorhanden</td>
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
