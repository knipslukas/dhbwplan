<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
	<template:navbar user="${currentUser}" />
	
	<!-- Start Orientierungszeile -->
	<div class="container">
	
	    <c:choose>
	    	<c:when test="${deleteUser eq '1'}">
		    	<div class="alert alert-success alert-dismissible">
			    	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Dozent erfolgreich gelöscht</Strong>
	    		</div>
	    	</c:when>
	   	</c:choose>
	   	
	   	
       	<div class="alert dozentuebersicht d-flex align-items-center" role="alert">
			<h1 class="text-white my-1">User Übersicht</h1>
			<a href="/user/add" class="btn ml-auto DHBWbutton">User anlegen</a>
        </div>
        
	    <!-- Ende Orentierungszeile -->
    
	
	    <!-- Start Content -->
	    <div class="mt-5">
	         <table class="table table-hover">
	              <thead class="thead-light">
	                <tr>
	                  <th scope="col"><strong>Username</strong></th>
	                  <th scope="col"><strong>Anzeigename</strong></th>
	                  <th scope="col"><strong>Email</strong></th>
	                  <th scope="col"><strong>Aktionen</strong></th>
	                </tr>
	              </thead>
	              <tbody>
	                <!-- Beispieleintrag --> 
	                <c:choose>
	                	<c:when test="${userList ne null }">
	                		<c:forEach items="${userList}" var="user">
	                			<tr>
					                <td scope="row" class="align-middle">${user.username }</td>
					                <td scope="row" class="align-middle">${user.displayName }</td>
					                <td scope="row" class="align-middle">${user.email }</td>
					                <td scope="row" class="align-middle"><a href="/user/show/${user.id}" class="btn btn-sm btn-secondary">Anzeigen</a></td>
				                </tr>
	                		</c:forEach>
	                	</c:when>
	                	<c:otherwise>
	                		<tr class="table-warning">
	                			<td>Keine User vorhanden</td>
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