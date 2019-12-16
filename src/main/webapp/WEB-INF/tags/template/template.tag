<%@ attribute name="pageTitle" required="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>
	<head> 
		<title>${pageTitle}</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="x-ua-compatible" content="IE=edge">
		
		<!-- ICONS -->
		<link rel="apple-touch-icon" sizes="57x57" href="${pageContext.request.contextPath}/static/images/favicon/apple_57.png">
		<link rel="apple-touch-icon" sizes="60x60" href="${pageContext.request.contextPath}/static/images/favicon/apple_60.png">
		<link rel="apple-touch-icon" sizes="72x72" href="${pageContext.request.contextPath}/static/images/favicon/apple_72.png">
		<link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/static/images/favicon/apple_76.png">
		<link rel="apple-touch-icon" sizes="114x114" href="${pageContext.request.contextPath}/static/images/favicon/apple_114.png">
		<link rel="apple-touch-icon" sizes="120x120" href="${pageContext.request.contextPath}/static/images/favicon/apple_120.png">
		<link rel="apple-touch-icon" sizes="144x144" href="${pageContext.request.contextPath}/static/images/favicon/apple_144.png">
		<link rel="apple-touch-icon" sizes="152x152" href="${pageContext.request.contextPath}/static/images/favicon/apple_152.png">
		<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/static/images/favicon/apple_180.png">
		<link rel="icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath}/static/images/favicon/android_192.png">
		<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/static/images/favicon/favicon_32.png">
		<link rel="icon" type="image/png" sizes="96x96" href="${pageContext.request.contextPath}/static/images/favicon/favicon_96.png">
		<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/static/images/favicon/favicon_16.png">
		<link rel="manifest" href="${pageContext.request.contextPath}/static/images/favicon/manifest.json">
	
		<!-- CSS -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/bootstrap.min.css">
		<link href="${pageContext.request.contextPath}/static/fontawesome/fontawesome.css" rel="stylesheet">
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	    <link href="${pageContext.request.contextPath}/static/bootstrap/bootstrap4-toggle.min.css" rel="stylesheet">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" />
	    
	  	<!-- SCRIPTS -->
		<!-- JQuery -->
		<script src="${pageContext.request.contextPath}/static/jquery/jquery-3.4.1.min.js"></script>
		<!-- Bootstrap core JavaScript -->
		<script src="${pageContext.request.contextPath}/static/bootstrap/bootstrap.min.js"></script>
		<!-- Popper JS -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="${pageContext.request.contextPath}/static/fontawesome/fontawesome.js"></script> 
	    
	
	
		
	    <script src="http://localhost:35729/livereload.js"></script>
	   	<script src="${pageContext.request.contextPath}/static/js/global.js"></script>
		
	</head>

	<body>
		<jsp:doBody />
	</body>
	
</html>