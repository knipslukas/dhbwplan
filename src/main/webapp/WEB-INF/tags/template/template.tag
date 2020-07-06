<%@ attribute name="pageTitle" required="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>
	<head> 
		<title>${pageTitle}</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="x-ua-compatible" content="IE=edge">
		
		<!-- ICONS -->
		<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/static/images/favicon/apple-touch-icon.png">
		<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/static/images/favicon/favicon-32x32.png">
		<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/static/images/favicon/favicon-16x16.png">
		<link rel="manifest" href="${pageContext.request.contextPath}/static/images/favicon/site.webmanifest">
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/favicon/favicon.ico">
		<meta name="msapplication-TileColor" content="#da532c">
		<meta name="msapplication-config" content="${pageContext.request.contextPath}/static/images/favicon/browserconfig.xml">
		<meta name="theme-color" content="#ffffff">
	
		<!-- CSS -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/bootstrap.min.css">
		<link href="${pageContext.request.contextPath}/static/fontawesome/fontawesome.css" rel="stylesheet">
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	    <link href="${pageContext.request.contextPath}/static/bootstrap/bootstrap4-toggle.min.css" rel="stylesheet">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" />
	    <link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css" rel="stylesheet">

	    
	  	<!-- SCRIPTS -->
		<!-- JQuery -->
		<script src="${pageContext.request.contextPath}/static/jquery/jquery-3.5.1.min.js"></script>
		<!-- Bootstrap core JavaScript -->
		<script src="${pageContext.request.contextPath}/static/bootstrap/bootstrap.min.js"></script>
		<!-- Popper JS -->
		<script src="${pageContext.request.contextPath}/static/js/umd/popper.min.js"></script>
		<script src="${pageContext.request.contextPath}/static/fontawesome/fontawesome.js"></script> 
		<script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>
	    
	
	
		
	    <script src="http://localhost:35729/livereload.js"></script>
	   	<script src="${pageContext.request.contextPath}/static/js/global.js"></script>
		
	</head>

	<body>
		<jsp:doBody />
	</body>
	
</html>