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
public class PositionsDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public PositionsDAO(JdbcTemplate jdbcTemplate) {
		super();
		this.jdbcTemplate = jdbcTemplate;
	}

	
	public List<Positions> list() {

		String sql = "SELECT * FROM Stanowiska ORDER BY Id_stanowiska";

		List<Positions> listOfPositions = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Positions.class));
		return listOfPositions;

	}

	/*
	private int id_stanowiska;
	private String nazwa_stanowiska;
	private String opis_stanowiska;
	 * */
	
	/* (C)reate */
	public void save(Positions position) {

		SimpleJdbcInsert insertActor = new SimpleJdbcInsert(jdbcTemplate);
		insertActor.withTableName("Stanowiska").usingColumns("nazwa_stanowiska","opis_stanowiska");
		BeanPropertySqlParameterSource param = new BeanPropertySqlParameterSource(position);
		insertActor.execute(param);
	}

	/* (R)ead */

	public Positions get(int id) {
		Object[] args = { id };
		String sql = "SELECT * FROM Stanowiska WHERE Id_stanowiska= " + args[0];
		Positions position = jdbcTemplate.queryForObject(sql, BeanPropertyRowMapper.newInstance(Positions.class));

		return position;
	}

	/* (U)pdate */

	public void update(Positions position) {
			
		String sql = "UPDATE Stanowiska SET nazwa_stanowiska=:nazwa_stanowiska, opis_stanowiska=:opis_stanowiska  WHERE id_stanowiska=:id_stanowiska";

		BeanPropertySqlParameterSource param = new BeanPropertySqlParameterSource(position);
		NamedParameterJdbcTemplate template = new NamedParameterJdbcTemplate(jdbcTemplate);
		template.update(sql, param);
	}

	/* (D)elete */
	public void delete(int id) {
		
		String sql = "DELETE FROM Stanowiska WHERE id_stanowiska = ?";
		jdbcTemplate.update(sql, id);
		
	}

}
