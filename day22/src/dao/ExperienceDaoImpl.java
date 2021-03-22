package dao;

import java.sql.SQLException;
import java.util.List;

import model.Experience;
import rowmaper.ExpRowImpl;

public class ExperienceDaoImpl extends AbstractDAO<Experience> implements ExperienceDao {
	  private static final String SELECT_EXPERIENCE_BY_TYPE = "select * from candidate \r\n"
	  		+ "join certificate\r\n"
	  		+ "on candidate.certificated_id = certificate.certificated_id \r\n"
	  		+ "where candidateType = ?";

	@Override
	public Integer insertUser(Experience experience) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Experience> selectExperience(Integer type) {
		
		return query(SELECT_EXPERIENCE_BY_TYPE, new ExpRowImpl(), type);
	}

	@Override
	public List<Experience> selectAllUsers() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteUser(Integer id) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}
	public static void main(String[] args) {
		ExperienceDaoImpl experienceDaoImpl = new ExperienceDaoImpl();
		Integer type =1;
		List<Experience> list = experienceDaoImpl.selectExperience(type);
		for (Experience experience : list) {
			System.out.println(experience);
		}
	}

}
