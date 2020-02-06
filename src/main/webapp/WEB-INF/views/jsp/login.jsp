<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
<template:navbar />

<div class="container" >
	<div class="alert  orientierungsbox" role="alert">
	    <div class="row">
	        <!-- Orientierungstext-->
	        <div class="col">
	            DHBW Planner - Login
	            <!-- Anmeldeformular -->
	            <div>
	            	<c:if test="${param.error != null}">        
			            <p class="text-danger">Benutzername oder Passwort falsch!</p>
			        </c:if>
			        <c:if test="${param.logout != null}">       
			            <p class="text-success">Sie wurden erfolgreich abgemeldet</p>
			        </c:if>	
	                <form method="POST" action="/login">
						<div class="form-group">
						  	<input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter-Adresse">
							<small id="emailHelp" class="form-text text-muted">Bitte nutzen Sie Ihre DHBW-Mailadresse</small>
						</div>
						<div class="form-group">
						    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Passwort">
						    <small id="passwordHelp" class="form-text text-muted">Geben Sie Ihr Passwort niemals an Dritte weiter</small>
						</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<button type="submit" class="btn btn-primary DHBWbutton">Login</button>
	                </form>
	            </div>
	        </div>   
	        <!-- Hilfstext-->                       
            <div class="col">
                <p/><h3>Herzlich Willkommen </h3><p>bei Ihrem Organisationstool der DHBW Mannheim. Hier können Sie sich anmelden.</p>
            </div>
	    </div>
    </div>
</div>
	
</template:template>