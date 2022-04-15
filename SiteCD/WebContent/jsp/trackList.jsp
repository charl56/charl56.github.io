<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Tracklist</title>
		<link rel='stylesheet' type='text/css' href='../css/bootstrap.min.css' />
		<link rel='stylesheet' type='text/css' href='../css/tracklist.css' />
	</head>

	<body>

		<div id="menu" class="center">
		 	<a class="btn btn-default btn-lg btn-block" href="${pageContext.request.contextPath}/jsp/accueil?id=pageAccueil">Accueil</a>	 	
		 	<a class="btn btn-default btn-lg btn-block" href="${pageContext.request.contextPath}/jsp/accueil?id=pageCds">Liste de Cd</a>		 	
		</div> 
		
		<div class="row">
			<div id="presentation" class="col-md-6">
				<div class="row">
					<h4>Tracklist : <c:out value="${albumPochette}"/></h4>
				</div>
				<div class="image">
			 		<a><img src="../images/pochetteAlbum/<c:out value="${albumPochette}"/>.jpg" class="img-thumbnail" alt="Responsive image"></a>	
				</div>
			</div>

			<div class="col-md-6">
				<div id="presentation" style="overflow-x:auto;">
	 		 		<table class="table">
	 			 		<thead class="thead-dark">
					    	<tr>
					      		<th scope="col">Id</th>
						      	<th scope="col">Titre</th>
							    <th scope="col">Durée</th>
							    <th scope="col">Modifier</th>
							    <th scope="col">Supprimer</th>
						    </tr>
					  	</thead>
			 		 	<tbody>
				    		<c:forEach var="track" items="${tracklistAlbum}">				
								<tr>	
									<th><h5><c:out value="${track.id}"/></h5></th>
									<th><h5><c:out value="${track.titre}"/></h5></th>
									<th><h5><c:out value="${track.duree}"/></h5></th> 	
								 	<th>
								 		<div class="row">
												<a class="btn btn-warning btn-block" href=""><h6>Modifier</h6></a>
										</div></th>
									<th>																		<!-- album des tracks -->
								 		<a href="${pageContext.request.contextPath}/jsp/accueil?id=supprimerTrack&IdUnique=${track.id}"  onclick="return confirm('Are you sure you want to delete this item')">
			       							<img src="../images/corbeille.jpg" alt="Responsive image" width="40" height="23">
			         					</a></th>
								</tr>
				 			</c:forEach>	
	 			 		</tbody>
	 			 	</table>
			 	</div>
			 </div>
		</div>		
			
			
			
			
			
		<div class="row">
	 		<div id="formulaire">
	 		<h4>Ajouter un morceau :</h4>
			<form method="POST" action="${pageContext.request.contextPath}/jsp/accueil?id=ajouterTrack">
				<input class="form-control" type="number" placeholder="Id du titre" name="Id" value="" required>
				<input class="form-control" type="text" placeholder="Titre" name="Titre" value="" required>
				<input class="form-control" type="number" placeholder="1.0" name="Duree" step="0.01" min="0" max="10" required>
				<br>
				<input type="submit" class="btn btn-success btn-block" value="Valider" />
			</form>		
			<form method="POST" action="${pageContext.request.contextPath}/jsp/accueil?id=pageCds">
				<input type="submit" class="btn btn-secondary btn-block" value="Page cd" />			
			</form>	
	 	</div>
		</div>
		 					
	</body>
</html>