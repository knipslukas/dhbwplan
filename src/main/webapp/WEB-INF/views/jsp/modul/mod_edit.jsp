<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
	<template:navbar user="${currentUser}" />


	<div class="container">

		<!-- Start Orentierungszeile -->
		<div class="alert dozentuebersicht d-flex align-items-center" role="alert">
			<h1 class="text-white my-1">Modul bearbeiten</h1>
			<a href="/modul/show/${modul.MID }" class="btn ml-auto DHBWbutton">Zurück</a>
		</div>
		<!-- Ende Orentierungszeile -->

		<!-- Start Content -->
		<div class="dhbw_content mt-5">
			<!-- Start Formular -->
			<form class="pb-3 js-form-dozanleg" method="POST" action="/modul/update/${modul.MID }">

				<div class="form-group row">
					<label class="col-2 col-form-label">Bezeichnung</label>
					<div class="col-10">
						<input type="text" name="titel" class="form-control" placeholder="Bezeichnung eingeben"
							value="${modul.bezeichnung}">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-2 col-form-label">Studienjahr</label>
					<div class="col-10">
						<input type="text" name="titel" class="form-control" placeholder="Studienjahr eingeben"
							value="${modul.studienjahr}">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-2 col-form-label">Selbststudium</label>
					<div class="col-10">
						<input type="text" name="titel" class="form-control" placeholder="Selbsstudium eingeben"
							value="${modul.selbststudium}">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-2 col-form-label">Moduldauer</label>
					<div class="col-10">
						<input type="text" name="titel" class="form-control" placeholder="Moduldauer eingeben"
							value="${modul.moduldauer}">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-2 col-form-label">Modulart</label>
					<div class="col-10">
						<input type="text" name="titel" class="form-control" placeholder="Modulart eingeben"
							value="${modul.modulart}">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-2 col-form-label">Prüfungsleistung</label>
					<div class="col-10">
						<input type="text" name="titel" class="form-control" placeholder="Prüfungsleistung eingeben"
							value="${modul.pruefungsleistung}">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-2 col-form-label">Beschreibung</label>
					<div class="col-10">
						<input type="text" name="titel" class="form-control" placeholder="Beschreibung eingeben"
							value="${modul.beschreibung}">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-2 col-form-label">Sprache</label>
					<div class="col-10">
						<input type="text" name="titel" class="form-control" placeholder="Sprache eingeben"
							value="${modul.sprache}">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-2 col-form-label">Präsenzeit</label>
					<div class="col-10">
						<input type="text" name="titel" class="form-control" placeholder="Präsenzeit eingeben"
							value="${modul.praesenzzeit}">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-2 col-form-label">ECTS Punkte</label>
					<div class="col-10">
						<input type="text" name="titel" class="form-control" placeholder="ECTS Punkte eingeben"
							value="${modul.ectsPunkte}">
					</div>
				</div>


				<!-- Lerneinheit Liste -->
				<div class="mt-5">
					<label class="col-2 col-form-label"><strong>Lerneinheiten</strong></label>
					<table class="table table-hover">
						<thead class="thead-light">
							<tr>
								<th scope="col"><strong>Name</strong></th>
								<th scope="col"><strong>Präsenzzeit</strong></th>
								<th scope="col"><strong>Selbsstudium</strong></th>
								<th scope="col"><strong>Aktionen</strong></th>
							</tr>
						</thead>
						<tbody>
							<!-- 	Beispieleintrag -->
							<c:choose>
								<c:when test="${leeList ne null }">
									<c:forEach items="${leeList}" var="lee">
										<tr>
											<td scope="row" class="align-middle">${lerneinheit.name }</td>
											<td scope="row" class="align-middle">${lerneinheit.praesenzzeit}</td>
											<td scope="row" class="align-middle">${lerneinheit.selbststudium}</td>
											<td scope="row" class="align-middle"><a
													href="/lee/delete/${lerneinheit.LEID}"
													class="btn btn-sm btn-secondary">löschen</a></td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr class="table-warning">
										<td>Keine Lerneinheiten vorhanden</td>
										<td></td>
										<td></td>
										<td></td>

									</tr>
								</c:otherwise>
							</c:choose>

						</tbody>
					</table>


				</div>


				<!-- Lerneinheit Formular -->
				<form class="pb-3 js-form-dozanleg">

					<div class="form-group row">
						<label class="col-2 col-form-label">Name</label>
						<div class="col-4">
							<input type="text" name="name" class="form-control js-form-semester" id="leeName"
								placeholder="Neuer Name eingeben" value="${lerneinheit.name}" required>
						</div>
					</div>

					<div class="form-group row">
						<label class="col-2 col-form-label">Präsenzzeit</label>
						<div class="col-4">
							<input type="text" name="von" class="form-control js-form-von" id="leePrzzeit"
								placeholder="Neues Präsenzzeit" value="${lerneinheit.praesenzzeit}" required>
						</div>
					</div>

					<div class="form-group row">
						<label class="col-2 col-form-label">Selbsstudium</label>
						<div class="col-4">
							<input type="text" name="bis" class="form-control js-form-bis" id="leeSelbsstudium"
								placeholder="Neues Selbsstudium" value="${lerneinheit.selbststudium}" required>
						</div>
					</div>

					<input type="hidden" value="${modul.MID}" class="js-form-kurs" />
					<div class="finalButtons">
						<button type="button" class="btn btn-success js-form-submit">Hinzufügen </button>
					</div>



					<!-- Das hier übermittelt dem Server die ID von Modul, da diese für das Update benötigt wird -->
					<input class="d-none" name="MID" value="${modul.MID}" id="leeMID">

					<!-- Das hier muss IMMER dazu, das hilft Spring zu erkennen, ob Angriffe auf die Übertragung stattgefunden haben oder nicht -->
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

					<!-- Final Buttons-->
					<div class="finalButtons">
						<button type="submit" class="btn btn-success">Speichern </button>
						<button type="reset" class="btn btn-danger">Zurücksetzen </button>
					</div>

					<h1 id="info"></h1>
				</form>

				<!-- Ende Formular -->

				<!-- Ende Content -->
		</div>
	</div>

	<script>
		$(".js-form-submit").click(function () {
			var lerneinheit = new Object();
			lerneinheit.MID = $("#leeMID").val();
			lerneinheit.name = $("#leeName").val();
			lerneinheit.praesenzzeit = $("#leePrzzeit").val();
			lerneinheit.selbststudium = $("#leeSelbsstudium").val();
			console.log(lerneinheit);
			$.ajax({
				url: "/modul/addLEE",
				type: "POST",
				contentType: "application/json",
				data: JSON.stringify(lerneinheit),
				success: function (result) {
					console.log(result)
					if (result === lerneinheit) {
						alert("klappt");
					}
					else {
						alert("fehler");
					}
				},
				error: function (e) {
					console.log(e)
					alert("error")
				}
			})
		});

		$(document).ready(function () {


			$.ajax('/modul/showAllLEE',
				{
					dataType: 'json', // type of response data
					timeout: 500,     // timeout milliseconds
					success: function (data, status, xhr) {   // success callback function
						console.log(data)
					},
					error: function (jqXhr, textStatus, errorMessage) { // error callback 
						console.log("error showAllLEE")
						console.log(jqXhr);
					}
				});



		});
	</script>

</template:template>