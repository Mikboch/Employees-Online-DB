package bdbt_proj;

public class Addresses {

	private int id_adresu;
	private String miasto;
	private String ulica;
	private String numer_budynku;
	private String nr_lokalu;
	private int id_poczty;
	
	
	public Addresses() {
		
	}


	public Addresses(int id_adresu, String miasto, String ulica, String numer_budynku, String nr_lokalu,
			int id_poczty) {
		super();
		this.id_adresu = id_adresu;
		this.miasto = miasto;
		this.ulica = ulica;
		this.numer_budynku = numer_budynku;
		this.nr_lokalu = nr_lokalu;
		this.id_poczty = id_poczty;
	}


	public int getId_adresu() {
		return id_adresu;
	}


	public void setId_adresu(int id_adresu) {
		this.id_adresu = id_adresu;
	}


	public String getMiasto() {
		return miasto;
	}


	public void setMiasto(String miasto) {
		this.miasto = miasto;
	}


	public String getUlica() {
		return ulica;
	}


	public void setUlica(String ulica) {
		this.ulica = ulica;
	}


	public String getNumer_budynku() {
		return numer_budynku;
	}


	public void setNumer_budynku(String numer_budynku) {
		this.numer_budynku = numer_budynku;
	}


	public String getNr_lokalu() {
		return nr_lokalu;
	}


	public void setNr_lokalu(String nr_lokalu) {
		this.nr_lokalu = nr_lokalu;
	}


	public int getId_poczty() {
		return id_poczty;
	}


	public void setId_poczty(int id_poczty) {
		this.id_poczty = id_poczty;
	}


	@Override
	public String toString() {
		return "Addresses [id_adresu=" + id_adresu + ", miasto=" + miasto + ", ulica=" + ulica + ", numer_budynku="
				+ numer_budynku + ", nr_lokalu=" + nr_lokalu + ", id_poczty=" + id_poczty + "]";
	}
	
	

	
	
	
}
