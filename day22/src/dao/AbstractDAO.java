package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import rowmaper.RowMaperG;

public class AbstractDAO<T> implements GenaricDao<T> {
	BaseDao basaDao = new BaseDao();
	Connection connection = this.basaDao.getConnection();

	@Override
	public List<T> query(String sql, RowMaperG<T> rowMapper, Object... parameter) {
		List<T> results = new ArrayList<>();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			preparedStatement = basaDao.getConnection().prepareStatement(sql);
			setParameter(preparedStatement, parameter);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				results.add(rowMapper.mapRow(resultSet));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return null;
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (resultSet != null) {
					resultSet.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
				return null;
			}
		}

		return results;
	}

	private void setParameter(PreparedStatement preparedStatement, Object[] parameter) {
		try {
			for (int i = 0; i < parameter.length; i++) {
				int index = i + 1;
				Object parameters = parameter[i];
				if (parameters instanceof Integer) {
					preparedStatement.setInt(index, (Integer) parameters);
				} else if (parameters instanceof String) {
					preparedStatement.setString(index, (String) parameters);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	 public Integer insert(String sql, Object... parameter) {

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            Integer id = null;
            connection = basaDao.getConnection();
            connection.setAutoCommit(false);
            preparedStatement = connection.prepareStatement(sql, preparedStatement.RETURN_GENERATED_KEYS);
            setParameter(preparedStatement, parameter);
            preparedStatement.executeUpdate();
            resultSet = preparedStatement.getGeneratedKeys();
            if (resultSet.next()) {
                id = resultSet.getInt(1);
            }
            connection.commit();
            return id;
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                connection.rollback();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
                return null;
            }
        }
        return null;
    }

	@Override
	public boolean update(String sql, Object... parameter) {

		 boolean rowUpdate = false;
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        try {
	            connection = basaDao.getConnection();
	            connection.setAutoCommit(false);
	            preparedStatement = connection.prepareStatement(sql);
	            setParameter(preparedStatement,parameter);
	            rowUpdate = preparedStatement.executeUpdate() > 0;
	            connection.commit();
	            return rowUpdate;
	        } catch (SQLException e) {
	            if (connection != null) {
	                try {
	                    connection.rollback();
	                } catch (SQLException throwables) {
	                    throwables.printStackTrace();
	                }
	            }
	        } finally {
	            try {
	                if (connection != null) {
	                    connection.close();
	                }
	                if (preparedStatement != null) {
	                    preparedStatement.close();
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        return rowUpdate;
	}

}
