<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
    <template:navbar />
    <!-- Start Navigation -->
    <nav class="navbar navbar-expand-sm navigationline">
        <div class="container-fluid navigationline ">

            <!-- Logo und Text-->

            <a class="navbar-brand navigationtext" href="#">
                <img src="src/main/resources/static/images/dhbw_logo.PNG"
                    class="dhbw_logo d-inline-block align-top rounded-corners" alt="">
                Planner
            </a>

            <!-- Navigationslinks -->
            <ul class="nav navbar-nav navbar-right">
                <li class="nav-item active">
                    <a class="nav-link navigationlist" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link navigationlist" href="#">Kurse</a>
                </li>

                <li class="nav-item dhbw_listenpunkt">
                    <a class="nav-link navigationlist" href="#"><strong>Dozenten</strong><span
                            class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item dropdown dhbw_listenpunkt">
                    <a class="nav-link dropdown-toggle navigationlist" href="#" id="navbarDropdownMenuLink"
                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Veranstaltungen
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item navigationlist" href="#">Studienrichtungen</a>
                        <a class="dropdown-item navigationlist" href="#">Modulübersicht</a>
                        <a class="dropdown-item navigationlist" href="#">Lerneinheiten</a>
                    </div>
                </li>
                <li class="dhbw_user nav-item dropdown">
                    <a class="nav-link dropdown-toggle navigationlist" href="#" id="navbarDropdownMenuLink"
                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Manuela Benz
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item navigationlist " href="#">Platzhalter</a>
                        <a class="dropdown-item navigationlist" href="#">Account</a>
                        <a class="dropdown-item navigationlist" href="#">Abmelden</a>
                    </div>
                </li>
            </ul>

        </div>
    </nav>
    <!-- Ende Navigation -->

    <br>

    <!-- Start Orentierungszeile -->
    <div class="dhbw_orientierungszeile">
        <div class="alert  homeleiste" role="alert">
            <div class="row">
                <!-- Orientierungstext -->
                <div class="col homeleistetext">
                    Dozenten bearbeiten
                </div>
                <!-- Hier Platz für Buttons! -->
                <div class="dhbw_kursanlegen col">
                    <button type="submit" class="btn btn-primary btn-sm DHBWbutton">Zurück</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Ende Orentierungszeile -->

    <!-- Start Content -->
    <div class="dhbw_content">
        <!-- Start Formular -->
        <form>
            <div class="form-group">
                <label>Anrede</label>
                <input type="text" name="dozentAnrede" class="form-control" placeholder="Enter Anrede">
            </div>

            <div class="form-group">
                <label>Titel</label>
                <input type="text" name="dozentTitel" class="form-control" placeholder="Enter Titel">
            </div>

            <div class="form-group">
                <label>Vorname</label>
                <input type="text" name="dozentVorname " class="form-control" placeholder="Enter Vorname">
            </div>

            <div class="form-group">
                <label>Nachname</label>
                <input type="text" name="dozentName" class="form-control" placeholder="Enter Nachname">
            </div>

            <div class="form-group">
                <label>Unternehmen</label>
                <input type="text" name="dozentUnternehmen" class="form-control" placeholder="Enter Unternehmen">
            </div>

            <div class="form-group">
                <label>Straße und Hausnummer</label>
                <input type="text" name="dozentStrasse" class="form-control" placeholder="Enter Straße und Hausnummer">
            </div>

            <div class="form-group">
                <label>Postleitzahl</label>
                <input type="text" name="dozentPLZ" class="form-control" placeholder="Enter Postleitzahl">
            </div>

            <div class="form-group">
                <label>Stadt</label>
                <input type="text" name="dozentStadt" class="form-control" placeholder="Enter Stadt">
            </div>

            <div class="form-group">
                <label>E-Mail</label>
                <input type="text" name="dozentEmail" class="form-control" placeholder="Enter E-Mail">
            </div>

            <div class="form-group">
                <label>Telefonnummer</label>
                <input type="text" name="dozentTelnr" class="form-control" placeholder="Enter Telefonnummer">
            </div>

            <div class="form-group">
                <label>Unterrichtsfächer</label>
                <input type="text" name="dozentUnterrichtsfaecher" class="form-control"
                    placeholder="Enter Unterrichtsfächer">
            </div>

            <div class="form-group">
                <label>Schwerpunkte</label>
                <input type="text" name="dozentSchwerpunkte" class="form-control" placeholder="Enter Schwerpunkte">
            </div>

            <div class="dropdown">
                <label>Zeitpräferenzen</label>
                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Zeitraum
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <a class="dropdown-item navigationlist">Vormittags</a>
                    <a class="dropdown-item navigationlist">Nachmittags</a>
                    <a class="dropdown-item navigationlist">Abends</a>
                </div>
            </div>

            <div class="form-group">
                <label>Notizen</label> <br>
                <textarea class="dozentNotizen"> Hier können Sie Notizen ergänzen </textarea>
            </div>

            <!-- Final Buttons-->
            <div class="finalButtons">
                <button type="submit" class="btn btn-primary btn-sm DHBWbutton">Speichern </button>
                <button type="reset" class="btn btn-primary btn-sm DHBWbutton">Abbrechen </button>
            </div>

        </form>

        <!-- Ende Formular -->

        <!-- Ende Content -->
    </div>

</template:template>