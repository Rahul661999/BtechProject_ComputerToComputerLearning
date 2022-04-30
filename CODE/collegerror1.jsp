<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Login Error</title>
<style>
h3 {
	margin: -220px;
	width: 215px;
	height: 380px;
	align-items: center;
	padding: 100px;
	text-align: center;
}

p {
	width: 350px;
	height: 450px;
	margin: -270px;
	padding: 100px;
	text-align: center;
}
</style>

</head>
<body>

	<p style="color: red">College has not been approved yet!</p>
	<%

//getServletContext().getRequestDispatcher("/stlogin.html").include(request, 
//response);

%>
	<h3>
		<jsp:include page="collegelogin.html"></jsp:include>
	</h3>
</body>

</html>
