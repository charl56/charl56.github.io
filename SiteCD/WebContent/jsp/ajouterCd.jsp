<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Liste des Cd</title>
		<link rel='stylesheet' type='text/css' href='../css/bootstrap.min.css' />
		<link rel='stylesheet' type='text/css' href='../css/cd.css' />
		
		
	</head>

	<body>

		<div id="menu" class="center">
		 	<a class="btn btn-default btn-lg btn-block" href="${pageContext.request.contextPath}/jsp/accueil?id=pageAccueil">Accueil</a>	 	
		 	<a class="btn btn-default btn-lg btn-block" href="${pageContext.request.contextPath}/jsp/accueil?id=pageCds">Liste de Cd</a>	
		 	<a class="btn btn-default btn-lg btn-block" href="${pageContext.request.contextPath}/jsp/accueil?id=connexion">Connexion</a>		 			 			 		 	
		</div> 
		
		<div id="titre">
			<h1>Ajouter un Cd</h1>
		</div>
		
		<div id="formulaire">
			<form method="POST" action="${pageContext.request.contextPath}/jsp/accueil?id=ajouterCd">
				<input class="form-control" type="text" placeholder="Artiste" name="Artiste" value="${cd.artiste}" required>
				<input class="form-control" type="text" placeholder="Nom de l'album" name="Album" value="${cd.album}" required>
				<input class="form-control" type="number" placeholder="Nombre de titre" name="NbTitre" value="${cd.nbTitre}" required>	
				<label for="avatar">Pochette de l'album :</label>
				<input type="file" id="avatar" name="avatar" accept="image/png, image/jpeg">
				<br>
				<input type="submit" class="btn btn-success btn-block" value="Valider" />
			</form>		
			

			
			<form method="POST" action="${pageContext.request.contextPath}/jsp/accueil?id=pageCds">
				<input type="submit" class="btn btn-danger btn-block" value="Annuler" />			
			</form>		
		</div>
		
		
	<!--		<form>
			  		<div class="form-group">
		    			<label for="exampleFormControlFile1">Pochette de l'album (le nom doit être le même que celui de l'album)</label>
			    		<input type="file" class="form-control-file" id="exampleFormControlFile1">
			  		</div>
				</form>	  -->	
	</body>
</html>