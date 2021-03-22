package dao;

import java.sql.SQLException;
import java.util.List;

import rowmaper.RowMaperG;

public interface GenaricDao<T> {
   
	List<T> query(String sql, RowMaperG<T> rowMapper, Object... parameter) throws SQLException;

	Integer insert(String sql, Object... parameter);

	boolean update(String sql, Object... parameter);
}
