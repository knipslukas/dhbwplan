<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
	<template:navbar />
	<!-- Start Orientierungszeile -->
	<div class="container-fluid mt-5">
		       <div class="row">			
					<div class="col-sm-8 padding-0"> 
						<img src="${pageContext.request.contextPath}/static/images/dhbwBannerLandingpage.jpg" class="img-fluid" alt="">
	  				</div>
				
	  				<div class="col-sm-4 headlines d-flex justify-content-center ">
	  						<div class="landingpagewelcome align-self-center"> 
	  							<h3 class="strich"><strong> Herzlich Willkommen </strong></h3>
	  							<p>Sie befinden sich auf der Startseite <br>des DHBW Planner Tools</p>
	  							
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
			<div class="row" >
				<div class="col-2 mh-100 p-3 infobild justify-content-center d-flex">
					<img src="${pageContext.request.contextPath}/static/images/dozent.png" width="115" height="115" class="align-self-center" alt="">
				</div>
				
				<div class="col p-3 mr-3 infotext">
					<h4><strong>Dozent</strong></h4>
		    			<ul>
		    				<li>
		    					Dozent anlegen
		    				</li>
		    				<li>
		    					Dozentenübersicht
		    				</li>
		    				<li>
		    					Studiengangsleiter festlegen
		    				</li>
		    			</ul>
				
					Link zum Dozent 
				</div>
				
				<div class="col-2 mh-100 p-3 infobild justify-content-center d-flex">
					<img src="${pageContext.request.contextPath}/static/images/dhbw_logo.PNG" width="115" height="115" class="d-inline-block align-top rounded-corners img-responsive" alt="">
				</div>
				
				<div class="col p-3 infotext">
					<h4><strong>Modulkatalog</strong></h4>
		    			<ul>
		    				<li>
		    					text1
		    				</li>
		    				<li>
		    					text1
		    				</li>
		    				<li>
		    					text1
		    				</li>
		    			</ul>
				
					Text hier 1 				
				</div>
	
			</div>
			
			<div class="row pt-3" >
				<div class="col-2 mh-100 p-3 infobild justify-content-center d-flex">
					<img src="${pageContext.request.contextPath}/static/images/dhbw_logo.PNG" width="115" height="115" class="d-inline-block align-top rounded-corners img-responsive" alt="">
				</div>
				
				<div class="col p-3 mr-3 infotext">
					<h4><strong>Verwaltung</strong></h4>
		    			<ul>
		    				<li>
		    					text1
		    				</li>
		    				<li>
		    					text1
		    				</li>
		    				<li>
		    					text1
		    				</li>
		    			</ul>
				
					Text hier 1 
				</div>
				
				<div class="col-2 mh-100 p-3 infobild justify-content-center d-flex">
					<img src="${pageContext.request.contextPath}/static/images/dhbw_logo.PNG" width="115" height="115" class="d-inline-block align-top rounded-corners img-responsive" alt="">
				</div>
				
				<div class="col p-3 infotext">
					<h4><strong>Kurse</strong></h4>
		    			<ul>
		    				<li>
		    					text1
		    				</li>
		    				<li>
		    					text1
		    				</li>
		    				<li>
		    					text1
		    				</li>
		    			</ul>
				
					Text hier 1 				
				</div>
	
			</div>
			
	 </div>
    
    
 
</template:template>