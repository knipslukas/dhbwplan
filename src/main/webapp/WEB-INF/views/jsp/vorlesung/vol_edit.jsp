<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
	<template:navbar user="${currentUser}" />


	<div class="container">

		<!-- Start Orentierungszeile -->
		<div class="alert dozentuebersicht d-flex align-items-center" role="alert">
			<h1 class="text-white my-1">Vorlesung bearbeiten</h1>
			<a href="/vorlesung/show/${vorlesung.VID }" class="btn ml-auto DHBWbutton">Zurück</a>
		</div>
		<!-- Ende Orentierungszeile -->

		<!-- Start Content -->
		<div class="dhbw_content mt-5">
			<!-- Start Formular -->
			<form class="pb-3 js-form-dozanleg" method="POST" action="/vorlesung/update/${vorlesung.VID }">

				<div class="form-group row">
					<label class="col-2 col-form-label">Name</label>
					<div class="col-10">
						<input type="text" name="titel" class="form-control" placeholder="Name eingeben"
							value="${vorlesung.name}">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-2 col-form-label">Vorlesungsstunden</label>
					<div class="col-10">
						<input type="int" name="titel" class="form-control" placeholder="vorlesungsstunden eingeben"
							value="${vorlesung.vorlesungsstunden}">
					</div>
				</div>



				<!-- Final Buttons-->
				<div class="finalButtons">
					<button type="submit" class="btn btn-success">Speichern </button>
					<button type="reset" class="btn btn-danger">Zurücksetzen </button>
				</div>

				<h1 id="info"></h1>
			</form>




			<!-- Das hier übermittelt dem Server die ID von Modul, da diese für das Update benötigt wird -->
			<input type="hidden" class="js-form-mid" value="${Vorlesung.VID}">

			<!-- Das hier muss IMMER dazu, das hilft Spring zu erkennen, ob Angriffe auf die Übertragung stattgefunden haben oder nicht -->
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />



			<!-- Ende Formular -->

			<!-- Ende Content -->
		</div>
	</div>

	<script>




	</script>

</template:template>