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
                        <button type="button" class="btn btn-primary btn-sm DHBWbutton">Dozent anlegen</button>
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
                  <td scope="col"><strong>#</strong></td>
                  <td scope="col"><strong>Nachname</strong></td>
                  <td scope="col"><strong>Vorname</strong></td>
                  <td scope="col"><strong>Email</strong></td>
                  <td scope="col"><strong>Telefon</strong></td>
                </tr>
              </thead>
              <tbody>
                <!-- Beispieleintrag --> 
                <tr>
                  <th scope="row">1</th>
                  <td>Matt</td>
                  <td>Michael</td>
                  <td>michael.matt@dhbw-mannheim.de</td>
                  <td>+49 176 123456</td>
                </tr>

              </tbody>
            </table>
    </div>
</template:template>