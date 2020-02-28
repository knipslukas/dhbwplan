<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
	<template:navbar />
	<!-- Start Orientierungszeile -->
    <div class="mx-2 mt-3">
        <div class="alert  homeleiste" role="alert">
            <div class="row">
                <!-- Orientierungstext -->
                <div class="col homeleistetext" >
                    Home
                </div>
                <!-- Hier Platz für Buttons! -->
                <div class="col" style="text-align: right;">

                </div>
            </div>
        </div>
    </div>
    <!-- Ende Orentierungszeile -->

    <!-- Start Content -->
    <div class="mx-2">
        <!-- Login Notification -->
        <div class="alert alert-success willkommensleiste" role="alert">
            Anmeldung erfolgreich! Herzlich willkommen im DHBW Planner.
        </div>
        <!-- Start Große Buttons -->
        <div class="row">
            <div class="col" style="text-align: center">
            
				<!-- Es fehlen noch zwei weitere Buttons - Design bezüglich der Karten steht noch offen wegen anorndung-->
                <button type="button" class="btn btn-outline-secondary btnTwoIcons" style="height: 300px; width: 300px;">
                    <font size="100">
                        Kurse
                        <br>
                        <i class="fas fa-graduation-cap"></i>
                    </font>
                </button>
            </div>
            <div class="col" style="text-align: center">
                <a href="dozent/getAll" class="btn btn-outline-secondary btnTwoIcons" style="height: 300px; width: 300px;">
                    <font size="100">
                        Dozenten
                        <br>
                        <i class="fas fa-chalkboard-teacher"></i>
                    </font>
                </a>
            </div>
        </div>
    </div>
</template:template>