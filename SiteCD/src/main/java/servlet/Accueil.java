package servlet;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import beans.DAOCd;
import beans.DAOFactory;


@WebServlet("/jsp/accueil")
public class Accueil extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private DAOCd daocd;
	private DAOFactory daoFactory;
   	private String albumChoose;
   	@Override
	public void init() {
        DAOFactory daoFactory = DAOFactory.getInstance();
        daocd = daoFactory.getDAOCd("MariaDB");
    }
   	
   	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		processRequest(request,response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		processRequest(request,response);
	}
	
	
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {
    
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        if(id == null) {
            id = "pageAccueil";
        }
        switch(id) {
            case "pageAccueil":
            			request.setAttribute("listCd", daocd.getListCd());
		        		request.getRequestDispatcher("/jsp/accueil.jsp").forward(request, response);    
		                break;
		                
            case "pageCds":
		            	request.setAttribute("listCd", daocd.getListCd());
		            	request.setAttribute("nbCd", daocd.getNbCd());
		            	request.getRequestDispatcher("/jsp/cd.jsp").forward(request, response);
		            	break; 
		            	
            case "nouveauCd":
						request.getRequestDispatcher("/jsp/ajouterCd.jsp").forward(request, response);
            			break;
            			
            case "ajouterCd":
						String album = request.getParameter("Album");
						String artiste = request.getParameter("Artiste");
						int nbTitre = Integer.parseInt(request.getParameter("NbTitre"));
            			daocd.add(album, artiste, nbTitre);
		            	request.setAttribute("listCd", daocd.getListCd());
		            	request.setAttribute("nbCd", daocd.getNbCd());
        				request.getRequestDispatcher("/jsp/cd.jsp").forward(request, response);
            			break;
            			
            case "modifierCdValide":
		    			daocd.edit(request.getParameter("Album"), request.getParameter("Artiste"), Integer.parseInt(request.getParameter("NbTitre")), Integer.parseInt(request.getParameter("IdUnique")));		    			
						request.setAttribute("listCd", daocd.getListCd());
		            	request.setAttribute("nbCd", daocd.getNbCd());
						request.getRequestDispatcher("/jsp/cd.jsp").forward(request, response);
		    			break;
		    			
            case "modifierCd":
		            	request.setAttribute("list1Cd", daocd.get1Cd(Integer.parseInt(request.getParameter("idUnique"))));
	    				request.getRequestDispatcher("/jsp/modifierCd.jsp").forward(request, response);
	    				System.out.println();
	    				break;
    				
            case "supprimerCd":
            			daocd.delete(request.getParameter("Album"),request.getParameter("IdUnique"));
		            	request.setAttribute("listCd", daocd.getListCd());
		            	request.setAttribute("nbCd", daocd.getNbCd());
						request.getRequestDispatcher("/jsp/cd.jsp").forward(request, response);
						break;
						
            case "rangerCds" :
            			request.setAttribute("listCd", daocd.rangementCd(request.getParameter("rangementCd")));
		            	request.setAttribute("nbCd", daocd.getNbCd());
		            	request.getRequestDispatcher("/jsp/cd.jsp").forward(request, response);
            			break;
            			
            case "tracklist" :
            			albumChoose = request.getParameter("Album");
            			request.setAttribute("albumPochette", albumChoose);
            			request.setAttribute("tracklistAlbum", daocd.rangementTrack(albumChoose));
            			request.getRequestDispatcher("/jsp/trackList.jsp").forward(request, response);
            			break;
            		
            case "ajouterTrack" :
    					daocd.addTrack(Integer.parseInt(request.getParameter("Id")),request.getParameter("Titre"),Float.parseFloat(request.getParameter("Duree")),albumChoose);
		            	request.setAttribute("albumPochette", albumChoose);
    					request.setAttribute("tracklistAlbum", daocd.rangementTrack(albumChoose));
            			request.getRequestDispatcher("/jsp/trackList.jsp").forward(request, response);
            			break;
            	
            case "supprimerTrack" :
    					daocd.deleteTrack(Integer.parseInt(request.getParameter("IdUnique")), albumChoose);
    					request.setAttribute("albumPochette", albumChoose);
    					request.setAttribute("tracklistAlbum", daocd.getTracklist(albumChoose));
            			request.getRequestDispatcher("/jsp/trackList.jsp").forward(request, response);
            			break;
            
            case "connexion" :
            			request.getRequestDispatcher("/jsp/connexion.jsp").forward(request, response);
            			break;
            			
            case "tryConnexion" :
            			String user = request.getParameter("User");
            			String password = request.getParameter("Password");
            			String button = request.getParameter("Button");
            			try (Connection connexion =  DriverManager.getConnection("jdbc:mysql://localhost:3306/cd", "root", "root");
            					Statement statement = connexion.createStatement();) {
            					PreparedStatement preparedStatement;
            						
            					if(button.equals("Login")) {
            						preparedStatement = connexion.prepareStatement("SELECT * FROM users WHERE user=?;");	
            						preparedStatement.setString(1, user);
            						ResultSet resultat = preparedStatement.executeQuery();
            						if(resultat.next()) {
            							request.setAttribute("successfulLogin", BCrypt.checkpw(password, resultat.getString("password")));
            							request.setAttribute("user", user);
            							} 
            						else {
            							request.setAttribute("successfulLogin", false);
            						}
            					}
		            			else {
		            				preparedStatement = connexion.prepareStatement("INSERT INTO users(user,password) VALUES(?,?);");
		            				preparedStatement.setString(1, user);
		            				preparedStatement.setString(2, BCrypt.hashpw(password, BCrypt.gensalt()));
		            				preparedStatement.executeUpdate();
		            				request.setAttribute("successfulCreation", user);
		            				}
	            				} catch (SQLException e) {
		            				e.printStackTrace();
	            				}
	            				request.getRequestDispatcher("/jsp/accueil.jsp").forward(request, response);
            			break;
		            	
        	}
    }
}