package rowmaper;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface RowMaperG<T> {
	T mapRow(ResultSet resultSet) throws SQLException;
	
}
