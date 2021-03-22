package dao;

import java.sql.SQLException;
import java.util.List;

import model.Experience;

public interface ExperienceDao {
	 public Integer insertUser(Experience experience) throws SQLException;

	    public List<Experience> selectExperience(Integer type);

	    public List<Experience> selectAllUsers();

	    public boolean deleteUser(Integer id) throws SQLException;

}
