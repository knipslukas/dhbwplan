<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
	<template:navbar user="${currentUser}" landingpage="${true }"/>
	<!-- Start Orientierungszeile -->
	<div class="container-fluid">
		       <div class="row">		
					<div class="col-sm-8 padding-0"> 
						<img src="${pageContext.request.contextPath}/static/images/dhbwBannerLandingpage.jpg" class="img-fluid" alt="">
	  				</div>
				
	  				<div class="col-sm-4 headlines d-flex justify-content-center ">
	  						<div class="landingpagewelcome align-self-center"> 
	  							<div class="centering">
	  								<div class="strich">
	  									<h3><strong> Herzlich Willkommen </strong></h3>	  	
	  								</div>	
	  							</div>
	  						<div>
	  							<p>Sie befinden sich auf der Startseite <br>des DHBW Planner Tools</p> 		
	  						</div>
	  									  							
	  						</div>
	  				</div>
	  			</div>
			</div>
	  	
  
    <!-- Ende Orentierungszeile -->
	

    <!-- Start Content -->
    <div class="infoueberschrift">
    	<h2> Wo finde ich was?</h2>
    </div>
	    <div class="container my-5">
			<div class="row pt-3" >
				<a ID="Hover_box" href="\studiengang" style="display:block" class="col-2 p-3 infobild justify-content-center d-flex">					
					<h4><i ID="Hover_Icon" class="fas fa-university fa-5x"  ></i></h4>					
				</a>
				
				<div class="col p-3 mr-3 infotext">
					<h4><strong>Studiengang</strong></h4>
		    		<ul>
		    			<li>
		    				Studiengangübersicht
		   				</li>
		   				<li>
		   					Studiengang anlegen
		   				</li>
	    				<li>
	    					Studienrichtung anlegen
	       				</li>
	    			</ul>
				</div>
				
				<a ID="Hover_box" href="\modulkatalog" style="display:block" class="col-2 p-3 infobild justify-content-center d-flex">					
					<h4><i ID="Hover_Icon" class="fas fa-book fa-5x"  ></i></h4>					
				</a>
				
				<div class="col p-3 infotext">
					<h4><strong>Modulkatalog</strong></h4>
		    		<ul>
		    			<li>
		    				Modulkatalogübersicht
		    			</li>
		    			<li>
		    				Modulkatalog anlegen
		    			</li>
		    		</ul>			
				</div> <%-- Ende des Block 2 --%>
			</div> <%-- Ende Reihe 2 --%>
			
			<div class="row pt-3" >
				<a ID="Hover_box" href="\modul" style="display:block" class="col-2 p-3 infobild justify-content-center d-flex">					
					<h4><i ID="Hover_Icon" class="fas fa-graduation-cap fa-5x"  ></i></h4>					
				</a>
				
				<div class="col p-3 mr-3 infotext">
					<h4><strong>Modul</strong></h4>
		    		<ul>
		    			<li>
		    				Modulübersicht
		   				</li>
		   				<li>
		   					Module anlegen
		   				</li>
	    				<li>
	    					Lerneinheiten anlegen
	       				</li>
	    			</ul>
				</div>
				
				<a ID="Hover_box" href="\kurs" style="display:block" class="col-2 p-3 infobild justify-content-center d-flex">					
					<h4><i ID="Hover_Icon" class="fas fa-user-graduate fa-5x"  ></i></h4>					
				</a>

				<div class="col p-3 infotext">
					<h4><strong>Kurse</strong></h4>
		    		<ul>
		    			<li>
		    				Kursübersicht
		    			</li>
		    			<li>
		    				Kurs anlegen
		    			</li>
		    			<li>
		    				Präsenzzeitraum zuweisen
		    			</li>
		    		</ul>			
				</div> <%-- Ende des Block 2 --%>
			</div> <%-- Ende Reihe 2 --%>
			
			<div class="row pt-3" >
				<a ID="Hover_box" href="\dozent" style="display:block" class="col-2 p-3 infobild justify-content-center d-flex">					
					<h4><i ID="Hover_Icon" class="fas fa-chalkboard-teacher fa-5x"  ></i></h4>					
				</a>

				<div class="col p-3 mr-3 infotext">
					<h4><strong>Dozent</strong></h4>
		    		<ul>
		    			<li>
		    				Dozentübersicht
		    			</li>
		    			<li>
		    				Dozent anlegen
		    			</li>
		    			<li>
		    				Studiengangsleiter zuweisen
		   				</li>
		   			</ul>
				</div>
				
				<a ID="Hover_box" href="\vorlesung" style="display:block" class="col-2 p-3 infobild justify-content-center d-flex">					
					<h4><i ID="Hover_Icon" class="far fa-calendar-alt fa-5x"  ></i></h4>					
				</a>

				<div class="col p-3 infotext">
					<h4><strong>Vorlesungsplaner</strong></h4>
		    		<ul>
		    			<li>
		    				Vorlesung anlegen
		    			</li>
		   				<li>
		   					Dozenten zuweisen
		   				</li>
		   				<li>
		   					Kurse zuweisen
		   				</li>
		   			</ul>			
				</div> <%-- Ende des Block 2 --%>
			</div> <%-- Ende Reihe 3 --%>	
	 </div>
    
    
 
</template:template>