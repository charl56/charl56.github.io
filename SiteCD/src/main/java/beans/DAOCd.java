package beans;

import java.util.ArrayList;
import java.util.List;

public interface DAOCd {

	 	public abstract List<Cd> rangementCd (String ordre);

		public abstract void add(String title, String author,int nbTitre);
					    
		public abstract List<Cd> getListCd();

		public abstract int getNbCd();

		public abstract void edit(String albumModifie, String artisteModifie, int nbTitreModifie, int idUniqueModifie);

		public abstract  ArrayList<Cd> get1Cd(int id);

		public abstract void delete(String album, String idUnique);
		
		public abstract List<Track> getTracklist(String album);
		
		public abstract void addTrack(int id, String titre, float duree, String album);

		public abstract void deleteTrack(int idUnique, String album);

		public abstract Object rangementTrack(String album);
		
}