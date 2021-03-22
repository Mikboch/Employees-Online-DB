package bdbt_proj;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

/*Data Access Object/Class*/
@Repository
public class EmployeesDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public EmployeesDAO(JdbcTemplate jdbcTemplate) {
		super();
		this.jdbcTemplate = jdbcTemplate;
	}

	
	public List<Employees> list() {

		String sql = "SELECT * FROM Pracownicy ORDER BY Id_pracownika";

		List<Employees> listOfEmployees = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Employees.class));
		return listOfEmployees;

	}

	/* (C)reate */
	public void save(Employees employee) {

		SimpleJdbcInsert insertActor = new SimpleJdbcInsert(jdbcTemplate);
		insertActor.withTableName("PRACOWNICY").usingColumns("imie", "nazwisko", "data_urodzenia", "data_zatrudnienia",
				"PESEL", "plec", "nr_konta", "id_producenta", "id_adresu", "id_stanowiska", "id_fabryki");
		BeanPropertySqlParameterSource param = new BeanPropertySqlParameterSource(employee);
		insertActor.execute(param);
	}

	/* (R)ead */

	public Employees get(int id) {
		Object[] args = { id };
		String sql = "SELECT * FROM Pracownicy WHERE ID_PRACOWNIKA = " + args[0];
		Employees employee = jdbcTemplate.queryForObject(sql, BeanPropertyRowMapper.newInstance(Employees.class));

		return employee;
	}

	/* (U)pdate */

	public void update(Employees employee) {
		
		//Date d = new SimpleDateFormat().parse;
		//String date = employee.getData_urodzenia().to;
		
		String sql = "UPDATE Pracownicy SET imie=:imie, nazwisko=:nazwisko, data_urodzenia=TO_DATE(:data_urodzenia, 'YYYY MM DD HH24:MI:SS'), data_zatrudnienia=TO_DATE(:data_zatrudnienia, 'YYYY MM DD HH24:MI:SS'), PESEL=:PESEL, plec=:plec, nr_konta=:nr_konta, id_producenta=:id_producenta, id_adresu=:id_adresu, id_stanowiska=:id_stanowiska, id_fabryki=:id_fabryki WHERE id_pracownika=:id_pracownika";

		BeanPropertySqlParameterSource param = new BeanPropertySqlParameterSource(employee);
		NamedParameterJdbcTemplate template = new NamedParameterJdbcTemplate(jdbcTemplate);
		template.update(sql, param);
	}

	/* (D)elete */
	public void delete(int id) {
		
		String sql = "DELETE FROM Pracownicy WHERE id_pracownika = ?";
		jdbcTemplate.update(sql, id);
		
	}

}
