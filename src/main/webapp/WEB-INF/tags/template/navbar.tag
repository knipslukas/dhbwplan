<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-expand-sm navigationline">
	<div class="container-fluid navigationline">
		<a class="navbar-brand navigationtext" href="#">
            <img src="${pageContext.request.contextPath}/static/images/dhbw_logo.PNG" width="auto" height="40" class="d-inline-block align-top rounded-corners" alt="">
            Planner
        </a>

        <!-- Navigationslinks -->
        <ul class="nav navbar-nav navbar-right">
        	<li class="nav-item">
                <a class="nav-link navigationlist" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link navigationlist" href="#">Kurse</a>
            </li>
            
            <li class="nav-item" style="padding-right: 10px;">
                <a class="nav-link navigationlist" href="#">Dozenten</a>
            </li>
            
			<li class="nav-item dropdown" style="padding-right: 10px;">
                <a class="nav-link dropdown-toggle navigationlist" href="#" id="navbarDropdownMenuLink" role="button"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Veranstaltungen
                </a>
	            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
	                <a class="dropdown-item navigationlist" href="#">Studienrichtungen</a>
	                <a class="dropdown-item navigationlist" href="#">Modulübersicht</a>
	                <a class="dropdown-item navigationlist" href="#">Lerneinheiten</a>
	            </div>
            </li>
            
            <li class="nav-item dropdown" style="border-left: 1px solid #cacaca; padding-left: 10px;">
                <a class="nav-link dropdown-toggle navigationlist" href="#" id="navbarDropdownMenuLink" role="button"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Manuela Benz
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item navigationlist" href="#">Platzhalter</a>
                    <a class="dropdown-item navigationlist" href="#">Account</a>
                    <a class="dropdown-item navigationlist" href="/usrlgt">Abmelden</a>
                </div>
            </li>
        </ul>

    </div>
</nav>