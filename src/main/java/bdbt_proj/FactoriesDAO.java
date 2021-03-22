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
public class FactoriesDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public FactoriesDAO(JdbcTemplate jdbcTemplate) {
		super();
		this.jdbcTemplate = jdbcTemplate;
	}

	
	public List<Factories> list() {

		String sql = "SELECT * FROM Fabryki ORDER BY Id_fabryki";

		List<Factories> listOfFactories = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Factories.class));
		return listOfFactories;

	}
	
	/*
	private int id_fabryki;
	private String specjalizacja;
	private float powierzchnia;
	private String nr_ubezpieczenia;
	private int id_producenta;
	private int id_adresu;
	 */

	/* (C)reate */
	public void save(Factories factory) {

		SimpleJdbcInsert insertActor = new SimpleJdbcInsert(jdbcTemplate);
		insertActor.withTableName("Fabryki").usingColumns("id_fabryki", "specjalizacja", "powierzchnia", 
				"nr_ubezpieczenia", "id_producenta", "id_adresu");
		BeanPropertySqlParameterSource param = new BeanPropertySqlParameterSource(factory);
		insertActor.execute(param);
	}

	/* (R)ead */

	public Factories get(int id) {
		Object[] args = { id };
		String sql = "SELECT * FROM Fabryki WHERE Id_fabryki = " + args[0];
		Factories factory = jdbcTemplate.queryForObject(sql, BeanPropertyRowMapper.newInstance(Factories.class));

		return factory;
	}

	/* (U)pdate */

	public void update(Factories factory) {
		
		//Date d = new SimpleDateFormat().parse;
		//String date = employee.getData_urodzenia().to;
		
		String sql = "UPDATE Fabryki SET specjalizacja=:specjalizacja, powierzchnia=:powierzchnia, nr_ubezpieczenia=:nr_ubezpieczenia, id_producenta=:id_producenta, id_adresu=:id_adresu WHERE id_fabryki=:id_fabryki";

		BeanPropertySqlParameterSource param = new BeanPropertySqlParameterSource(factory);
		NamedParameterJdbcTemplate template = new NamedParameterJdbcTemplate(jdbcTemplate);
		template.update(sql, param);
	}

	/* (D)elete */
	public void delete(int id) {
		
		String sql = "DELETE FROM Fabryki WHERE id_fabryki = ?";
		jdbcTemplate.update(sql, id);
		
	}

}

