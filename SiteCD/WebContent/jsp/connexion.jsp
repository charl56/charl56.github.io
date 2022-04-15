<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Connexion</title>
		<link rel='stylesheet' type='text/css' href='../css/bootstrap.min.css' />
		<link rel='stylesheet' type='text/css' href='../css/accueil.css' />
	</head>

	<body>

		<div id="menu" class="center">
		 	<a class="btn btn-default btn-lg btn-block" href="${pageContext.request.contextPath}/jsp/accueil?id=pageAccueil">Accueil</a>	 	
		 	<a class="btn btn-default btn-lg btn-block" href="${pageContext.request.contextPath}/jsp/accueil?id=pageCds">Liste de Cd</a>		 	
		 	<a class="btn btn-default btn-lg btn-block" href="${pageContext.request.contextPath}/jsp/accueil?id=connexion">Connexion</a>		 			 			 	
		</div> 
	
		<div>
			<form method='POST' action="${pageContext.request.contextPath}/jsp/accueil?id=tryConnexion">
				<p>User : <input name='User' type='text' /></p>
				<br/>
				<p>Password : <input name='Password' type='password'/></p>
				<br/><br/>
				<button name='Button' type='submit' value='Login' >Connexion</button>
				<button name='Button' type='submit' value='Create' >Créer un compte</button>
			</form>
			
		</div>
		
	
	

	</body>
</html>