package beans;

import java.util.Comparator;

public class Track {
	private int id;
	private String titre, album;
	private float duree;

	public Track() {}
	
	public Track(String album, int id, String titre, float duree) {
		this.album = album;
		this.id = id;		
		this.titre = titre;
		this.duree = duree;
	}	


	public int getId() {
		return id;
	}
	
	public String getTitre() {
		return titre;
	}
	
	public float getDuree() {
		return duree;
	}
	
	public String getAlbumTrack() {
		return album;
	}
	
	public static Comparator<Track> ComparatorTracklist = new Comparator<Track>() {
        
        @Override
        public int compare(Track track1, Track track2) {
            return (int) (track1.getId() - track2.getId());
        }
    };
	
}
