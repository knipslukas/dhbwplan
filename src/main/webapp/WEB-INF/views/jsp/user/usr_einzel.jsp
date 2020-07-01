<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle} ${user.displayName }">
    <template:navbar user="${currentUser}"/>


	<div class="container">
		
		<c:choose>
			<c:when test="${deleteUser eq '2'}">
				<div class="alert alert-danger alert-dismissible">
	    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>User kann nicht gelöscht werden! Er ist der einzige Administrator!</Strong>
		    	</div>
			</c:when>
			<c:when test="${deleteUser eq '1'}">
				<div class="alert alert-danger alert-dismissible">
	    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>User kann nicht gelöscht werden!</Strong> Unbekannter Fehler! Bitte den Administrator benachrichtigen
		    	</div>
			</c:when>
			<c:when test="${changePwd eq '1'}">
				<div class="alert alert-danger alert-dismissible">
	    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Passwort konnte nicht geändert werden!</Strong> Das alte Passwort war falsch
		    	</div>
			</c:when>
			<c:when test="${changePwd eq '2'}">
				<div class="alert alert-danger alert-dismissible">
	    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Passwort konnte nicht geändert werden!</Strong> Unbekannter Fehler! Bitte den Administrator benachrichtigen
		    	</div>
			</c:when>
			<c:when test="${changePwd eq '3'}">
				<div class="alert alert-danger alert-dismissible">
	    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Die beiden Passwörter stimmen nicht überein</Strong>
		    	</div>
			</c:when>
			<c:when test="${changePwd eq '0'}">
				<div class="alert alert-success alert-dismissible">
	    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    		<Strong>Das Passwort wurde erfolgreich geändert</Strong>
		    	</div>
			</c:when>
			
		</c:choose>
	
    	<!-- Start Orentierungszeile -->
	   	<div class="alert dozentuebersicht d-flex align-items-center" role="alert">
			<h1 class="text-white my-1">User Einstellungen</h1>
			<c:if test="${!error }">
				<c:choose>
					<c:when test="${!ownUser }">
			   			<button type="button" class="btn ml-auto DHBWbutton" data-toggle="modal" data-target="#deleteModal">Löschen</button>
			   			<a href="/user/show" class="btn ml-2 DHBWbutton">Zurück</a>
			   		</c:when>
			   		<c:otherwise>
			   			<a href="/user/show" class="btn ml-auto DHBWbutton">Zurück</a>
			   		</c:otherwise>
			   	</c:choose>
			</c:if>
        </div>
    	<!-- Ende Orentierungszeile -->
	
		<c:if test="${error }">
			<div class="alert alert-warning">
				<h1>Kein User gefunden</h1>
				<p>Es konnte mit dieser ID kein User gefunden werden</p>
			</div>
		</c:if>
		<c:if test="${!error }">
			<div class="row">
		    	<div class="card col-sm-12 col-md-11 col-lg-8 mx-auto doz-card">
		    		<div class="card-header text-center">
		    			<h1><i class="fas fa-user-astronaut fa-4x mb-5 mt-3"></i></h1>
		    			<h1 class="card-title"><strong>Administrator ${user.displayName}</strong></h1>
		    		</div>
		   			<div class="card-body">
		   				<div class="row text-left border border-left-0 border-right-0 border-top-0">
		   					<div class="col-6"><p><strong>Anzeigename:</strong></p></div>
		   					<div class="col-6">
		   						<p>${user.displayName }</p>
		   					</div>
		   				</div>
		   				<div class="row mt-4 text-left border border-left-0 border-right-0 border-top-0">
		   					<div class="col-6"><p><strong>E-Mail:</strong></p></div>
		   					<div class="col-6">
		   						<p><a href="mailto:${dozent.email }">${dozent.email }</a></p>
		   					</div>
		   					<div class="col-6"><p><strong>Username:</strong></p></div>
		   					<div class="col-6">
		   						<p>${user.username}</p>
		   					</div>
		   				</div>
		   				<div class="row mt-4 text-center justify-content-center">
		   					<a href="/dozent/show/${dozent.DID}" class="btn DHBWbutton">Zum Dozenteneintrag</a>
		   					<c:if test="${ownUser }">
		   						<button type="button" class="btn ml-2 DHBWbutton" data-toggle="modal" data-target="#changePasswordModal">Passwort ändern</button>
		   					</c:if>
		   				</div>
		   			</div>
		    	</div>
			</div>
		</c:if>
	    
	</div>
	
	<div class="modal" id="deleteModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body">
					<h1><strong>Achtung!</strong></h1>
					<h4>Wollen Sie wirklich den User <strong>${user.username }</strong> löschen?</h4>
				</div>
				
				<div class="modal-footer">
					<a href="/user/delete/${user.id}" class="btn btn-danger">Unwiderruflich löschen</a>
					<button type="button" class="btn DHBWbutton" data-dismiss="modal">Abbrechen</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal" id="changePasswordModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h1><strong>Passwort ändern</strong></h1>
				</div>
				<div class="modal-body">
					<form action="/user/changepwd/${user.id }" method="post" role="form" id="changepwd">
						<div class="form-group">
							<label for="pwd_old">Altes Passwort:</label>
							<input type="password" class="form-control" name="pwd_old" required>
						</div>
						<hr>
						<div class="form-group">
							<label for="pwd_1">Neues Passwort:</label>
							<input type="password" class="form-control" name="pwd_1" required>
						</div>
						<div class="form-group">
							<label for="pwd_2">Passwort wiederholen:</label>
							<input type="password" class="form-control" name="pwd_2" required>
						</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					</form>
				</div>
				
				<div class="modal-footer">
					<button type="submit" form="changepwd" class="btn btn-success ml-auto">Passwort ändern</button>
					<button type="button" class="btn DHBWbutton" data-dismiss="modal">Abbrechen</button>
				</div>
			</div>
		</div>
	</div>

</template:template>