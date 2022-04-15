<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Modifier Cd</title>
		<link rel='stylesheet' type='text/css' href='../css/bootstrap.min.css' />
		<link rel='stylesheet' type='text/css' href='../css/cd.css' />
		
		
	</head>

	<body>

		<div id="menu" class="center">
		 	<a class="btn btn-default btn-lg btn-block" href="${pageContext.request.contextPath}/jsp/accueil?id=pageAccueil">Accueil</a>	 	
		 	<a class="btn btn-default btn-lg btn-block" href="${pageContext.request.contextPath}/jsp/accueil?id=pageCds">Liste de Cd</a>		 	
		</div> 
		
		<div id="titre">
			<h1>Modifier : ${cd.album}</h1>
			<h1>Modifier : ${list1cd}</h1>

		</div>

		<div id="formulaire">
			<c:forEach var="cd" items="${list1Cd}">	
				<form method="POST" action="${pageContext.request.contextPath}/jsp/accueil?id=modifierCdValide">
						<input class="form-control" type="text" placeholder="Artiste" name="Artiste" value="${cd.artiste}" required>
						<input class="form-control" type="text" placeholder="Nom de l'album" name="Album" value="${cd.album}" required>
						<input class="form-control" type="number" placeholder="Nombre de titre" name="NbTitre" value="${cd.nbTitre}" required>
						<input class="form-control" type="hidden" placeholder="" name="IdUnique" value="${cd.idUnique}">
						<input type="submit" class="btn btn-success btn-block" value="Valider" />			
				</form>		
			</c:forEach>	
			<form method="POST" action="${pageContext.request.contextPath}/jsp/accueil?id=pageCds">
				<input type="submit" class="btn btn-danger btn-block" value="Annuler" />			
			</form>		
		</div>
				
			
			
 			
			<!-- 	<form>
						<div class="form-group">
			    			<label for="exampleFormControlFile1">Pochette de l'album (le nom doit être le même que celui de l'album)</label>
				    		<input type="file" class="form-control-file" id="exampleFormControlFile1">
				  		</div>
					</form>	 --> 
				
	</body>
</html>