<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
    <template:navbar user="${currentUser}" />


	<div class="container">
	
    	<!-- Start Orentierungszeile -->
	   	<div class="alert dozentuebersicht d-flex align-items-center" role="alert">
			<h1 class="text-white my-1">Studiengang bearbeiten</h1>
			<a href="/studiengang/show/${studiengang.stID }" class="btn ml-auto DHBWbutton">Zurück</a>
        </div>
    	<!-- Ende Orentierungszeile -->
	
	    <!-- Start Content -->
	    <div class="dhbw_content mt-5">
	        <!-- Start Formular -->
	        <form class="pb-3 js-form-dozanleg" method="POST" action="/studiengang/update/${studiengang.stID }">	      
	        	  
	           
	
	            <div class="form-group row">
	                <label class="col-2 col-form-label">Studiengang</label>
	                <div class="col-10">
	                	<input type="text" name="name" class="form-control" placeholder="Studiengangsname eingeben" value="${studiengang.name }">
	            	</div>
	            </div>
	
	            <div class="form-group row">
	                <label class="col-2 col-form-label">Beschreibung</label>
	                <div class="col-10">
	                	<input type="text" name="beschreibung" class="form-control" placeholder="Hier können Sie eine Beschreibung ergänzen" value="${studiengang.beschreibung }" required>
	                </div>
	            </div>
	
	   			
	
	
	            <!-- Das hier übermittelt dem Server die ID von Dozenten, da diese für das Update benötigt wird -->
	            <input class="d-none" name="STID" value="${studiengang.stID }">
	            
	            
	            <!-- Das hier muss IMMER dazu, das hilft Spring zu erkennen, ob Angriffe auf die Übertragung stattgefunden haben oder nicht -->
	            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	
	            <!-- Final Buttons-->
	            <div class="finalButtons">
	                <button type="submit" class="btn btn-success">Speichern </button>
	                <button type="reset" class="btn btn-danger">Zurücksetzen </button>
	            </div>
	
	        </form>
		
	        <!-- Ende Formular -->
	        
	        <!-- Versuch, Studienrichtung hinzuzufügen -->
	        
	      <div class="mt-5">
	    
			<table class="table table-hover">
				<thead class="thead-light">
					<tr>
						<th scope="col"><strong>Studienrichtung</strong></th>
						<th scope="col"><strong>Studienrichtungnummer</strong></th>
						
					</tr>
				</thead>
				<tbody>
				<!-- 	Beispieleintrag -->
					<c:choose>
						<c:when test="${przList ne null }">
							<c:forEach items="${przList}" var="prz">
								<tr>
									<td scope="row" class="align-middle">${studienrichtung.name }</td>
									<td scope="row" class="align-middle">${studienrichtung.riID }</td>
									
									
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="table-warning">
								<td>Keine Studienrichtungen vorhanden</td>
								<td></td>
								<td></td>
								<td></td>

							</tr>
						</c:otherwise>
					</c:choose>

				</tbody>
			</table>
			
			
		</div>
	        
<!-- 	       Studienrichtung Formular -->
	       <form class="pb-3 js-form-dozanleg">
	        <div class="form-group row">
	                <label class="col-2 col-form-label">Studienrichtung</label>
	                <div class="col-4">
						<input type="text" name="semester" class="form-control js-form-semester" placeholder="Studienrichtung eingeben" value="${studienrichtung.name}" required>	                
	                </div>
	        </div>
	         
	       
	         <input type ="hidden" value="${studiengang.stID}" class="js-form-kurs"/>
	         <div class="finalButtons">
	                <button type="button" class="btn btn-success js-form-submit">Hinzufügen </button>
	          </div> 
	          
             
              <!-- Das hier muss IMMER dazu, das hilft Spring zu erkennen, ob Angriffe auf die Übertragung stattgefunden haben oder nicht -->
	          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	            
			</form>
	
	        <!-- Ende Content -->
	    </div>
	</div>
	
	<script>
	$(".js-form-submit").click(function(){
		var studienrichtung = new Object();
		studienrichtung.riID = $(".js-form-kurs").val();
		studienrichtung.name = $(".js-form-semester").val();
		
		console.log(studienrichtung);
		$.ajax({
			url: "/studiengang/addSturi",
			type: "POST",
		    contentType: "application/json",
		    data:JSON.stringify(studienrichtung),
		    success: function(result){
			    if(result === studienrichtung){
					alert("klappt");
				}
			    else{
					alert(result);
				}
		    }
		})
	});
	
	$(document).ready(function(){
		
	});
	</script>
	
	        <!-- Ende Content -->
	    </div>
	</div>
	
	<script src="${pageContext.request.contextPath}/static/js/dozent.js"></script>

</template:template>