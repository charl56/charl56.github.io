package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


public class DAOCdMariaDB implements DAOCd {
	
	private int nbCd;
    
    private final DAOFactory daoFactory;

	DAOCdMariaDB(DAOFactory daoFactory) {
	    this.daoFactory = daoFactory;
	}	
	
	
    public List<Cd> getListCd(){
        List<Cd> cds = new ArrayList<Cd>();
        cds.clear();

        try (Connection connexion = daoFactory.getConnection();	
      	      Statement statement = connexion.createStatement();
      	      ResultSet resultat = statement.executeQuery(
        		 "SELECT Artiste, Album, NbTitre, IdUnique FROM cd;")){
         while (resultat.next()) {
             String artiste = resultat.getString("Artiste");
             String album = resultat.getString("Album");
             int nbTitre = resultat.getInt("NbTitre");
             int idUnique = resultat.getInt("IdUnique");
             Cd cd =  new Cd(artiste,album,nbTitre,idUnique);
            
             cds.add(cd);
         }
         } catch (SQLException e) {
             e.printStackTrace();
     	}
        
         nbCd = 0;
         for(int i = 0; i <  cds.size(); i++) {
 			nbCd = nbCd + 1; 
		} 
     	return cds;		
   }
	 
    public ArrayList<Cd> get1Cd(int id) {
		ArrayList<Cd> cd1list = new ArrayList<Cd>();
		cd1list.clear();
		Cd cd1 = new Cd();
		int i;
			for(i = 0; i <  getListCd().size(); i++) {
					if(id == getListCd().get(i).getIdUnique())
						cd1list.add(cd1 = getListCd().get(i));				
			}
			return cd1list;
	}
    
    public void add(String album, String artiste, int nbTitre) {
    	String albumTrack = album.replaceAll("\\s", "");
		try (Connection connexion = daoFactory.getConnection()){
			PreparedStatement preparedStatement = connexion.prepareStatement(
   				 "INSERT INTO cd(Album, Artiste, NbTitre)VALUES(?,?,?)");
   		 preparedStatement.setString(1, album);
   		 preparedStatement.setString(2, artiste);
   		 preparedStatement.setLong(3, nbTitre);
   		 preparedStatement.executeUpdate();
   		
		} catch (SQLException e) {
		e.printStackTrace();
		}	
		try (Connection connexion = daoFactory.getConnection()){
			PreparedStatement preparedStatement = connexion.prepareStatement(
					 "create table tracklist"+albumTrack+"("
					 + "	Id INT NOT NULL,"
					 + "	Titre VARCHAR(40),"
					 + "	Duree DECIMAL(3,2)"
					 + ");");
			 preparedStatement.executeUpdate();
		}
		catch (SQLException e) {
			e.printStackTrace();
			}	
	}
	
	public void delete(String album, String idUnique) {
		int id = Integer.parseInt(idUnique);
		String albumTrack = album.replaceAll("\\s", "");
		try (Connection connexion = daoFactory.getConnection()){
			PreparedStatement preparedStatement = connexion.prepareStatement(
				"DELETE FROM cd WHERE IdUnique="+ id+";"
					);
       		 preparedStatement.executeUpdate(); 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try (Connection connexion = daoFactory.getConnection()){
			PreparedStatement preparedStatement = connexion.prepareStatement(
					 "DROP TABLE tracklist"+albumTrack+";");
			 preparedStatement.executeUpdate();
		}
		catch (SQLException e) {
			e.printStackTrace();
			}	
	}

	
	public int getNbCd() {
		return nbCd;
	}
	

	public void edit(String albumModifie, String artisteModifie, int nbTitreModifie, int idUnique) {
		try (Connection connexion = daoFactory.getConnection()){
			PreparedStatement preparedStatement = connexion.prepareStatement(
   				 "UPDATE cd SET Album=?, Artiste=?, NbTitre=? WHERE IdUnique=? ;");
   		 preparedStatement.setString(1, albumModifie);
   		 preparedStatement.setString(2, artisteModifie);
   		 preparedStatement.setLong(3, nbTitreModifie);
   		 preparedStatement.setLong(4, idUnique);
   		 preparedStatement.executeUpdate();
   		 
		} catch (SQLException e) {
		e.printStackTrace();
		}	
	}

	
	public List<Cd> rangementCd(String ordre){  
		List<Cd> cdlistRange = getListCd();
		switch(ordre) {
		case"artisteAZ":			
				Collections.sort(cdlistRange, Cd.ComparatorArtiste);
				break;
			
		case "albumAZ":
				Collections.sort(cdlistRange, Cd.ComparatorAlbum);
				break;
			
		case "nbTitre":
				Collections.sort(cdlistRange, Cd.ComparatorNbTitre);
				break;
		}
		return cdlistRange;	
    }
	
	
	public List<Track> getTracklist(String album){
		 List<Track> tracklist = new ArrayList<Track>();
		 tracklist.clear();
		 String albumTrack = album.replaceAll("\\s", "");
	        try (Connection connexion = daoFactory.getConnection();	
	      	      Statement statement = connexion.createStatement();
	      	      ResultSet resultat = statement.executeQuery(
	        		 "SELECT Id, Titre, Duree FROM tracklist"+albumTrack+";")){
	         while (resultat.next()) {
	             int id = resultat.getInt("Id");
	             String titre = resultat.getString("Titre");
	             float duree = resultat.getFloat("Duree");
	             Track track =  new Track(album,id,titre,duree);
	            
	             tracklist.add(track);
	         }
	         } catch (SQLException e) {
	             e.printStackTrace();
	     	}  
	     	return tracklist;		
	}
	
	
	public void addTrack(int id, String titre, float duree, String album) {
		String albumTrack = album.replaceAll("\\s", "");
		try (Connection connexion = daoFactory.getConnection()){
			PreparedStatement preparedStatement = connexion.prepareStatement(
   				 "INSERT INTO tracklist"+albumTrack+"(Id, Titre, Duree)VALUES(?,?,?)");
			
			//test si 
   		 preparedStatement.setInt(1, id);
   		 preparedStatement.setString(2, titre);
   		 preparedStatement.setFloat(3, duree);
   		 preparedStatement.executeUpdate();
   		
		} catch (SQLException e) {
		e.printStackTrace();
		}	
	}
	
	public void deleteTrack(int idUnique, String album) {
		String albumTrack;
		albumTrack = album.replaceAll("\\s", "");
		try (Connection connexion = daoFactory.getConnection()){
			PreparedStatement preparedStatement = connexion.prepareStatement(
				"DELETE FROM tracklist"+albumTrack+" WHERE Id="+idUnique+";"
					);
       		 preparedStatement.executeUpdate(); 
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<Track> rangementTrack(String album){  
		List<Track> tracklistRange = getTracklist(album);
					
		Collections.sort(tracklistRange, Track.ComparatorTracklist);

		return tracklistRange;	
    }
	
}
