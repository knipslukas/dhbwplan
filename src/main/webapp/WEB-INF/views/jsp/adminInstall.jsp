<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<template:template pageTitle="DHBW Planner | Installation">

	<template:navbar login="login" />

	<div class="container justify-content-center">
		<c:if test="${submit}">
			<h1>Super!</h1>
		<p class="mb-5">Die Einrichtung der Software war erfolgreich, Sie können sich jetzt anmelden</p>
			<a class="btn btn-success" href="/">Zur Anmeldung</a>
		</c:if>
		<c:if test="${!submit }">
			<h1>Abschließen der Installation von DHBW-Plan</h1>
			<p class="mb-5">Geben Sie hier Ihre Daten ein - Für Sie wird automatisch ein User angelegt und Sie werden als Dozent hinterlegt</p>
			<form action="/setup" method="post" role="form" class="mb-2">
				<div class="form-group">
	                <label for="anrede">Anrede</label>
	                <select class="form-control" id="anrede" name="anrede">
	                	<option disabled selected>Anrede Auswählen</option>
	                	<option value="Herr">Herr</option>
	                	<option value="Frau">Frau</option>
	                	<option value="Divers">Divers</option>
	                </select>
	            </div>
	            
				<div class="form-group">
	                <label>Vorname</label>
	         		<input type="text" name="vorname" class="form-control" placeholder="Vorname eingeben" required>
	            </div>
	
	            <div class="form-group mb-5">
	                <label>Nachname</label>
					<input type="text" name="nachname" class="form-control" placeholder="Nachname eingeben" required>	                
	            </div>
	            
	            <div class="form-group">
	                <label>Username</label>
	         		<input type="text" name="username" class="form-control" placeholder="Username eingeben" required>
	            </div>
				<div class="form-group">
					<label for="email">E-Mail</label>
					<input type="email" name="email" class="form-control" placeholder="E-Mail Adresse eingeben">
				</div>
				<div class="form-group">
					<label for="pwd">Password</label>
					<input type="password" class="form-control" name="pwd_1" placeholder="Passwort eingeben">
				</div>
				<div class="form-group mb-5">
					<label for="pwd">Password wiederholen</label>
					<input type="password" class="form-control" name="pwd_2" placeholder="Passwort wiederholen">
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<button type="submit" class="btn btn-success">Initialize</button>
				<a class="btn btn-danger" href="/">Zurück</a>
			</form>
			
		</c:if>
	</div>

</template:template>