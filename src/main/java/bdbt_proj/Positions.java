package bdbt_proj;

public class Positions {

	private int id_stanowiska;
	private String nazwa_stanowiska;
	private String opis_stanowiska;

	public Positions() {

	}

	
	public Positions(int id_stanowiska, String nazwa_stanowiska, String opis_stanowiska) {
		super();
		this.id_stanowiska = id_stanowiska;
		this.nazwa_stanowiska = nazwa_stanowiska;
		this.opis_stanowiska = opis_stanowiska;
	}


	public int getId_stanowiska() {
		return id_stanowiska;
	}


	public void setId_stanowiska(int id_stanowiska) {
		this.id_stanowiska = id_stanowiska;
	}


	public String getNazwa_stanowiska() {
		return nazwa_stanowiska;
	}


	public void setNazwa_stanowiska(String nazwa_stanowiska) {
		this.nazwa_stanowiska = nazwa_stanowiska;
	}


	public String getOpis_stanowiska() {
		return opis_stanowiska;
	}


	public void setOpis_stanowiska(String opis_stanowiska) {
		this.opis_stanowiska = opis_stanowiska;
	}


	@Override
	public String toString() {
		return "Positions [id_stanowiska=" + id_stanowiska + ", nazwa_stanowiska=" + nazwa_stanowiska
				+ ", opis_stanowiska=" + opis_stanowiska + "]";
	}

	
	
	
}
