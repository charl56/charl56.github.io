<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Liste des Cd</title>
		<link rel='stylesheet' type='text/css' href='../css/bootstrap.min.css' />
		<link rel='stylesheet' type='text/css' href='../css/cd.css' />
		<link href="../css/product.css" rel="stylesheet">
		
		
	</head>

	<body>

		<div id="menu" class="center">
		 	<a class="btn btn-default btn-lg btn-block" href="${pageContext.request.contextPath}/jsp/accueil?id=pageAccueil">Accueil</a>	 	
		 	<a class="btn btn-default btn-lg btn-block" href="${pageContext.request.contextPath}/jsp/accueil?id=pageCds">Liste de Cd</a>		 	
		 	<a class="btn btn-default btn-lg btn-block" href="${pageContext.request.contextPath}/jsp/accueil?id=connexion">Connexion</a>		 			 			 	
		</div> 
		
		<div id="titre">
			<h1>Liste des Cd</h1>
		</div>

		<div id="presentation" class="row">
			<div class="col-md-3">
				<h3>Nombre de Cd :  <c:out value="${nbCd}"/> </h3>
			</div>
			
			<div class="col-md-6">	
			<form method="POST" action="${pageContext.request.contextPath}/jsp/accueil?id=rangerCds">		
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="rangementCd" id="exampleRadios1" value="artisteAZ">
				  	<label class="form-check-label" for="exampleRadios1">Artiste de A-Z</label>
				</div>
				<div class="form-check form-check-inline">
				  	<input class="form-check-input" type="radio" name="rangementCd" id="exampleRadios2" value="albumAZ">
				  	<label class="form-check-label" for="exampleRadios2">Album de A-Z</label>
				</div>
				<div class="form-check form-check-inline">
				  	<input class="form-check-input" type="radio" name="rangementCd" id="exampleRadios3" value="nbTitre">
				  	<label class="form-check-label" for="exampleRadios3">Nombre de titre</label>
				</div>
				<input type="submit" class="btn btn-success btn-block" value="Valider" />
			</form>
			</div>
			
			<div class="col-md-3">
				<div class="row">	
					<form method="POST" action="${pageContext.request.contextPath}/jsp/accueil?id=nouveauCd">
						<a class="btn btn-success btn-block" href="${pageContext.request.contextPath}/jsp/accueil?id=nouveauCd"><h6>Ajouter Cd</h6></a>
					</form>		
				</div>
			</div>
		</div>

		
		<div id="produits" class="row">
			<div style="overflow-x:auto;">
 		 		<table class="table ">
 			 		<thead class="thead-dark">
				    	<tr>
				      		<th scope="col">Pochette</th>
					      	<th scope="col">Artiste</th>
						    <th scope="col">Album</th>
						    <th scope="col">Nombre de titre</th>
						    <th scope="col">Modifier</th>
						    <th scope="col">Supprimer</th>
					    </tr>
				  	</thead>
		 		 	<tbody>
			    		<c:forEach var="cd" items="${listCd}">				
							<tr>	
						 		<th><a href="${pageContext.request.contextPath}/jsp/accueil?id=tracklist&Album=${cd.album}"><img src="../images/pochetteAlbum/<c:out value="${cd.album}"/>.jpg" alt="Responsive image" width="170" height="170" ></a></th>
								<th><h5><c:out value="${cd.artiste}"/></h5></th>
								<th><h5><c:out value="${cd.album}"/></h5></th>
								<th><h5><c:out value="${cd.nbTitre}"/></h5></th> 				
							 	<th>
							 		<div class="row">
										<a class="btn btn-warning btn-block" href="${pageContext.request.contextPath}/jsp/accueil?id=modifierCd&idUnique=${cd.idUnique}"><h6>Modifier</h6></a>
									</div></th>
								<th>
							 		<a href="${pageContext.request.contextPath}/jsp/accueil?id=supprimerCd&IdUnique=${cd.idUnique}&Album=${cd.album}"  onclick="return confirm('Are you sure you want to delete this item')">
		       							<img src="../images/corbeille.jpg" alt="Responsive image" width="40" height="23">
		         					</a></th>
							</tr>
			 			</c:forEach>	
 			 		</tbody>
 			 	</table>
			</div>
		</div>	
		
		
	<!-- 	<div class="row">
			<div class="d-md-flex flex-md-equal w-100 my-md-3 ps-md-3">
			    <div class="bg-light me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
			      <div class="my-3 p-3">
			        <h2 class="display-5">Artiste</h2>
			        <p class="lead">Album</p>
			      </div>
			      <div class="bg-light shadow-sm mx-auto" style="width: 80%; height: 80%; border-radius: 21px 21px 0 0;">
			      	<img src="../images/pochetteAlbum/V.jpg" alt="Responsive image" >
			      </div>
			    </div>			   
			    <div class="bg-dark me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden">
			      <div class="my-3 py-3">
			        <h2 class="display-5">Artiste</h2>
			        <p class="lead">Album</p>
			      </div>
			      <div class="bg-dark shadow-sm mx-auto" style="width: 80%; height: 80%; border-radius: 21px 21px 0 0;">
	   		      	<img src="../images/pochetteAlbum/Civilisation.jpg" alt="Responsive image" width="170" height="170">
			      </div>
			    </div>
			  </div>
   			<div class="d-md-flex flex-md-equal w-100 my-md-3 ps-md-3">
			    <div class="bg-light me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
			      <div class="my-3 p-3">
			        <h2 class="display-5">Artiste</h2>
			        <p class="lead">Album</p>
			      </div>
			      <div class="bg-dark shadow-sm mx-auto" style="width: 100%; height: 100%; border-radius: 21px 21px 0 0;">
			      	<img src="../images/pochetteAlbum/Couleur de ma peine.jpg" alt="Responsive image" width="300" height="300" >
			      </div>
			    </div>			   
			    <div class="bg-dark me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden">
			      <div class="my-3 py-3">
			        <h2 class="display-5">Artiste</h2>
			        <p class="lead">Album</p>
			      </div>
			      <div class="bg-light shadow-sm mx-auto" style="width: 100%; height: 100%; border-radius: 21px 21px 0 0;">
	   		      	<img src="../images/pochetteAlbum/La vie de luxe.jpg" alt="Responsive image" width="300" height="300">
			      </div>
			    </div>
			  </div>
		</div>			-->
		
		
			 	
	</body>
</html>