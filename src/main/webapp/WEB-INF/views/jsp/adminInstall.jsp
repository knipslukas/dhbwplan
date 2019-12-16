<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<template:template pageTitle="DHBW Planner | Initializer">

	<c:if test="${submit}">
		<p class="text-success">User initialized successfully</p>
	</c:if>
	<div class="container">
		<form action="/adminInstallSubmit" method="post" role="form">
			<div class="form-group">
				<label for="email">E-Mail</label>
				<input type="email" name="email" class="form-control">
			</div>
			<div class="form-group">
				<label for="pwd">Password</label>
				<input type="password" class="form-control" name="pwd">
			</div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<button type="submit" class="btn btn-dhbw">Initialize</button>
		</form>
	</div>
	

</template:template>