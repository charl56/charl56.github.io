package beans;

import java.util.Comparator;

public class Cd {
	
	private String artiste;
	private String album;
	private int nbTitre;
	private int idUnique;
	public Cd() {}
	
	public Cd(String artiste, String album, int nbTitre, int idUnique) {
		this.artiste = artiste;
		this.album = album ;
		this.nbTitre = nbTitre;
		this.idUnique = idUnique;
	}	


	public String getArtiste() {
		return artiste;
	}
	
	public String getAlbum() {
		return album;
	}
	
	public int getNbTitre() {
		return nbTitre;
	}

	public int getIdUnique() {
		return idUnique;
	}
	
	
	 @Override
	    //cette méthode affiche les informations de l'employé
	    public String toString() {
	        return "[Artiste=" + this.artiste + ", Album=" + this.album + ", nbTitre=" +this.nbTitre+", idUnique=" +this.idUnique+" ]";
	    }
	
	
    public static Comparator<Cd> ComparatorArtiste = new Comparator<Cd>() {
      
        @Override
        public int compare(Cd cd1, Cd cd2) {
            return cd1.getArtiste().compareTo(cd2.getArtiste());
        }
    };
    
    public static Comparator<Cd> ComparatorAlbum = new Comparator<Cd>() {
     
        @Override
        public int compare(Cd cd1, Cd cd2) {
            return cd1.getAlbum().compareTo(cd2.getAlbum());
        }
    };
    
    public static Comparator<Cd> ComparatorNbTitre = new Comparator<Cd>() {
     
        @Override
        public int compare(Cd cd1, Cd cd2) {
            return (int) (cd1.getNbTitre() - cd2.getNbTitre());
        }
    };
    
    
}
