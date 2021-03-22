package bdbt_proj;


/*Tabela zamowienia ma malo ciekawe elementy, zatem wybiore tabele Modele
   (Modele (Nazwa, Rok_produkcji, Koszt) )*/

public class Employees {
	
	private int id_pracownika;
	private String imie;
	private String nazwisko;
	private String data_urodzenia;
	private String data_zatrudnienia;
	private String PESEL;
	private String plec;
	private String nr_konta;
	private int id_producenta;
	private int id_adresu;
	private int id_stanowiska;
	private int id_fabryki;
	
	
	
	public Employees() {
		
	}




	public Employees(int id_pracownika, String imie, String nazwisko, String data_urodzenia, String data_zatrudnienia,
			String PESEL, String plec, String nr_konta, int id_producenta, int id_adresu, int id_stanowiska,
			int id_fabryki) {
		super();
		this.id_pracownika = id_pracownika;
		this.imie = imie;
		this.nazwisko = nazwisko;
		this.data_urodzenia = data_urodzenia;
		this.data_zatrudnienia = data_zatrudnienia;
		this.PESEL = PESEL;
		this.plec = plec;
		this.nr_konta = nr_konta;
		this.id_producenta = id_producenta;
		this.id_adresu = id_adresu;
		this.id_stanowiska = id_stanowiska;
		this.id_fabryki = id_fabryki;
	}



	

	public int getId_pracownika() {
		return id_pracownika;
	}




	public void setId_pracownika(int id_pracownika) {
		this.id_pracownika = id_pracownika;
	}




	public String getImie() {
		return imie;
	}




	public void setImie(String imie) {
		this.imie = imie;
	}




	public String getNazwisko() {
		return nazwisko;
	}




	public void setNazwisko(String nazwisko) {
		this.nazwisko = nazwisko;
	}




	public String getData_urodzenia() {
		return data_urodzenia;
	}




	public void setData_urodzenia(String data_urodzenia) {
		this.data_urodzenia = data_urodzenia;
	}




	public String getData_zatrudnienia() {
		return data_zatrudnienia;
	}




	public void setData_zatrudnienia(String data_zatrudnienia) {
		this.data_zatrudnienia = data_zatrudnienia;
	}




	public String getPESEL() {
		return PESEL;
	}




	public void setPESEL(String PESEL) {
		this.PESEL = PESEL;
	}




	public String getPlec() {
		return plec;
	}




	public void setPlec(String plec) {
		this.plec = plec;
	}




	public String getNr_konta() {
		return nr_konta;
	}




	public void setNr_konta(String nr_konta) {
		this.nr_konta = nr_konta;
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




	public int getId_stanowiska() {
		return id_stanowiska;
	}




	public void setId_stanowiska(int id_stanowiska) {
		this.id_stanowiska = id_stanowiska;
	}




	public int getId_fabryki() {
		return id_fabryki;
	}




	public void setId_fabryki(int id_fabryki) {
		this.id_fabryki = id_fabryki;
	}




	@Override
	public String toString() {
		return "Employees [id_pracownika=" + id_pracownika + ", imie=" + imie + ", nazwisko=" + nazwisko
				+ ", data_urodzenia=" + data_urodzenia + ", data_zatrudnienia=" + data_zatrudnienia + ", PESEL=" + PESEL
				+ ", plec=" + plec + ", nr_konta=" + nr_konta + ", id_producenta=" + id_producenta + ", id_adresu="
				+ id_adresu + ", id_stanowiska=" + id_stanowiska + ", id_fabryki=" + id_fabryki + "]";
	}





	
}
