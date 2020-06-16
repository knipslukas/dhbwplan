<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



<template:template pageTitle="${pageTitle}">
	<template:navbar user="${currentUser}" />


	<div class="container">

		<!-- Start Orentierungszeile -->
		<div class="alert dozentuebersicht d-flex align-items-center"
			role="alert">
			<h1 class="text-white my-1">Modulkatalog anlegen</h1>
			<a href="/modulkatalog" class="btn ml-auto DHBWbutton">Zurück</a>
		</div>
		<!-- Ende Orentierungszeile -->

		<!-- Start Content -->
		<div class="dhbw_content mt-5">
			<!-- Start Formular -->
			<form class="pb-3 js-form-dozanleg" method="POST"
				action="/modulkatalog/add">


				<div class="form-group row">
					<label class="col-2 col-form-label">Name</label>
					<div class="col-10">
						<input type="text" name="name" class="form-control"
							placeholder="Name eingeben" required>
					</div>
				</div>

				<div class="form-group row">
					<label class="col-2 col-form-label">Studienrichtung</label>
					<div class="col-10">
						<select class="form-control" name="studienrichtung_riid" required>
							<option disabled selected>Bitte Auswählen</option>
							<c:choose>
								<c:when test="${studiengangList ne null && studienrichtungList ne null}">
									<c:forEach items="${studiengangList}" var="stg">
										<c:forEach items="${studienrichtungList}" var="str">
											<c:choose>
												<c:when test="${stg.stID eq str.studiengang.stID}">
													<option value="${str.riID}">${stg.name} - ${str.name}</option>
												</c:when> 
											</c:choose>
										</c:forEach>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<option disabled>Keine Richtungen vorhanden</option>
								</c:otherwise>
							</c:choose>
						</select>
					</div>
				</div>


				<div class="form-group row">
					<label class="col-2 col-form-label">Gültig von</label>
					<div class="col-10">
						<input type="date" name="gueltigVon" class="form-control"
							placeholder="Gueltig ab" required>
					</div>
				</div>

				<div class="form-group row">
					<label class="col-2 col-form-label">Gültig bis</label>
					<div class="col-10">
						<input type="date" name="gueltigBis" class="form-control"
							placeholder="Gueltig bis" required>
					</div>
				</div>


				<!-- Das hier muss IMMER dazu, das hilft Spring zu erkennen, ob Angriffe auf die Übertragung stattgefunden haben oder nicht -->
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />

				<!-- Final Buttons-->
				<div class="finalButtons">
					<button type="submit" class="btn btn-success">Speichern</button>
					<button type="reset" class="btn btn-danger">Zurücksetzen</button>
				</div>

			</form>

			<!-- Ende Formular -->

			<!-- Ende Content -->
		</div>
	</div>
	
	<script>
	
		

	

	<script src="${pageContext.request.contextPath}/static/js/dozent.js"></script>

</template:template>