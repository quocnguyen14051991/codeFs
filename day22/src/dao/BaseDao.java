package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class BaseDao {
	private Connection connection;
	private String jdbcURL = "jdbc:mysql://localhost:3306/assigmentday2";
	private String jdbcUsername = "root";
	private String jdbcPassword = "123456789";

	public BaseDao()  {
		try {
		
			Class.forName("com.mysql.jdbc.Driver");
			this.connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	public Connection getConnection() {
		return connection;
	}

}
