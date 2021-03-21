package dao;

import rowmaper.RowMapper;

import java.sql.SQLException;
import java.util.List;

public interface GenericDAO<T> {
    /* common cho query */
    <T> List<T> query(String sql, RowMapper<T> rowMapper, Object... parameter) throws SQLException;

    /* common cho insert */
    Integer insert(String sql, Object... parameter);

    /* common cho Update */
    boolean update(String sql, Object... parameter);

}
