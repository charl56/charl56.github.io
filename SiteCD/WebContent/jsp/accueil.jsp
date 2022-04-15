<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Cd</title>
		<link rel='stylesheet' type='text/css' href='../css/bootstrap.min.css' />
		<link rel='stylesheet' type='text/css' href='../css/accueil.css' />		
      	
      	<meta name="viewport" content="width=device-width, initial-scale=1">
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	</head>

	<body>
	
 		<div class="loader">
			<span class="lettre">C</span>
			<span class="lettre">H</span>
			<span class="lettre">A</span>
			<span class="lettre">R</span>
			<span class="lettre">G</span>
			<span class="lettre">E</span>
			<span class="lettre">M</span>
			<span class="lettre">E</span>
			<span class="lettre">N</span>
			<span class="lettre">T</span>
		</div>
		<script src="../js/accueil.js"></script>
		
		
		<div id="menu" class="center">
		 	<a class="btn btn-default btn-lg btn-block" href="${pageContext.request.contextPath}/jsp/accueil?id=pageAccueil">Accueil</a>	 	
		 	<a class="btn btn-default btn-lg btn-block" href="${pageContext.request.contextPath}/jsp/accueil?id=pageCds">Liste de Cd</a>
		 	<a class="btn btn-default btn-lg btn-block" href="${pageContext.request.contextPath}/jsp/accueil?id=connexion">Connexion</a>		 			 			 	
		</div> 
		
		
		<div class="titre">	
				<h1>Bienvenue</h1>					
		</div>
		
		
		
		
		<h2>Visiualiser cd</h2>
		<h2>Ajouter/supprimer cd</h2>
		<h2>Tracklist cd</h2>
		
	
		

	</body>
</html>