package bdbt_proj;


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

public class AddressesDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public AddressesDAO(JdbcTemplate jdbcTemplate) {
		super();
		this.jdbcTemplate = jdbcTemplate;
	}

	
	public List<Addresses> list() {

		String sql = "SELECT * FROM Adresy ORDER BY Id_adresu";

		List<Addresses> listOfAddresses = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Addresses.class));
		return listOfAddresses;

	}

	/*
	 * private int id_adresu; private String miasto; private String ulica; private
	 * int numer_budynku; private int nr_lokalu; private int id_poczty;
	 */

	/* (C)reate */
	public void save(Addresses address) {

		SimpleJdbcInsert insertActor = new SimpleJdbcInsert(jdbcTemplate);
		insertActor.withTableName("Adresy").usingColumns("miasto", "ulica", "numer_budynku", "nr_lokalu", "id_poczty");
		BeanPropertySqlParameterSource param = new BeanPropertySqlParameterSource(address);
		insertActor.execute(param);
	}

	/* (R)ead */

	public Addresses get(int id) {
		Object[] args = { id };
		String sql = "SELECT * FROM Adresy WHERE Id_adresu = " + args[0];
		Addresses address = jdbcTemplate.queryForObject(sql, BeanPropertyRowMapper.newInstance(Addresses.class));

		return address;
	}

	/* (U)pdate */

	public void update(Addresses address) {

		String sql = "UPDATE Adresy SET miasto=:miasto, ulica=:ulica, numer_budynku=:numer_budynku,nr_lokalu=:nr_lokalu, id_poczty=:id_poczty WHERE id_adresu=:id_adresu";

		BeanPropertySqlParameterSource param = new BeanPropertySqlParameterSource(address);
		NamedParameterJdbcTemplate template = new NamedParameterJdbcTemplate(jdbcTemplate);
		template.update(sql, param);
	}

	/* (D)elete */
	public void delete(int id) {

		String sql = "DELETE FROM Adresy WHERE id_adresu = ?";
		jdbcTemplate.update(sql, id);

	}
}
