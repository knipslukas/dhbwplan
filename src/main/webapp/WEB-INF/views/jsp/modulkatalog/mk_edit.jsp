<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
	<template:navbar user="${currentUser}" />


	<div class="container">

		<!-- Start Orentierungszeile -->
		<div class="alert dozentuebersicht d-flex align-items-center" role="alert">
			<h1 class="text-white my-1">Modulkatalog bearbeiten</h1>
			<a href="/modulkatalog/show/${modulkatalog.MKID }" class="btn ml-auto DHBWbutton">Zurück</a>
		</div>
		<!-- Ende Orentierungszeile -->

		<!-- Start Content -->
		<div class="dhbw_content mt-5">
			<!-- Start Formular -->
			<form class="pb-3 js-form-dozanleg" method="POST" action="/modul/update/${modulmodulkatalog.MKID }">

				<div class="form-group row">
					<label class="col-2 col-form-label">Name</label>
					<div class="col-10">
						<input type="text" name="titel" class="form-control" placeholder="Bezeichnung eingeben"
							value="${modulkatalog.name}">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-2 col-form-label">Studienrichtung</label>
					<div class="col-10">
						<select class="form-control">
							<option disabled selected>Bitte Auswählen</option>
							<c:choose>
								<c:when test="${StrList ne null }">
									<c:forEach items="${StrList}" var="str">
										<option>${studienrichtung.name }</option>
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
						<input type="text" name="titel" class="form-control" placeholder="Selbsstudium eingeben"
							value="${modulkatalog.gueltigVon}">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-2 col-form-label">Gültig bis</label>
					<div class="col-10">
						<input type="text" name="titel" class="form-control" placeholder="Moduldauer eingeben"
							value="${modulkatalog.gueltigBis}">
					</div>
				</div>


				<!-- Final Buttons-->
				<div class="finalButtons">
					<button type="submit" class="btn btn-success">Speichern </button>
					<button type="reset" class="btn btn-danger">Zurücksetzen </button>
				</div>

				<h1 id="info"></h1>
			</form>


			<!-- Das hier muss IMMER dazu, das hilft Spring zu erkennen, ob Angriffe auf die Übertragung stattgefunden haben oder nicht -->
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />




			<!-- Ende Content -->
		</div>
	</div>



</template:template>