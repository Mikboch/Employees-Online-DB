package bdbt_proj;

public class Factories {

	private int id_fabryki;
	private String specjalizacja;
	private float powierzchnia;
	private String nr_ubezpieczenia;
	private int id_producenta;
	private int id_adresu;
	
	public Factories() {
		
	}

	public Factories(int id_fabryki, String specjalizacja, float powierzchnia, String nr_ubezpieczenia,
			int id_producenta, int id_adresu) {
		super();
		this.id_fabryki = id_fabryki;
		this.specjalizacja = specjalizacja;
		this.powierzchnia = powierzchnia;
		this.nr_ubezpieczenia = nr_ubezpieczenia;
		this.id_producenta = id_producenta;
		this.id_adresu = id_adresu;
	}

	public int getId_fabryki() {
		return id_fabryki;
	}

	public void setId_fabryki(int id_fabryki) {
		this.id_fabryki = id_fabryki;
	}

	public String getSpecjalizacja() {
		return specjalizacja;
	}

	public void setSpecjalizacja(String specjalizacja) {
		this.specjalizacja = specjalizacja;
	}

	public float getPowierzchnia() {
		return powierzchnia;
	}

	public void setPowierzchnia(float powierzchnia) {
		this.powierzchnia = powierzchnia;
	}

	public String getNr_ubezpieczenia() {
		return nr_ubezpieczenia;
	}

	public void setNr_ubezpieczenia(String nr_ubezpieczenia) {
		this.nr_ubezpieczenia = nr_ubezpieczenia;
	}

	public int getId_producenta() {
		return id_producenta;
	}

	public void setId_producenta(int id_producenta) {
		this.id_producenta = id_producenta;
	}

	public int getId_adresu() {
		return id_adresu;
	}

	public void setId_adresu(int id_adresu) {
		this.id_adresu = id_adresu;
	}

	@Override
	public String toString() {
		return "Factories [id_fabryki=" + id_fabryki + ", specjalizacja=" + specjalizacja + ", powierzchnia="
				+ powierzchnia + ", nr_ubezpieczenia=" + nr_ubezpieczenia + ", id_producenta=" + id_producenta
				+ ", id_adresu=" + id_adresu + "]";
	}

	
	
	
	
	
}
