package bdbt_proj;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

class EmployeesDAOTest {

	private EmployeesDAO dao;
	private AddressesDAO daoAddr;
	
	@BeforeEach
	void setUp() throws Exception {
		
		DriverManagerDataSource datasource = new DriverManagerDataSource();
		datasource.setUrl("jdbc:oracle:thin:@127.0.0.1:1521:orcl");
		datasource.setUsername("MIKBOCH");
		datasource.setPassword("mkoMKO99");
		datasource.setDriverClassName("oracle.jdbc.OracleDriver");
		
		dao = new EmployeesDAO(new JdbcTemplate(datasource));
	}

	@Test
	void testList() {
		List<Employees> listOfEmployees = dao.list();
		assertTrue(!listOfEmployees.isEmpty());
	}

/*	private int id_pracownika;
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
	private int id_fabryki;*/
	
	@Test
	void testSave() {
		Employees employee = new Employees(0,"Roman","Babek","01-JAN-2020","02-JAN-2020",
				"123456788","M","12341412412",1,1,1,1);
		dao.save(employee);
	}
	
	
	@Test
	void testGet() {
		int id =1;
		Employees employee = dao.get(id);
		
		assertNotNull(employee);
	}

	@Test
	void testGetAddr() {
		
		int id =2;
		Addresses address = daoAddr.get(id);
		assertNotNull(address);
	}
	
	@Test
	void testUpdate() {
		Employees employee = new Employees();
		employee.setId_pracownika(22);
		employee.setImie("Andrzej");
		employee.setNazwisko("Babej");
		employee.setData_urodzenia("01-DEC-1992");
		employee.setData_zatrudnienia("01-JAN-2020");
		employee.setPESEL("999999999");
		employee.setPlec("M");
		employee.setNr_konta("1111123345");
		employee.setId_producenta(1);
		employee.setId_adresu(3);
		employee.setId_stanowiska(3);
		employee.setId_fabryki(1);
		
		dao.update(employee);
		
	}


	@Test
	void testDelete() {
		int id = 41;
		dao.delete(id);
	}

}
