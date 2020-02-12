<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
	<template:navbar />
	<!-- Start Orientierungszeile -->
    <div class="mx-2 mt-3">
        <div class="alert  dozentuebersicht" role="alert">
                <div class="row">
                    <!-- Orientierungstext -->
                    <div class="col dozentuebersichttext">
                        Dozentenübersicht
                    </div>
                    <!-- Button "Dozent anlegen" -->
                    <div class="col" style="text-align: right;">
                        <a href="/dozent/add" class="btn btn-primary btn-sm DHBWbutton">Dozent anlegen</a>
                    </div>
                </div>
            </div>
    </div>
    <!-- Ende Orentierungszeile -->

    <!-- Start Content -->
    <div class="mx-2">
         <table class="table table-hover">
              <thead>
                <tr>
                  <td scope="col"><strong>Dozenten Nummer</strong></td>
                  <td scope="col"><strong>Nachname</strong></td>
                  <td scope="col"><strong>Vorname</strong></td>
                  <td scope="col"><strong>Email</strong></td>
                  <td scope="col"><strong>Telefon</strong></td>
                </tr>
              </thead>
              <tbody>
                <!-- Beispieleintrag --> 
                <c:choose>
                	<c:when test="${dozentList ne null }">
                		<c:forEach items="${dozentList}" var="dozent">
                			<tr>
				                <td scope="row">${dozent.DID }</td>
				                <td>${dozent.nachname }</td>
				                <td>${dozent.vorname }</td>
				                <td>${dozent.email }</td>
				                <td></td>
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
                		</tr>
                	</c:otherwise>
                </c:choose>

              </tbody>
            </table>
    </div>
</template:template>