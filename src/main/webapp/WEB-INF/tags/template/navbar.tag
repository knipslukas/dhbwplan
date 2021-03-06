<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="login" required="false"%>
<%@ attribute name="landingpage" required="false"%>
<%@ attribute name="user" required="false" type="de.amc17.dhbwplan.entity.User"%>

<nav class="navbar fixed-top navbar-expand-sm navigationline <c:if test="${!landingpage }" >nav-shadow mb-5</c:if>">
	<div class="container-fluid " >

    	<!-- Logo und Text-->

    	<a class="navbar-brand navigationtext" href="/">
            <img src="${pageContext.request.contextPath}/static/images/dhbw_logo.PNG" width="auto" height="40" class="d-inline-block align-top rounded-corners" alt="">
            Planner
        </a>

		<c:if test="${login ne  'login'}">
    	<!-- Navigationslinks -->
	        <ul class="nav navbar-nav navbar-right">
				<li class="nav-item active">
					<a class="nav-link navigationlist" href="/">Home</a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link navigationlist" href="/vorlesungsplaner">Vorlesungsplaner</a>
	            </li>
	
	            <li class="nav-item dhbw_listenpunkt" >
	                <a class="nav-link navigationlist" href="/modul">Modul</a>
	            </li>
	             <li class="nav-item dhbw_listenpunkt" >
	                <a class="nav-link navigationlist" href="/kurs">Kurse</a>
	            </li>
	             <li class="nav-item dhbw_listenpunkt" >
	                <a class="nav-link navigationlist" href="/dozent">Dozent</a>
	            </li>

	            <li class="dhbw_user nav-item dropdown">
	                <a class="nav-link dropdown-toggle navigationlist" href="#" id="navbarDropdownMenuLink" role="button"
	                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                    ${user.displayName}
	                </a>
	                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
	                	<a class="dropdown-item navigationlist" href="/user/show/${user.id }">Einstellungen</a>
	                	<div class="dropdown-divider"></div>
	                	<a class="dropdown-item navigationlist" href="/user/show">User-Verwaltung</a>
	                	<div class="dropdown-divider"></div>
	                    <a class="dropdown-item navigationlist" href="/usrlgt">Abmelden</a>
	                </div>
	            </li>
	        </ul>
        </c:if>
    </div>
</nav>
<div <c:if test="${!landingpage }" >style="margin-bottom: 6rem"</c:if>>
</div>