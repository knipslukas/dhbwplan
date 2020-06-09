<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<template:template pageTitle="${pageTitle}">
    <template:navbar user="${currentUser}" />


	<div class="container">
	
    	<!-- Start Orentierungszeile -->
	   	<div class="alert dozentuebersicht d-flex align-items-center" role="alert">
			<h1 class="text-white my-1">Kurs bearbeiten</h1>
			<a href="/kurs/show/${kurs.KID}" class="btn ml-auto DHBWbutton">Zurück</a>
        </div>
    	<!-- Ende Orentierungszeile -->
	
	    <!-- Start Content -->
	    <div class="dhbw_content mt-5">
	        <!-- Start Formular -->
	        <form class="pb-3 js-form-dozanleg" method="POST" action="/kurs/update/${kurs.KID}">	      
	        	
	             <div class="form-group row">
	                <label class="col-2 col-form-label">Name</label>
	                <div class="col-10">
						<input type="text" name="name" class="form-control" placeholder="Kursname eingeben" value="${kurs.name}" required>	                
	                </div>
	            </div>
	
	            <div class="form-group row">
	                <label class="col-2 col-form-label">Jahrgang</label>
	                <div class="col-10">
						<input type="text" name="jahrgang" class="form-control" placeholder="Kursjahrgang eingeben" value="${kurs.jahrgang}" required>	                
	                </div>
	            </div>
	            
	            <div class="form-group row">
	                <label class="col-2 col-form-label">Anzahl der Studierenden</label>
	                <div class="col-10">
						<input type="text" name="anzahlStudierende" class="form-control" placeholder="Anzahl der Studiernden eingeben" value="${kurs.anzahlStudierende}" required>	                
	                </div>
	            </div>
	   	            	            
<!-- 				Das hier übermittelt dem Server die ID von Dozenten, da diese für das Update benötigt wird -->
	            
<!-- 	            Das hier muss IMMER dazu, das hilft Spring zu erkennen, ob Angriffe auf die Übertragung stattgefunden haben oder nicht -->
	            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	
<!-- 	            Final Buttons -->
	            <div class="finalButtons">
	                <button type="submit" class="btn btn-success">Speichern </button>
	                <button type="reset" class="btn btn-danger">Zurücksetzen </button>
	            </div>
	
	        </form>
	
<!-- 	        Ende Formular -->


	        
	        <!-- Versuch, Präsenzzeiträume hinzuzufügen -->
	        
	      <div class="mt-5">
	      <label class="col-2 col-form-label"><font size="5">Präsenzzeiträume</font></label>
			<table class="table table-hover" STYLE="margin-bottom: 50px;">
				<thead class="thead-light">
					<tr>
						<th scope="col"><strong>Semester</strong></th>
						<th scope="col"><strong>Von</strong></th>
						<th scope="col"><strong>Bis</strong></th>
						<th scope="col"><strong>Aktionen</strong></th>
					</tr>
				</thead>
				<tbody class="js-table">
				<!-- 	Beispieleintrag -->
					<c:choose>
						<c:when test="${przList ne null }">
							<c:forEach items="${przList}" var="prz">
								<tr>
									<td scope="row" class="align-middle">${praesenzzeitraum.semester }</td>
									<td scope="row" class="align-middle">${praesenzzeitraum.von }</td>
									<td scope="row" class="align-middle">${praesenzzeitraum.bis }</td>
									<td scope="row" class="align-middle"><a href="/prz/delete/${praesenzzeitraum.PID}" class="btn btn-sm btn-secondary">löschen</a></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="table-warning">
								<td>Keine Präsenzzeiträume vorhanden</td>
								<td></td>
								<td></td>
								<td></td>

							</tr>
						</c:otherwise>
					</c:choose>

				</tbody>
			</table>
			
			
			
		</div>
	        
<!-- 	        Präsenzzeitraum Formular -->
	       <form class="pb-3 js-form-dozanleg">
	        <div class="form-group row">
	                <label class="col-2 col-form-label">Semester</label>
	                <div class="col-3">
						<input type="text" name="semester" class="form-control js-form-semester" placeholder="Neues Semester eingeben" value="${praesenzzeitraum.semester}" required>	                
	                </div>
	        </div>
	         
	        <div class="form-group row">
	                <label class="col-2 col-form-label">Von</label>
	                <div class="col-3">
						<input type="date" name="von" class="form-control js-form-von" id=test placeholder="Neues Startdatum" value="${praesenzzeitraum.von}" required>	                
	                </div>
	        </div>    
	           
	        <div class="form-group row">
	                <label class="col-2 col-form-label">Bis</label>
	                <div class="col-3">
						<input type="date" name="bis" class="form-control js-form-bis" placeholder="Neues Enddatum" value="${praesenzzeitraum.bis}" required>	                
	                </div>
	         </div> 
	         
	         <input type ="hidden" value="${kurs.KID}" class="js-form-kurs"/>
	         
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
			var praesenzzeitraum = new Object();
			praesenzzeitraum.kursid = $(".js-form-kurs").val();
			praesenzzeitraum.semester = $(".js-form-semester").val();
			praesenzzeitraum.von = $(".js-form-von").val();
			praesenzzeitraum.bis = $(".js-form-bis").val();
			$.ajax({
				url: "/kurs/addPRZ",
				type: "POST",
			    contentType: "application/json",
			    data:JSON.stringify(praesenzzeitraum),
			    success: function(result){
				    getList();
			    },
		    	error: function(status) {
			    	alert(status);
			    }
			})
			$(".js-form-semester").val("");
			$(".js-form-von").val("");
			$(".js-form-bis").val("");			
		});
		
			
		$(document).ready(function(){
			getList();
			
		});
	
		function getList() {
			$.ajax({
				url: "/kurs/getPRZ/"+$(".js-form-kurs").val(),
				type: "GET",
				success: function (result) {
					renderList(result)
				},
				error: function(status) {
					alert("Liste konnte nicht geladen werden: "+status);
				}
			})
		}

		function renderList(entrys) {
			$(".js-table").html(function() {
				var list = "";
				var ts = new Date();
				$.each(entrys, function(i, prz) {
					list += "<tr>";
					list += "<td>"+prz.semester+"</td>";
					list += "<td>"+prz.von+"</td>";
					list += "<td>"+prz.bis+"</td>";
					list += '<td><button class="przdelete" style="cursor:pointer" onClick="deletePRZ('+prz.pid+')"><i class="fas fa-trash-alt"></i></button></td>';
					list += "</tr>";
				})
				return list;
			})
		}

		function deletePRZ(przid){
			$.ajax({
				url:"/kurs/deletePRZ/"+przid,
				type:"POST",
				contentType:"application/json",
				success: function(result){
					getList();
					},
					error: function(status){
						alert("klappt nicht"+status);
						}
				})	
		}
		
		
	</script>
	<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
	<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script> 

</template:template>